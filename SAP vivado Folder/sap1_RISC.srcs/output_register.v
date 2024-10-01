module output_register(input [7:0] bus  , input Lo , input clk , output reg[7:0] out , output [7:0] to_display);


always @(posedge clk)
begin 
 if(~Lo)
    out<= bus;
    end 
    
    assign to_display = out ;
    endmodule 