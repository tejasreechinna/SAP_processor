module ring_counter (
    input clk,         // Clock signal
    input reset,       // Reset signal
    output reg [5:0] state  // 6-bit state output
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= 6'b000001;  // Initial state on reset
    end else begin
        if (state == 6'b100000)  // If last state is reached, wrap around
            state <= 6'b000001;
        else
            state <= state << 1;  // Left shift the state
    end
end

endmodule