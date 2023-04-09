<center><font face="宋体" size=5 weight=xx><b>中国科学技术大学计算机学院</b></font></center>

<center><font face="宋体" size=5><b>《计算机组成原理实验报告》</b></font></center>





![image-20211104134534049](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20211104134534049.png)





<center><font size=5 face="宋体">实验题目：流水线CPU设计</font></center>

<center><font size=5 face="宋体">学生姓名：林宸昊</font></center>

<center><font face="宋体" size=5>学生学号：PB20000034</font></center>

<center><font face="宋体" size=5>完成日期：2022.5.1</font></center>




## 【实验题目】流水线CPU设计

## 【实验目的】

- 理解流水线CPU结构和工作原理；
- 掌握流水线CPU设计和调试方法，尤其是其中数据相关和控制相关的处理；
- 熟练掌握数据通路及控制器的设计和描述方法。

## 【实验环境】VIVADO FPGAOL

## 【实验步骤】

### 【一、整体数据通路】

- 大体框架采用Ripes上所提供的五级流水线数据通路：

  ![image-20220516192421501](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516192421501.png)

- 其中未详细标示的各数据段寄存器以及前递、冒险处理单元参照ppt内容进行整合。

### 【二、CPU设计】

#### 【PC】

- 在数据通路中的位置

  ![image-20220516195411340](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516195411340.png)

- 模块设计

  ```verilog
  module pc5(
      input [31:0] in,
      input pc_en,
      input rst,
      input clk,
      output reg [31:0] out
  );
      always @ (posedge clk or posedge rst)
      begin
          if(rst)
              out <= 32'h0000_3000;
          else if(pc_en)
              out <= in;
          else 
              out <= out;         
      end
  endmodule
  ```

- 模块例化

  ```verilog
  pc5 pc(
      .in(pc_in), 
      .pc_en(pc_en),
      .rst(rst), 
      .clk(clk), 
      .out(pc) 
  );
  ```

  事实上此处的pc_in由图可知，由一个二选一选择器产生，在设计文件中如此表现：

  ```verilog
  wire [31:0] pc_1, pc_0;
  assign pc_0 = pc + 4;
  assign pc_1 = (imm << 1) + pce;	//pce and imm are from ID stage
  wire pcSrc;	//decided by jump or not
  
  mux2_1 MUX_2_1_pc_in(
      .a(pc_0),	
      .b(pc_1),
      .sel(pcSrc),
      .o(pc_in)
  );
  ```

#### 【INS】

- 数据通路中的位置

  ![image-20220516200136104](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516200136104.png)

- 模块例化（同单周期CPU采用分布式只读存储器）

  ```verilog
  dist_mem_gen_0 ins_mem(
      .a(pc[9:2]), 
      .spo(INS)
  );
  ```

#### 【IFID】

- 数据通路中的位置

  ![image-20220516200336581](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516200336581.png)

  涉及传递信号：pcd, pcin, ir

- 模块设计

  ```verilog
  module IFID(
      input clk,
      input rs1_en, rs1_clr,
      input [31:0] pc, pc_0, 
      input [31:0] INS,
      output reg [31:0] pcd, pcin, ir
      );
      always @(posedge clk) 
      begin
          if (rs1_clr)	//clear if needed
          begin
              ir <= 0;
              pcd <= 0;
              pcin <= 0;
          end 
          else if(rs1_en)		//else herit from last stage
          begin
              ir <= INS;
              pcd <= pc;
              pcin <= pc_0;
          end 
          else begin 			//else keep
              ir <= ir;
              pcd <= pcd;
              pcin <= pcin;
          end
      end
  endmodule
  ```

- 模块例化

  ```verilog
  IFID IFID(
      .clk(clk),
      .rs1_en(rs1_en),	//enable signal from hazard
      .rs1_clr(rs1_clr),	//clear signal from hazard
      .pc(pc),
      .pc_0(pc_0),		
      .INS(INS),
      .pcin(pcin),		//pc_0 to pcin
      .pcd(pcd),			//pc to pcd
      .ir(ir)				//INS to ir
  );
  ```

#### 【controler——即control信号产生器（对应ppt）】

- 数据通路中的位置

  ![image-20220516201057915](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516201057915.png)

- 模块设计

  ```verilog
  module controler(
      input [6:0] ins,			//ir signal
      input [1:0] a_fwd, b_fwd,	//from forward
      output reg [31:0] control	//control signal
  );
      parameter ALUresult = 2'b01;
      parameter DataMem = 2'b10;
      parameter PCadd4 = 2'b11;
      parameter IDIE = 2'b00;
      always @ (*) 
      begin
          //首先处理默认信号以及输入信号（非自我产生）
          control[31:26] = 0;
          control[23:22] = 0;
          control[19] = 0;
          control[15:14] = 0;
          control[11:10] = 0;
          control[7:6] = 0;
          control[25:24] = a_fwd;
          control[21:20] = b_fwd;
          case(ins)
              7'b0110011: 
              begin   //add
                  control[3:0] = 4'b0000; //alu_op
                  control[5:4] = 2'b11;	//a_sel && b_sel 
                  control[9:8] = 2'b00;	//jal && br
                  control[13:12] = 2'b00; //m_rd && m_wr		
                  control[17:16] = 2'b01; //wb_sel, 01 means choosing ALUres
                  control[18] = 1;		//rf_wr
              end
              7'b0010011: 
              begin   //addi
                  control[3:0] = 4'b0000;
                  control[5:4] = 2'b10;
                  control[9:8] = 2'b00;
                  control[13:12] = 2'b00;
                  control[17:16] = 2'b01; //choose ALUres
                  control[18] = 1;
              end
              7'b0000011: 
              begin   //lw
                  control[3:0] = 4'b0000;
                  control[5:4] = 2'b10;
                  control[9:8] = 2'b00;
                  control[13:12] = 2'b10;
                  control[17:16] = 2'b10; //choose data from memory
                  control[18] = 1;
              end
              7'b0100011: 
              begin   //sw
                  control[3:0] = 4'b0000;
                  control[5:4] = 2'b10;
                  control[9:8] = 2'b00;
                  control[13:12] = 2'b01;
                  control[17:16] = 2'b00; //choose data from IDIE
                  control[18] = 0;
              end
              7'b1100011: 
              begin   //beq
                  control[3:0] = 4'b0001;
                  control[5:4] = 2'b11;
                  control[9:8] = 2'b01;
                  control[13:12] = 2'b00;
                  control[17:16] = 2'b00; //choose data from IDIE
                  control[18] = 0;
              end
              7'b1101111: 
              begin   //jal
                  control[3:0] = 4'b0000;
                  control[5:4] = 2'b00;
                  control[9:8] = 2'b10;
                  control[13:12] = 2'b00;
                  control[17:16] = 2'b11; //choose pc + 4
                  control[18] = 1;
              end
              default: 
              begin   
                  control[3:0] = 4'b0000;
                  control[5:4] = 2'b00;
                  control[9:8] = 2'b00;
                  control[13:12] = 2'b00;
                  control[17:16] = 2'b00;
                  control[18] = 0;
              end
          endcase
      end
  endmodule
  ```

- 模块例化

   ```verilog
   controler controler(
       .ins(ir[6:0]),
       .a_fwd(a_fwd),
       .b_fwd(b_fwd),
       .control(control)	//original signal
   );
   ```

#### 【registers】

- 数据通路中的位置

  ![image-20220516203317871](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516203317871.png)

- 模块设计

  ```verilog
  module registers # (parameter WIDTH = 32) (
      input clk,
      input [4:0] ra0,
      output reg [WIDTH - 1:0] rd0,
      input [4:0] ra1,
      output reg [WIDTH - 1:0] rd1,
      input [4:0] wa,
      input we,
      input [WIDTH - 1:0] wd,
      input [7:0] ra2,
      output reg [WIDTH - 1:0] rd_debug
  );
  
      reg [WIDTH - 1:0] regfile [31:0];
      initial
      begin
      regfile[0] = 0;
      regfile[1] = 0;
      regfile[2] = 0;
      regfile[3] = 0;
      regfile[4] = 0;
      regfile[5] = 0;
      regfile[6] = 0;
      regfile[7] = 0;
      regfile[8] = 0;
      regfile[9] = 0;
      regfile[10] = 0;
      regfile[11] = 0;
      regfile[12] = 0;
      regfile[13] = 0;
      regfile[14] = 0;
      regfile[15] = 0;
      regfile[16] = 0;
      regfile[17] = 0;
      regfile[18] = 0;
      regfile[19] = 0;
      regfile[20] = 0;
      regfile[21] = 0;
      regfile[22] = 0;
      regfile[23] = 0;
      regfile[24] = 0;
      regfile[25] = 0;
      regfile[26] = 0;
      regfile[27] = 0;
      regfile[28] = 0;
      regfile[29] = 0;
      regfile[30] = 0;
      regfile[31] = 0;
      end
  
      always @ (*) begin	//基本与单周期一致，此处额外处理以满足写优先
          if(we)
          begin
                  if(wa == ra0)
                      rd0 = wd;
                  else
                      rd0 = regfile[ra0];
                  if(wa == ra1)
                      rd1 = wd;
                  else
                      rd1 = regfile[ra1];
                  if(wa == ra2)
                      rd_debug = wd;
                  else
                      rd_debug = regfile[ra2];
           end
           else
           begin
                  rd0 = regfile[ra0];
                  rd1 = regfile[ra1];
                  rd_debug = regfile[ra2];
              end
       end
  
      always  @ (posedge  clk)
          if (we) 
              if(wa == 0)
              begin
                  regfile[wa] <= 0;
              end
              else 
              begin
                  regfile[wa] <= wd;
              end
  endmodule
  
  ```

- 模块例化

  ```verilog
  register_file Registers(
      .clk(clk),
      .ra0(ir[19:15]),   			//rs1
      .rd0(ReadData1_reg),    
      .ra1(ir[24:20]),   			//rs2
      .rd1(ReadData2_reg),    
      .wa(rdw),     				//dest from MEM stage
      .we(ctrlw[18]),      
      .wd(WriteData),				//write
      .ra2(m_rf_addr[7:0]),       //used for debug
      .rd_debug(rf_data[31:0])    //used for debug
  );
  ```

#### 【immediate generator】

- 与单周期一致。

#### 【IDEX】

- 数据通路中的位置

  ![image-20220516203744415](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516203744415.png)

  涉及传递信号：ctrl, pce, pcin2, a, b, imm, ra1, ra2, rd

- 模块设计

  ~~~verilog
  module IDEX(
      input clk,
      input rs2_en, rs2_clr,
      input [31:0] control,
      input [31:0] pcin, pcd,
      input [31:0] rs1, rs2,
      input [31:0] ir, Immgen,
      output reg[31:0] ctrl,
      output reg[31:0] pce, pcin2,
      output reg[31:0] a, b,
      output reg[31:0] imm,
      output reg[4:0] rd, ra1, ra2
      );
      initial begin
          ctrl = 0;
          a = 0;
          b = 0;
      end
      always @(posedge clk) 
      begin
          if(rs2_clr)
          begin
              ctrl <= 0;
              pcin2 <= 0;
              pce <= 0;
              a <= 0;
              b <= 0;
              imm <= 0;
              rd <= 0;
              ra1 <= 0;
              ra2  <= 0;
          end 
          else if(rs2_en)
          begin
              ctrl <= control;
              pcin2 <= pcin;
              pce <= pcd;
              a <= rs1;
              b <= rs2;
              imm <= Immgen;
              rd <= ir[11:7];
              ra1 <= ir[19:15];
              ra2 <= ir[24:20];
          end 
          else 
          begin
              ctrl <= ctrl ;
              pcin2 <= pcin2;
              pce <= pce  ;
              a <= a    ;
              b <= b    ;
              imm <= imm  ;
              rd <= rd   ;
              ra1 <= ra1  ;
              ra2 <= ra2  ;
          end 
      end
  endmodule
  ~~~

- 模块例化

  ```verilog
  IDEX IDEX(
      .clk(clk),
      .control(control),
      .ctrl(ctrl),			//control to ctrl
      .rs1(ReadData1_reg),
      .rs2(ReadData2_reg),
      .a(a),					//rs1 to a
      .b(b),					//rs2 to b
      .Immgen(Immgen),
      .imm(imm),  			//Immgen to imm
      .ir(ir), 
      .rd(rd),				//ir[11:7]
      .ra1(ra1),				//ir[19:15]
      .ra2(ra2),				//ir[24:20]
      .pcin(pcin),
      .pcin2(pcin2),			//pcin to pcin2
  	.pcd(pcd),				
      .pce(pce),				//pcd to pce
      .rs2_en(rs2_en),		//from hazard
      .rs2_clr(rs2_clr)		//from hazard
  );
  ```

#### 【alu】

- 与单周期一致，直接沿用；

- 模块例化

  ```verilog
  alu alu(
      .a(op1),
      .b(op2),
      .f(ctrl[3:0]),
      .y(ALU_result),
      //.blt(blt),
      .z(ALU_zero)
      //.less(ALU_less)
  );
  ```

#### 【EXMEM】

- 数据通路中的位置

  ![image-20220516204456365](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516204456365.png)

  涉及传递的信号：ctrlm, y, bm, pcin3, rdm, zero

- 模块设计

  ```verilog
  module EXMEM(
      input clk,
      input [31:0] ALU_result, op2, ctrl, pcin2, zero_n, ALU_zero,
      input [4:0] rd, 
      output reg [31:0] ctrlm, y, bm, pcin3,
      output reg [4:0] rdm,
      output reg zero
  );
      always @ (posedge clk) 
      begin
          y <= ALU_result;
          zero <= ALU_zero;
          bm <= op2;
          ctrlm <= ctrl;
          pcin3 <= pcin2;
          rdm <= rd;
      end
  endmodule
  ```

- 模块例化

  ```verilog
  EXMEM EXMEM(
      .clk(clk),
  	.ALU_result(ALU_result),
      .y(y),						//ALU_result to y
      .ALU_zero(ALU_zero),
      .zero(zero),				//ALU_zero to zero
      .op_r(op_r),					
      .bm(bm),					//op_r to bm
      							//事实上此处的op_r并非直接进入alu的op2，还需要与
      							//imm竞争
     	.ctrl(ctrl),
      .ctrlm(ctrlm)，			   //ctrl to ctrlm
      .rd(rd),
      .rdm(rdm),					//rd to rdm
      .pcin2(pcin2),
      .pcin3(pcin3)				//pcin2 to pcin3
  );
  ```

#### 【data memory】

- 数据通路中的位置

  ![image-20220516204749057](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516204749057.png)

- 模块例化（采用同单周期一致的双端口分布式存储器）

  ~~~verilog
  assign we = ctrlm[12] && (~y[10]);	//write or not
  
  dist_mem_gen_1 data_mem( 
      .a(y[9:2]), 
      .d(bm), 
      .dpra(m_rf_addr[7:0]),  //second address
      .dpo(m_data[31:0]),     //ReadData2    
      .clk(clk),  
      .we(we), 
      .spo(ReadData1_data) 	//ReadData1
  );
  ~~~

#### 【MEMWB】

- 数据通路中的位置

  ![image-20220516205701992](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516205701992.png)

  涉及传递的信号：rdw, yw, mdr, ctrlw, pcin4

- 模块设计

  ```verilog
  module MEMWB(
      input clk,
      input [4:0] rdm,
      input [31:0] y, ReadData, ctrlm, pcin3,
      output reg [31:0] yw, mdr, ctrlw, pcin4,
      output reg [4:0] rdw
      );
      always @(posedge clk) 
      begin
          rdw <= rdm;
          yw <= y;
          mdr <= ReadData;
          ctrlw <= ctrlm;
          pcin4 <= pcin3;
      end
  endmodule
  ```

- 模块例化

  ```verilog
  mux2_1 MUX_2_1_data_mem(
      .a(ReadData1_data),
      .b(io_din[31:0]),
      .sel(y[10]),
      .o(MUX_2_1_out_data)    
  );
  
  
  MEMWB MEMWB(
      .clk(clk),
      .rdm(rdm),
      .rdw(rdw),						//rdm to rdw
      .y(y),
      .yw(yw),						//y to yw
      .ctrlm(ctrlm),
      .ctrlw(ctrlw),					//ctrlm to ctrlm
      .ReadData(MUX_2_1_out_data),
      .mdr(mdr),						//io_din or read from data memory
      .pcin3(pcin3),
      .pcin4(pcin4)					//pcin3 to pcin4
  );
  ```

#### 【WriteData——寄存器写入数据的处理】

- 数据通路中的位置

  ![image-20220516210307613](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516210307613.png)

- 模块设计

  ```verilog
  always @ (*) begin
      case(ctrlw[17:16])
          2'b01:WriteData = yw;     
          2'b10:WriteData = mdr;    
          2'b11:WriteData = pcin4;  
          default:WriteData = 0;
      endcase
  end
  ```

#### 【op1 && op2】

- 数据通路中的位置

  ![image-20220516210459026](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516210459026.png)

- 模块设计

  ```verilog
  always @(*) begin	
      case (control[25:24])		//a_fwd
          2'b00:op1 = a;
          2'b01:op1 = y;
          2'b10:op1 = WriteData; 
      endcase
  end
  
  always @(*) begin
      case (control[21:20])		//b_fwd
          2'b00:op_r = b;
          2'b01:op_r = y;
          2'b10:op_r = WriteData;
          default:op_r = LastWriteData; 
      endcase
  end
  
  mux2_1 MUX_2_1_pc(
      .a(imm),
      .b(op_r),
      .sel(ctrl[4]),
      .o(op2)
  );
  ```

  值得注意的是，不同处选择的是不同阶段传递得到的control信号，如是否选择立即数取决于EXMEM阶段所产生的ctrl信号而非直接产生的control信号。

#### 【forwarding unit】

- 数据通路中的位置

  ![image-20220516211132224](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20220516211132224.png)

- 模块设计

  ```verilog
  module forward(
      input [4:0] ra1, ra2, rdm, rdw,
      input wr_m, wr_w,
      output reg [1:0] a_fwd, b_fwd
      );
      always @ (*) begin
          if(wr_m && ra1 == rdm)			//寄存器写入且需要读取的寄存器与EXMEM阶段
              							//写入的目标相同，进行数据前递
              a_fwd = 2'b01;
          else if(wr_w && ra1 == rdw)		//寄存器写入且需要读取的寄存器与MEMWB阶段
              							//写入的目标相同，进行数据前递
              a_fwd = 2'b10;
          else a_fwd = 2'b00;
      end
      always @ (*) begin
          if(wr_m && ra2 == rdm)
              b_fwd = 2'b01;
          else if(wr_w && ra2 == rdw)
              b_fwd = 2'b10;
          else b_fwd = 2'b00;
      end
  endmodule
  ```

- 模块例化

  ```verilog
  forward forwarding_unit(
      .a_fwd(a_fwd),
      .b_fwd(b_fwd),
      .ra1(ra1),
      .ra2(ra2),
      .rdm(rdm),
      .rdw(rdw),
      .rdf(rdf),
      .wr_m(ctrlm[18]),
      .wr_w(ctrlw[18]),
  );
  ```

  

## 【总结与思考】





