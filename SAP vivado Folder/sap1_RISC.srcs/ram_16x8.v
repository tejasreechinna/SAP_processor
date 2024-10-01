module ram_16x8 (
    input [3:0] mar_out,       
    input [7:0] data_in,       
    input prog_run,            
    input Ce,                                    
    output reg [7:0] data_out  
);
    wire we;
    reg [7:0] memory [0:15];   

    always @(posedge prog_run or negedge we or negedge Ce)
     begin
        if (!Ce)
         begin
            if (!we) begin
                memory[mar_out] <= data_in;
            end
        end
    end

    always @(posedge prog_run) begin
        if (prog_run && Ce) begin
             data_out <= memory[mar_out];
        end
    end

endmodule
