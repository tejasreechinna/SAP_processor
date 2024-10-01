module programCounter (
    input wire clk,          
    input wire clr,          
    input wire Cp,          
    input wire Ep,           
    output wire [3:0] out 
);
    reg [3:0] cnt;       
    wire [3:0] tri_out;      
    always @(negedge clk) begin
        if (clr)          
            cnt <= 4'b0000; 
        else if (Cp)         
            cnt <= cnt + 1; 
    end
    assign tri_out = (Ep) ? cnt : 4'bzzzz;   
    assign out = tri_out;
endmodule
