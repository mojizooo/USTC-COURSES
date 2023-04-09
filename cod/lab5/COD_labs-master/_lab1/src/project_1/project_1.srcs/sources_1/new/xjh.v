

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2020 10:49:00 AM
// Design Name: 
// Module Name: fuc
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
module xregister
#(parameter WIDTH = 32,
RST_VALUE = 0)
(input clk, rst, en,
input [WIDTH - 1:0] d,
output reg [WIDTH - 1:0] q
);
always@(posedge clk or posedge rst)
    if(rst) q <= RST_VALUE;
    else if(en) q<= d;

endmodule

module xalu
#(parameter WIDTH = 32)         //���ݿ��
(output reg [WIDTH - 1:0] y,    //������
output reg zf, 					//���־
output reg cf, 					//��λ/��λ��־
output reg of, 					//�����־
input [WIDTH - 1:0] a, b,		//��������
input [2:0] m				    //��������
);
always@(*)
begin
    case(m)
        3'b000: 
        begin
            {cf, y} = a + b;
            of = (~a[WIDTH - 1] & ~b[WIDTH - 1] & y[WIDTH - 1]) | (a[WIDTH - 1] & b[WIDTH - 1] & ~y[WIDTH - 1]);
        end
        3'b001: 
        begin
            {cf ,y} = a - b;
            of = (~a[WIDTH - 1] & b[WIDTH - 1] & y[WIDTH - 1]) | (a[WIDTH - 1] & ~b[WIDTH - 1] & ~y[WIDTH - 1]);
        end
        3'b010: y = a & b;
        3'b011: y = a | b;
        3'b100: y = a ^ b;
        default: y = 0;   
    endcase
    assign zf = ~|y;
end   
endmodule

module xmux2
#(parameter WIDTH = 32)
(output [WIDTH - 1:0] y,              //������
input [WIDTH - 1:0] a,b,              //��ѡ����
input sel                             //ѡ�����
);
assign y = sel ? b : a;               //selΪ1ʱy = b��Ϊ0ʱy = a
endmodule

module xmux4
#(parameter WIDTH = 32)
(output [WIDTH - 1:0] y,              //������
input [WIDTH - 1:0] a,b,c,d,          //��ѡ����
input [2:0] sel                       //ѡ�����
);
assign y = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a);  
endmodule

module xsort
#(parameter N = 4) 			      //���ݿ��
(output [N-1:0] s0, s1, s2, s3, 	  //�������ĸ����ݣ�������
output reg done, 				      //���������־
input [N-1:0] x0, x1, x2, x3,	      //ԭʼ��������
input clk, rst				          //ʱ�ӣ���������Ч������λ���ߵ�ƽ��Ч��
);
localparam LOAD = 3'b000,
            CX01a = 3'b001,
            CX12a = 3'b010,
            CX23a = 3'b011,
            CX01b = 3'b100,
            CX12b = 3'b101,
            CX01c = 3'b110,
            HLT = 3'b111;

wire [3:0] i0, i1, i2, i3, i4, i5, r0, r1, r2, r3;
wire cf;
reg [2:0] current_state, next_state;
reg [1:0] m0, m1, m2, m3, m4, m5;
reg en0, en1, en2, en3;



//Data Path
register #(4) R0(clk, rst, en0, i0, r0),
              R1(clk, rst, en1, i1, r1),
              R2(clk, rst, en2, i2, r2),
              R3(clk, rst, en3, i3, r3);
              
alu #(4) ALU(.cf(cf),.a(i1),.b(i3),.m(3'b001));

mux4 #(4) M0(i0, x0, r1, r2, r3, m0),
          M1(i1, r0, x1, r2, r3, m1),
          M2(i2, r0, r1, x2, r3, m2),
          M3(i3, r0, r1, r2, x3, m3),
          M4(i4, r0, r1, r2, r3, m4),
          M5(i5, r0, r1, r2, r3, m5);
     
assign s0 = r0;
assign s1 = r1;
assign s2 = r2;
assign s3 = r3;

//Control Unit
always @(posedge clk or posedge rst)
    if(rst) current_state <= LOAD;
    else
        current_state <= next_state;

always@(*)
begin
    case(current_state)
        LOAD: next_state = CX01a;   
        CX01a: next_state = CX12a;    
        CX12a: next_state = CX23a;    
        CX23a: next_state = CX01b;    
        CX01b: next_state = CX12b;    
        CX12b: next_state = CX01c;    
        CX01c: next_state = HLT;    
        HLT: next_state = HLT;
        default: next_state = LOAD;
    endcase
end

always@(*)
begin
    {m0, m1, m2, m3, m4, m5, en0, en1, en2, en3, done} = 17'b0; 
    case(current_state)
        LOAD: 
        begin 
            m0 = 2'd0; m1 = 2'd1; m2 = 2'd2; m3 = 2'd3; 
            {en0, en1, en2, en3} = 4'b1111; 
        end
        CX01a, CX01b, CX01c: 
        begin 
            m0 = 2'd1; m1 = 2'd0; m4 = 2'd0; m5 = 2'd1; 
            en0 = ~cf; en1 = ~cf; 
        end
        CX12a, CX12b: 
        begin 
            m1 = 2'd2; m2 = 2'd1; m4 = 2'd1; m3 = 2'd2; 
            en0 = 0; en1 = ~cf; en2 = ~cf; en3 = 0; 
        end
        CX23a: 
        begin 
            m2 = 2'd3; m3 = 2'd2; m4 = 2'd2; m5 = 2'd3; 
            en0 = 0; en1 = 0; en2 = ~cf; en3 = ~cf; 
        end
        HLT: done = 1;
    endcase
end

endmodule