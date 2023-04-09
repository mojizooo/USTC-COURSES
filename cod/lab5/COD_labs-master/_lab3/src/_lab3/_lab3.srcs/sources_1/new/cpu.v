`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/10 15:27:21
// Design Name: 
// Module Name: cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cpu(
    input clk,rst//clock,reset
    );
wire [31:0] n_pc,n_pc_j,n_pc_j_m,n_pc_b,n_pc_b_m;
reg [31:0] pc;
wire [4:0] wa;
wire [31:0] instruct,rs,rt,wd,ex_data,n_pc_b_b,aluout,alu_b,dataout,wd_rf;
wire zf,cf,of,b_n,zero_control; 
reg RegDst,jump,branch,MemtoReg,Memwe,ALUSrc,Regwe;
reg [1:0] ALUop;
reg [2:0] alu_op;
inst instruction(pc[9:2],instruct);
data_mem data1(aluout[9:2],rt,aluout[9:2],clk,Memwe,dataout);
assign n_pc=pc+32'd4;
assign ex_data=instruct[15]?{16'hffff,instruct[15:0]}:{16'h0000,instruct[15:0]};
assign n_pc_b_b=ex_data<<2;
assign n_pc_b=n_pc+n_pc_b_b;
assign n_pc_j={n_pc[31:28],instruct[25:0],2'd0};
assign b_n=branch&zf;
assign n_pc_b_m=b_n?n_pc_b:n_pc;
assign n_pc_j_m=jump?n_pc_j:n_pc_b_m;
assign zero_control=(wa==5'd0);
assign wd_rf=zero_control?32'd0:wd;
assign wd=MemtoReg?dataout:aluout;
assign wa=RegDst?instruct[15:11]:instruct[21:16];
reg_file reg_file1(clk,instruct[25:21],rs,instruct[20:16],rt,wa,Regwe,wd_rf);
assign alu_b=ALUSrc?ex_data:rt;
alu #(32) ALU1(aluout,zf,cf,of,rs,alu_b,alu_op);
//pc
always @(posedge clk,posedge rst)
    begin
        if(rst)
            pc<=32'd0;
        else
        pc<=n_pc_j_m;
    end
//Control Unit
always @*
    begin
        case(instruct[31:26])
        6'b000000:begin//add
                    RegDst=1;
                    jump=0;
                    branch=0;
                    MemtoReg=0;
                    ALUop=2'd00;
                    Memwe=0;
                    ALUSrc=0;
                    Regwe=1;
                   end
        6'b001000:begin//addi
                    RegDst=0;
                    jump=0;
                    branch=0;
                    MemtoReg=0;
                    ALUop=2'd00;
                    Memwe=0;
                    ALUSrc=1;
                    Regwe=1;
                   end
        6'b100011:begin//lw
                    RegDst=0;
                    jump=0;
                    branch=0;
                    MemtoReg=1;
                    ALUop=2'd00;
                    Memwe=0;
                    ALUSrc=1;
                    Regwe=1;
                   end         
        6'b101011:begin//sw
                    RegDst=1;
                    jump=0;
                    branch=0;
                    MemtoReg=0;
                    ALUop=2'd00;
                    Memwe=1;
                    ALUSrc=1;
                    Regwe=0;
                   end     
        6'b000100:begin//beq
                    RegDst=0;
                    jump=0;
                    branch=1;
                    MemtoReg=0;
                    ALUop=2'd01;
                    Memwe=0;
                    ALUSrc=0;
                    Regwe=0;
                   end      
        6'b000010:begin//j
                    RegDst=0;
                    jump=1;
                    branch=0;
                    MemtoReg=0;
                    ALUop=2'd00;
                    Memwe=0;
                    ALUSrc=0;
                    Regwe=0;
                   end                                           
        endcase
    end
//ALU Control Unit
always @*
    begin
        case(ALUop)
            2'b00:alu_op=3'b000;
            2'b01:alu_op=3'b001;
        endcase
    end
endmodule
