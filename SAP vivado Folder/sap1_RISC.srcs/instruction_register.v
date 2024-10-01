module instruction_register(input [7:0] from_ram , input clk , clr , Li , Ei ,
                            output [ 3:0] to_Cs , output reg [3:0] to_bus_mar,
                            output reg [7:0] ir );

always @(negedge clk )
     begin 
        if(~clr)
        begin
          if(~Li)
             ir<=from_ram;
             end 
     end 

assign to_Cs = ir[7:4] ;

always @(*)
  begin 
  if(~Ei)
    to_bus_mar <= ir[3:0] ;
   end 
   endmodule
          
             
               
 