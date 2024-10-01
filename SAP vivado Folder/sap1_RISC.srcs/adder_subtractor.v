module adder_subtractor (
    input [7:0] to_adder,     
    input [7:0] regb_out,     
    input Eu,                
    input Su,                
    output reg [7:0] res,     
    output [7:0] to_bus      
);

reg [7:0] regb_com;           
always @(*) begin
    regb_com = ~regb_out;     

    if (~Su)
        res = to_adder + regb_out;   
    else
        res = to_adder + regb_com + 1;  
end
assign to_bus = (Eu) ? res : 8'bz;

endmodule
