`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 18:36:49
// Design Name: 
// Module Name: CPU5_one_cycle
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


module CPU5_one_cycle(
    input clk,rst,
    input run,step,
    input valid,
    input [4:0] in,
    output [1:0] check,
    output [4:0] out0,
    output [2:0] an,
    output [3:0] seg,
    input rx,
    output tx
    );

    //IO_BUS
    wire [7:0] io_addr;      //led和seg的地�?
    wire [31:0] io_dout;     //输出led和seg的数�?
    wire io_we;                 //输出led和seg数据时的使能信号
    wire [31:0] io_din;          //来自sw的输入数�?  

    wire clk_cpu;
    wire rx, tx;

    //wire clk_out;
    //divider #(2)for_clk(clk,clk_out);   
    /*wire clk;
    reg [2:0]cnt;
    always @(posedge clk_100) begin
        cnt <= cnt + 1;
    end
    assign clk = cnt[2];*/
    wire [31:0] pcin, pcd, pce;
    wire [31:0] ir, imm, mdr;
    wire [31:0] a, b, y, bm, yw;
    wire [4:0]  rd, rdm, rdw;
    wire [31:0] ctrl, ctrlm, ctrlw;
    
    

    CPU CPU5(
        .clk(clk_cpu),
        .clk_0(clk),
        .rst(rst),
        .rx(rx),
        .tx(tx),
        .io_addr(io_addr),
        .io_dout(io_dout),
        .io_we(io_we),
        .io_din(io_din),
        .pcin(pcin),
        .pcd(pcd),
        .pce(pce),
        .ir(ir),
        .imm(imm),
        .mdr(mdr),
        .a(a),
        .b(b),
        .y(y),
        .bm(bm),
        .yw(yw),
        .rd(rd),
        .rdm(rdm),
        .rdw(rdw),
        .ctrl(ctrl),
        .ctrlm(ctrlm),
        .ctrlw(ctrlw)     
    );

    pdu5 debug(
        .clk(clk),
        .rst(rst),

        .run(run),
        .step(step),
        .clk_cpu(clk_cpu),
        
                .valid(valid),
        .in(in),

        .check(check),
        .out0(out0),
        .an(an), 
        .seg(seg),
        .ready(ready),

        .io_addr(io_addr),
        .io_dout(io_dout),
        .io_we(io_we),
        .io_din(io_din),
        
        .pcin(pcin),
        .pcd(pcd),
        .pce(pce),
        .ir(ir),
        .imm(imm),
        .mdr(mdr),
        .a(a),
        .b(b),
        .y(y),
        .bm(bm),
        .yw(yw),
        .rd(rd),
        .rdm(rdm),
        .rdw(rdw),
        .ctrl(ctrl),
        .ctrlm(ctrlm),
        .ctrlw(ctrlw)     
    );

endmodule
