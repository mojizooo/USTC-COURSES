module alu(
input  [2:0] a,b,
input  [1:0] fun,
output reg s,
output reg [2:0] y);
always@(*)
begin
	case(fun)
		2'b00: begin s = 0; y = a & b; end
        2'b01: begin s = 0; y = a | b; end
        2'b10: begin {s,y} = a + b; end
        2'b11: begin
            if(b[2])
                y = a << b[1:0];
            else
                y = a >> b[1:0];
        end
        default: begin s = 0; y = 0; end
    endcase
end
endmodule