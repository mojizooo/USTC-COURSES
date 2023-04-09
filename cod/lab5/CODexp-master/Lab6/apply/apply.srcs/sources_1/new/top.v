`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/24 10:33:43
// Design Name: 
// Module Name: top
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

module top(
input               clk,rst,
input               rx,
output              tx,
    input [31:0] pcin, pc, pcd, pce,
    input [31:0] ir, imm, mdr,
    input [31:0] a, b, y, bm, yw,
    input [4:0]  rd, rdm, rdw,
    input [31:0] ctrl, ctrlm, ctrlw,
    output [31:0]  rd_addr,
    input [31:0]  rdd ,
    output wr_en,
    output [31:0] wr_data,
    output [31:0] wr_addr
);

parameter   C_IDLE          = 4'b0000;
parameter   C_CMD_DC        = 4'b0010;
parameter   C_CMD_WB        = 4'b0011;
parameter   C_CMD_RB        = 4'b0100;
parameter   C_CMD_ERR       = 4'b0111;
parameter   C_TXFIFO_WR     = 4'b0101;
parameter   C_TXFIFO_WAIT   = 4'b0110;
wire                tx_ready;
wire        [7:0]   tx_data;
wire        [7:0]   rx_data;

reg         [3:0]   curr_state;
reg         [3:0]   next_state;

wire                is_wb_cmd;
wire                is_rb_cmd;
reg                 flag;
reg         [3:0]   tx_byte_cnt;

reg         [3:0]   rx_byte_cnt;
reg         [7:0]   rx_byte_buff_0;
reg         [7:0]   rx_byte_buff_1;
reg         [7:0]   rx_byte_buff_2;
reg         [7:0]   rx_byte_buff_3;
reg         [7:0]   rx_byte_buff_4;
reg         [7:0]   rx_byte_buff_5;
reg         [7:0]   rx_byte_buff_6;
reg         [7:0]   rx_byte_buff_7;

reg         [7:0]   tx_byte_buff_0;
reg         [7:0]   tx_byte_buff_1;
reg         [7:0]   tx_byte_buff_2;
reg         [7:0]   tx_byte_buff_3;
reg         [7:0]   tx_byte_buff_4;
reg         [7:0]   tx_byte_buff_5;
reg         [7:0]   tx_byte_buff_6;
reg         [7:0]   tx_byte_buff_7;
reg         [7:0]   tx_byte_buff_8;

reg                 rx_fifo_en;
wire     [31:0]      rx_fifo_data;
wire                rx_fifo_empty;

reg                 wr_en;
reg      [31:0]      wr_addr;
reg      [31:0]      wr_data;

reg                 rd_en;
reg      [31:0]      rd_addr;
reg      [31:0]      rd_data;

reg      [31:0]      tx_fifo_din;
reg                 tx_fifo_wr_en;
wire                tx_fifo_full;
wire                tx_fifo_empty;
always@(posedge clk or posedge rst)
begin
    if(rst)
    begin
        tx_fifo_wr_en   <= 1'b0;
        tx_fifo_din     <= 8'h0;
    end
    else if(curr_state==C_TXFIFO_WR)
    begin
        tx_fifo_wr_en   <= 1'b1;
        case(tx_byte_cnt)
            4'h8:   tx_fifo_din <= tx_byte_buff_8;
            4'h7:   tx_fifo_din <= tx_byte_buff_7;
            4'h6:   tx_fifo_din <= tx_byte_buff_6;
            4'h5:   tx_fifo_din <= tx_byte_buff_5;
            4'h4:   tx_fifo_din <= tx_byte_buff_4;
            4'h3:   tx_fifo_din <= tx_byte_buff_3;
            4'h2:   tx_fifo_din <= tx_byte_buff_2;
            4'h1:   tx_fifo_din <= tx_byte_buff_1;
            4'h0:   tx_fifo_din <= tx_byte_buff_0;
            default:tx_fifo_din <= 8'h0;
        endcase
    end
    else
    begin
        tx_fifo_wr_en   <= 1'b0;
        tx_fifo_din     <= 8'h0;
    end
end

always@(posedge clk or posedge rst)
begin
    if(rst)
    begin
        rd_en        <= 1'b0;
        rd_addr[7:4] <= 4'h0; 
        rd_addr[3:0] <= 4'h0; 
        flag <= 0;
    end    
    else if(curr_state==C_CMD_RB)
    begin
        rd_en   <= 1'b1;
        if(rx_byte_buff_1[1])
        begin
        rd_addr[5] <= rx_byte_buff_1[1];
        rd_addr[4] <= rx_byte_buff_2[0];
        rd_addr[3] <= rx_byte_buff_3[0];
        rd_addr[2] <= rx_byte_buff_4[0];
        rd_addr[1] <= rx_byte_buff_5[0];
        rd_addr[0] <= rx_byte_buff_6[0];
        end
        else begin
        rd_addr[4] <= rx_byte_buff_1[0];
        rd_addr[3] <= rx_byte_buff_2[0];
        rd_addr[2] <= rx_byte_buff_3[0];
        rd_addr[1] <= rx_byte_buff_4[0];
        rd_addr[0] <= rx_byte_buff_5[0];
        flag <= 0;
        end
    end    
    else
    begin
        rd_en   <= 1'b0;
        rd_addr[7:4] <= 4'h0; 
        rd_addr[3:0] <= 4'h0; 
    end    
end   
always@(posedge clk or posedge rst)
begin
    if(rst)
        tx_byte_cnt <= 4'h0;
    else if(curr_state==C_IDLE)
        tx_byte_cnt <= 4'h0;
    else if(curr_state==C_CMD_RB)//??????????????????ASCII?????§Ù????³0f\n??
        tx_byte_cnt <= 4'h8;
    else if(curr_state==C_CMD_ERR)//???????????????????ERROR??\n??
        tx_byte_cnt <= 4'h6;
    else if(curr_state==C_TXFIFO_WR)
    begin
        if(tx_byte_cnt!=4'h0)
            tx_byte_cnt <= tx_byte_cnt - 4'h1;
    end
end

always@(posedge clk or posedge rst)
begin
    if(rst)
    begin
        tx_byte_buff_0  <= 8'h0;
        tx_byte_buff_1  <= 8'h0;
        tx_byte_buff_2  <= 8'h0;
        tx_byte_buff_3  <= 8'h0;
        tx_byte_buff_4  <= 8'h0;
        tx_byte_buff_5  <= 8'h0;
        tx_byte_buff_6  <= 8'h0;
        tx_byte_buff_7  <= 8'h0;
        tx_byte_buff_8  <= 8'h0;
    end
    else if(curr_state==C_IDLE)
    begin
        tx_byte_buff_0  <= 8'h0;
        tx_byte_buff_1  <= 8'h0;
        tx_byte_buff_2  <= 8'h0;
        tx_byte_buff_3  <= 8'h0;
        tx_byte_buff_4  <= 8'h0;
        tx_byte_buff_5  <= 8'h0;
        tx_byte_buff_6  <= 8'h0;
        tx_byte_buff_7  <= 8'h0;
        tx_byte_buff_8  <= 8'h0;
    end
    else if(curr_state==C_CMD_RB)
    begin
        tx_byte_buff_0  <= "\n";
        if(rd_data[31:28]<=4'h9)//0~9
            tx_byte_buff_8  <= {4'h3,rd_data[31:28]};
        else
            tx_byte_buff_8  <= rd_data[31:28] - 4'ha + "a";
            if(rd_data[27:24]<=4'h9)//0~9
            tx_byte_buff_7  <= {4'h3,rd_data[27:24]};
        else
            tx_byte_buff_7  <= rd_data[27:24] - 4'ha + "a";
            if(rd_data[23:20]<=4'h9)//0~9
            tx_byte_buff_6  <= {4'h3,rd_data[23:20]};
        else
            tx_byte_buff_6  <= rd_data[23:20] - 4'ha + "a";
            if(rd_data[19:16]<=4'h9)//0~9
            tx_byte_buff_5  <= {4'h3,rd_data[19:16]};
        else
            tx_byte_buff_5  <= rd_data[19:16] - 4'ha + "a";
            if(rd_data[15:12]<=4'h9)//0~9
            tx_byte_buff_4  <= {4'h3,rd_data[15:12]};
        else
            tx_byte_buff_4  <= rd_data[15:12] - 4'ha + "a";
        
        if(rd_data[11:8]<=4'h9)//0~9
            tx_byte_buff_3  <= {4'h3,rd_data[11:8]};
        else
            tx_byte_buff_3  <= rd_data[11:8] - 4'ha + "a";
        if(rd_data[7:4]<=4'h9)//0~9
            tx_byte_buff_2  <= {4'h3,rd_data[7:4]};
        else
            tx_byte_buff_2  <= rd_data[7:4] - 4'ha + "a";
            if(rd_data[3:0]<=4'h9)//0~9
            tx_byte_buff_1  <= {4'h3,rd_data[3:0]};
        else
            tx_byte_buff_1  <= rd_data[3:0] - 4'ha + "a";
    end
    else if(curr_state==C_CMD_ERR)
    begin
        tx_byte_buff_6  <= "E";
        tx_byte_buff_5  <= "R";
        tx_byte_buff_4  <= "R";
        tx_byte_buff_3  <= "O";
        tx_byte_buff_2  <= "R";
        tx_byte_buff_1  <= "!";
        tx_byte_buff_0  <= "\n";
    end
end


always@(posedge clk or posedge rst)
begin
    if(rst)
        curr_state  <= C_IDLE;
    else
        curr_state  <= next_state;
end
always@(*)
begin
    case(curr_state)
        C_IDLE:
            if((rx_vld==1'b1)&&(rx_data==8'h0a)) //??????§Ù???????????????????ÞFIFO??
                next_state  = C_CMD_DC;
            else
                next_state  = C_IDLE;
        C_CMD_DC:
            if(rx_fifo_empty)
            begin
                if(is_wb_cmd)
                    next_state  = C_CMD_WB;
                else if(is_rb_cmd)
                    next_state  = C_CMD_RB;
                else
                    next_state  = C_CMD_ERR;
            end
            else
                next_state  = C_CMD_DC;
        C_CMD_WB:
            next_state  = C_IDLE;
        C_CMD_RB:
            if(rd_en==1'b1)
                next_state  = C_TXFIFO_WR;
            else
                next_state  = C_CMD_RB;
        C_CMD_ERR:
            next_state  = C_TXFIFO_WR;
        C_TXFIFO_WR:
            if(tx_byte_cnt==4'h0)
                next_state = C_TXFIFO_WAIT;
            else
                next_state = C_TXFIFO_WR;
        C_TXFIFO_WAIT:
            if(tx_fifo_empty)
                next_state = C_IDLE;
            else
                next_state = C_TXFIFO_WAIT;
        default:
            next_state      = C_IDLE;
    endcase
end

always@(posedge clk or posedge rst)
begin
    if(rst)
        rx_fifo_en  <= 1'b0;
    else if(curr_state==C_CMD_DC)
        rx_fifo_en  <= 1'b1;
    else
        rx_fifo_en  <= 1'b0;
end
always@(posedge clk or posedge rst)//?????????????????????§Ö???????
begin
    if(rst)
        rx_byte_cnt <= 4'h0;
    else if(curr_state==C_CMD_DC)
    begin
        if((rx_fifo_en)&&(rx_fifo_empty==1'b0)&&(rx_byte_cnt<4'hf))
            rx_byte_cnt <= rx_byte_cnt + 4'b1;
    end
    else
        rx_byte_cnt <= 4'h0;
end
always@(posedge clk or posedge rst)
begin
    if(rst)
    begin
        rx_byte_buff_0  <= 8'h0;
        rx_byte_buff_1  <= 8'h0;
        rx_byte_buff_2  <= 8'h0;
        rx_byte_buff_3  <= 8'h0;
        rx_byte_buff_4  <= 8'h0;
        rx_byte_buff_5  <= 8'h0;
        rx_byte_buff_6  <= 8'h0;
        rx_byte_buff_7  <= 8'h0;
        flag <= 0;
    end
    else if(curr_state==C_IDLE)
    begin
        rx_byte_buff_0  <= 8'h0;
        rx_byte_buff_1  <= 8'h0;
        rx_byte_buff_2  <= 8'h0;
        rx_byte_buff_3  <= 8'h0;
        rx_byte_buff_4  <= 8'h0;
        rx_byte_buff_5  <= 8'h0;
        rx_byte_buff_6  <= 8'h0;
        rx_byte_buff_7  <= 8'h0;
    end
    else if(curr_state==C_CMD_DC)
    begin
        case(rx_byte_cnt)
            4'h0:   rx_byte_buff_0 <= rx_fifo_data;
            4'h1:   rx_byte_buff_1 <= rx_fifo_data;
            4'h2:   rx_byte_buff_2 <= rx_fifo_data;
            4'h3:   rx_byte_buff_3 <= rx_fifo_data;
            4'h4:   rx_byte_buff_4 <= rx_fifo_data;
            4'h5:   rx_byte_buff_5 <= rx_fifo_data;
            4'h6:   rx_byte_buff_6 <= rx_fifo_data;
            4'h7:   rx_byte_buff_7 <= rx_fifo_data;
        endcase
    end
end 
assign  is_wb_cmd = (curr_state==C_CMD_DC)
                    &&(rx_byte_buff_1=="w")
                    &&(rx_byte_buff_2==" ")&&(rx_byte_buff_5==" ")
                    ;
assign  is_rb_cmd = (curr_state == C_CMD_DC)  && ~is_wb_cmd;
/*&&(((rx_byte_buff_0>="0")&&(rx_byte_buff_0<="9")) || rx_byte_buff_0 == "r")
&&(((rx_byte_buff_1>="0")&&(rx_byte_buff_1<="9")))
&&(((rx_byte_buff_2>="0")&&(rx_byte_buff_2<="9")))
                    &&(((rx_byte_buff_3>="0")&&(rx_byte_buff_3<="9")))
                    &&(((rx_byte_buff_4>="0")&&(rx_byte_buff_4<="9")))
                     ;*/
                    
always@(posedge clk or posedge rst)
begin
    if(rst)
    begin
        wr_en   <= 1'b0;
        wr_addr[7:4] <= 4'h0;
        wr_addr[3:0] <= 4'h0;
        wr_data[7:4] <= 4'h0;
        wr_data[3:0] <= 4'h0;
    end
    else if(curr_state == C_CMD_WB)
    begin
            wr_en   <= 1'b1;
            wr_addr[7:4] <= rx_byte_buff_3[3:0];
            wr_addr[3:0] <= rx_byte_buff_4[3:0];
            wr_data[7:4] <= rx_byte_buff_6[3:0];
            wr_data[3:0] <= rx_byte_buff_7[3:0];
    end
    else
    begin
        wr_en   <= 1'b0;
        wr_addr[7:4] <= 4'h0;
        wr_addr[3:0] <= 4'h0;
        wr_data[7:4] <= 4'h0;
        wr_data[3:0] <= 4'h0;
    end
end    


rx                  rx_inst(
.clk                (clk),
.rst                (rst),
.rx                 (rx),
.rx_vld             (rx_vld),
.rx_data            (rx_data)
);                     
tx                  tx_inst(
.clk                (clk),
.rst                (rst),
.tx                 (tx ),
.tx_ready           (~tx_fifo_empty),
.tx_rd              (tx_rd),
.tx_data            (tx_data)
);

fifo_generator_0      rx_fifo( //??????ä¬???????????
.clk                (clk), 
.rst                (rst), 
.din                (rx_data), 
.wr_en              (rx_vld), 
.rd_en              (rx_fifo_en), 
.dout               (rx_fifo_data), 
.full               (), 
.empty              (rx_fifo_empty)
);

fifo_generator_0      tx_fifo( //??????Ÿ???????????????????
.clk                (clk), 
.rst                (rst), 
.din                (tx_fifo_din), 
.wr_en              (tx_fifo_wr_en), 
.rd_en              (tx_rd), 
.dout               (tx_data), 
.full               (tx_fifo_full), 
.empty              (tx_fifo_empty)
);


always@(*)
begin
    if(rd_en)
    begin
        if(rd_addr[5])
        begin
        rd_data = rdd;
        end
        else 
        case(rd_addr[7:0])
            8'h0:   rd_data = 32'haaaaaaaa;
            8'h01:  rd_data = pcd;
            8'h02:  rd_data = ir;
            8'h03:  rd_data = pcin;
            8'h08:  rd_data = pce;
            8'h09:  rd_data = a;
            8'h0a:  rd_data = b;
            8'h0b:  rd_data = imm;
            8'h0c:  rd_data = rd;
            8'h0d:  rd_data = ctrl;
            8'h10:  rd_data = y;
            8'h11:  rd_data = bm;
            8'h12:  rd_data = rdm;
            8'h13:  rd_data = ctrlm;
            8'h18:  rd_data = yw;
            8'h19:  rd_data = mdr;
            8'h1a:  rd_data = rdw;
            8'h1b:  rd_data = ctrlw;
            //....to be added...
            default:rd_data = 8'h0;
        endcase
    end
    else
        rd_data = 31'h0;
end


endmodule
