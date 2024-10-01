module accumulator(
    input [7:0] bus,       
    input clk,             
    input La,             
    input Ea,              
    output reg [7:0] a,   
    output [7:0] to_adder, 
    output [7:0] to_bus    
);

always @(posedge clk)
begin
    if (~La)               
        a <= bus;         
end

assign to_adder = a;        
assign to_bus = (Ea) ? a : 8'bz; 
endmodule 
