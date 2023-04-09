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
output reg  [7:0]   led,
input       [7:0]   sw
);

parameter   C_IDLE      = 4'b0000;//����״̬�����յ��������ݺ���ת����һ״̬C_CMD_RX
parameter   C_CMD_RX    = 4'b0001;//��������״̬�������ڽ��յ������ݴ��뻺������ֱ�����յ����з�
parameter   C_CMD_DC    = 4'b0010;//��������״̬�������������е��������ͣ���д�ֽڡ����ֽڵ�
parameter   C_CMD_WB    = 4'b0011;//д���ݽ׶Σ������������ݣ�������д���Ӧ��ַ����:wb 01 f0,����01�ŵ�ַд������f0 
parameter   C_CMD_RB    = 4'b0100;//�����ݽ׶Σ������������ݣ���ȡ��Ӧ��ַ�����ݣ���:rb a1,���a1��ַ��ȡ����   
parameter   C_RD_WAIT   = 4'b0101;//�����ݵȴ��׶Σ������ݶ�������ASCII���ʽ���뷢�ͻ�����
parameter   C_TX_WAIT   = 4'b0110;//���͵ȴ��׶Σ������ͻ������е�����������ASCII���ʽ�Ӵ��ڷ���
parameter   C_ERROR     = 4'b0111;//����״̬����λ�����͵������ʽ����ʱ�����״̬������λ�����͡�ERROR��������
wire                tx_ready;
wire        [7:0]   tx_data;
wire        [7:0]   rx_data;

reg         [3:0]   curr_state;
reg         [3:0]   next_state;

reg         [3:0]   rx_bcnt; //��¼���ڷ���������ȣ�Ĭ��һ���������14�ֽ�
wire                is_wb_cmd;
wire                is_rb_cmd;
wire                is_error_cmd;
reg         [7:0]   rx_byte_buff_0;//0~7��Ž��յ�������磺wr 0a f0,��ʾ��0a��ַд������f0
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
            if((rx_vld==1'b1)&&(rx_data!=8'h0a))
                next_state  = C_CMD_RX;
            else
                next_state  = C_IDLE;
        C_CMD_RX:
            if((rx_vld==1'b1)&&(rx_data==8'h0a))
                next_state  = C_CMD_DC;
            else if(rx_bcnt == 4'hf)
                next_state  = C_ERROR;
            else
                next_state  = C_CMD_DC;
        C_CMD_DC:
            if(is_wb_cmd)
                next_state  = C_CMD_WB;
            else if(is_rb_cmd)
                next_state  = C_CMD_RB;
            else
                next_state  = C_ERROR;
        C_CMD_WB:
            next_state  = C_IDLE;
        C_CMD_RB:
            next_state  = C_RD_WAIT;
        C_RD_WAIT:
            next_state  = C_TX_WAIT;
        C_TX_WAIT:
            if((tx_ready==1'b1)&&(tx_rd==1'b1)&&(tx_data==8'h0a))
                next_state  = C_IDLE;
            else
                next_state  = C_TX_WAIT;
        C_ERROR:
            next_state  = C_TX_WAIT;
        default:
            next_state      = C_IDLE;
    endcase
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
.tx_ready           (tx_ready),
.tx_rd              (tx_rd),
.tx_data            (tx_data)
);


/*assign  tx_ready    = rx_vld;
assign  tx_data     = sw;
always@(posedge clk or posedge rst)
begin
    if(rst)
        led <= 8'h0;
    else if((rx_vld)&&(rx_data!=8'h0a))
        led <= rx_data;  
end*/

endmodule
