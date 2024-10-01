module control_sequencer(
    input clk,                 // Clock signal
    input reset,               // Reset signal
    input [3:0] opcode,        // Opcode from Instruction Register
    output reg [11:0] control_signals,  // 12 control signals
    output [20:0] seven_seg_out   // Outputs for 3 7-segment displays (each uses 7 segments)
);

    wire [5:0] state;  // Ring counter state
    wire lda, add, sub, out, hlt;
    wire [3:0] hex_digit1, hex_digit2, hex_digit3; // 4-bit hex digits

    // Instantiate ring counter
    ring_counter rc (
        .clk(clk),
        .reset(reset),
        .state(state)
    );

    // Instantiate opcode decoder
    instruction_Decodee id (
        .from_ir(opcode),
        .lda(lda),
        .add(add),
        .sub(sub),
        .out(out),
        .hlt(hlt)
    );

    // Control signal generation based on state and opcode
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            control_signals <= 12'h3E3;  // Default state on reset
        end else begin
            case (state)
                6'b000001: control_signals <= 12'h5E3;  // T1: Ep, ~Lm
                6'b000010: control_signals <= 12'hBE3;  // T2: Cp
                6'b000100: control_signals <= 12'h263;  // T3: ~Ce, ~Li
                6'b001000: begin                        // T4: Execution depends on opcode
                    if (lda) control_signals <= 12'h1A3;  // LDA: ~Ei, ~Lm
                    else if (add) control_signals <= 12'h1A3;  // ADD: ~Ei, ~Lm
                    else if (sub) control_signals <= 12'h1A3;  // SUB: ~Ei, ~Lm
                    else if (out) control_signals <= 12'h3F2;  // OUT: Ea, ~Lo
                end
                6'b010000: begin                        // T5: LDA/ADD/SUB execution
                    if (lda) control_signals <= 12'h2C3;  // LDA: ~Ce, ~La
                    else if (add) control_signals <= 12'h2E1;  // ADD: ~Ce, ~Lb
                    else if (sub) control_signals <= 12'h2E1;  // SUB: ~Ce, ~Lb
                end
                6'b100000: begin                        // T6: Final operation
                    if (lda) control_signals <= 12'h3E3;  // LDA: NOP
                    else if (add) control_signals <= 12'h3C7;  // ADD: Eu, ~La
                    else if (sub) control_signals <= 12'h3C7;  // SUB: Su, Eu, ~La
                    else if (out) control_signals <= 12'h3E3;  // OUT: NOP
                    else if (hlt) control_signals <= 12'h3E3;  // HLT: Stop clock
                end
                default: control_signals <= 12'h3E3;
            endcase
        end
    end

    // Split control signals into 3 hex digits
    assign hex_digit1 = control_signals[3:0];   // Least significant hex digit
    assign hex_digit2 = control_signals[7:4];   // Middle hex digit
    assign hex_digit3 = control_signals[11:8];  // Most significant hex digit

    // Instantiate the 7-segment decoders for each hex digit
    hex_to_7segment decoder1 (.hex_digit(hex_digit1), .seg(seven_seg_out[6:0]));
    hex_to_7segment decoder2 (.hex_digit(hex_digit2), .seg(seven_seg_out[13:7]));
    hex_to_7segment decoder3 (.hex_digit(hex_digit3), .seg(seven_seg_out[20:14]));

endmodule

// Hexadecimal to 7-segment decoder module
module hex_to_7segment (
    input [3:0] hex_digit,       // 4-bit input hex digit
    output reg [6:0] seg         // 7-segment output (a-g)
);

    always @(*) begin
        case (hex_digit)
            4'h0: seg = 7'b1000000;  // Display 0
            4'h1: seg = 7'b1111001;  // Display 1
            4'h2: seg = 7'b0100100;  // Display 2
            4'h3: seg = 7'b0110000;  // Display 3
            4'h4: seg = 7'b0011001;  // Display 4
            4'h5: seg = 7'b0010010;  // Display 5
            4'h6: seg = 7'b0000010;  // Display 6
            4'h7: seg = 7'b1111000;  // Display 7
            4'h8: seg = 7'b0000000;  // Display 8
            4'h9: seg = 7'b0010000;  // Display 9
            4'hA: seg = 7'b0001000;  // Display A
            4'hB: seg = 7'b0000011;  // Display B
            4'hC: seg = 7'b1000110;  // Display C
            4'hD: seg = 7'b0100001;  // Display D
            4'hE: seg = 7'b0000110;  // Display E
            4'hF: seg = 7'b0001110;  // Display F
            default: seg = 7'b1111111;  // Blank display
        endcase
    end

endmodule
