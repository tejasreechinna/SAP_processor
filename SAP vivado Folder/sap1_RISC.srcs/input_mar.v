module input_MAR(input [3:0] pc_out , input [3:0] s1 , input lm ,s2, clk , output reg [3:0] mar_out);
reg [3:0] temp; // s1 is the address from switch register
always @( posedge clk)
  begin 
    if(lm)
       temp<=4'd0;
    else 
       temp<=pc_out;
      end
 always @( posedge clk)
   begin 
     if(s2)
        mar_out<=s1;
     else 
        mar_out<=temp;
       end

endmodule