module register_B(input [7:0] bus , input clk , input Lb , output [7:0] regb_out  , output reg [7:0] regb);

always @(posedge clk)
begin 
if(~Lb)
regb<=bus ;
end

assign regb_out = (~Lb)? regb : 8'bz;

endmodule
