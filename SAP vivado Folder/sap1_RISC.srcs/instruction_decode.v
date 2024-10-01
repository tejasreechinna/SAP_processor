module instruction_Decodee( input [3:0] from_ir , output lda , add , sub , hlt , out );

assign lda ={~from_ir[3] & ~from_ir[2] & ~from_ir[1]& ~from_ir[0]};
assign add ={~from_ir[3] & ~from_ir[2] & ~from_ir[1]& from_ir[0]};
assign sub ={~from_ir[3] & ~from_ir[2] & from_ir[1]& ~from_ir[0]};
assign out ={from_ir[3] & from_ir[2] & from_ir[1]& ~from_ir[0]};
assign hlt ={from_ir[3] & from_ir[2] & from_ir[1]& from_ir[0]};

endmodule

