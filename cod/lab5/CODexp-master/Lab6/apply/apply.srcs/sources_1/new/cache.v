`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/09 13:33:45
// Design Name: 
// Module Name: cache
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


module cache(
    input clk,rst,
    input [31:0] pc,
    input br, 
    input isPCjmp, 
    input jal,
    input [31:0] pce,
    input [31:0] PCjmp2,
    output reg [31:0] pc_in,
    output reg miss
);

    reg [7:0] valid ;
    reg [31:0] data [0:7];
    reg [26:0] tag [0:7];
    wire [2:0] index;
    wire [2:0] index2;
    wire hit;
    assign index = pc[4:2];
    assign index2 = pce[4:2];
    assign hit = valid[index2] & (pce[31:5] == tag[index2]);
    
    always @(*) begin
        if(jal)
        begin
            miss = 1;
            pc_in = PCjmp2;
        end
        else if(isPCjmp && !hit)
        begin
            miss = 1;
            pc_in = PCjmp2;
        end
        else if(br && !isPCjmp && hit) 
        begin
            miss =1;
            pc_in = pce + 4;
        end
        else if(valid[index] && (tag[index] == pc[31:5]))
        begin
            pc_in = data[index];
            miss = 0;
        end
        else begin
            pc_in = pc + 4;
            miss = 0;
        end
    end


    always @ (posedge clk, posedge rst) 
    begin
        if(rst)
            valid <= 0;
        else begin
            if(isPCjmp && !hit)
            begin
                valid[index2] <= 1;
                tag[index2] <= pce[31:5];
                data[index2] <= PCjmp2;
            end
            else if(br && !isPCjmp && hit)
            begin
                valid[index2] <= 0;
            end 
        end
    end
endmodule
