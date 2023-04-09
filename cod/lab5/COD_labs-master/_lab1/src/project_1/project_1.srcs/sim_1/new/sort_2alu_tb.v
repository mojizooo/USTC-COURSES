`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/04/26 21:57:50
// Design Name:
// Module Name: sort_2alu_tb
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


module sort_2alu_tb(
       );
reg clk, rst, opr;
reg [ 3: 0 ] x0, x1, x2, x3;
wire [ 3: 0 ] s0, s1, s2, s3;
wire done;

parameter PERIOD = 10,   	//time per cycle
          CYCLE = 20;		//total cycles

sort_2alu SORT( s0, s1, s2, s3, done, x0, x1, x2, x3, clk, rst, opr );

initial
  begin
    clk = 0;
    repeat ( 3 * CYCLE )
      #( PERIOD / 2 ) clk = ~clk;
    $finish;
  end

initial
  begin
    rst = 1;
    #PERIOD rst = 0;
    opr = 1;

    #( PERIOD * 9 ) rst = 1;
    #PERIOD rst = 0;
    opr = 0;

    #( PERIOD * 9 ) rst = 1;
    #PERIOD rst = 0;
    opr = 0;
  end

initial
  begin
    x0 = 3;
    x1 = 5;
    x2 = 7;
    x3 = 8;

    #( PERIOD * 10 );
    x0 = 10;
    x1 = 8;
    x2 = 15;
    x3 = 2;
    #( PERIOD * 10 );
    x0 = 2;
    x1 = 3;
    x2 = 9;
    x3 = 0;
  end
endmodule
