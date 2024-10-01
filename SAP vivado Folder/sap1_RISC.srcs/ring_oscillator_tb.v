`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2024 14:05:08
// Design Name: 
// Module Name: ring_oscillator_tb
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


module ring_oscillator_tb();
reg enable ; 
reg clk;
reg reset ;
wire [10:0] out ; 
//wire a , b , c;
ring_114 dut(.enable(enable) , .clk(clk) , .reset(reset) , .out(out) );

initial begin 
reset=1 ; clk=0 ; enable=0;
#10;
reset=0 ; enable =1; #10 ;
reset=0 ; enable =1; #10;
reset=0 ; enable =1; #10;
reset=0 ; enable =1; #10;   
end 

always #5 clk= ~clk;
endmodule
