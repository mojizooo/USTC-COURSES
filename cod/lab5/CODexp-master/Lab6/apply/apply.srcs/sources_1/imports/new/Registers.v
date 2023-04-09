module Registers(
    input wire clk,we,
    input wire [4:0] wa, ra0, ra1, ra2,
    input wire wr_en,
    input wire [7:0] wr_data, wr_addr,
    input wire [31:0] wd, 
    output wire [31:0] rd0, rd1, rdd
    );
    reg [31:0] regfile[0:31];

    initial begin
        regfile[0]=0;   
    end
    
    assign  rd0 = regfile[ra0],
            rd1 = regfile[ra1],
            rdd = regfile[ra2];

    always @ (posedge clk)begin
        if(we && wa != 0)regfile[wa] <= wd;
        if(wr_en && wr_addr != 0) 
        begin
        regfile[wr_addr[7:4] * 10 + wr_addr[3:0]] <= wr_data;
        end
    end
endmodule
