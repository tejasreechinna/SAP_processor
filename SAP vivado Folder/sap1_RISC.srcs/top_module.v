module sap1_top (
    input clk,           // System clock
    input reset,         // Reset signal
    input prog_run,      // Program run signal
    input [7:0] data_in, // Data input for RAM
    output [7:0] display_out // Output display value
);
    
    // Wires for interconnecting modules
    wire [3:0] pc_out, mar_out, opcode;
    wire [7:0] bus, from_ram, a_out, regb_out, alu_out, ir_out, output_reg_out;
    wire [11:0] control_signals;
    wire [20:0] seven_seg_out;

    // Control signals (12-bit)
    wire Cp, Ep, Lm, Li, Ce, Ei, La, Ea, Lb, Eu, Su, Lo;
    
    // Extract control signals from the control word
    assign {Cp, Ep, Lm, Ce , Li, Ei, La, Ea, Su , Eu,Lb, Lo} = control_signals;

    // Instantiate the Program Counter
    programCounter pc (
        .clk(clk),
        .clr(reset),
        .Cp(Cp),
        .Ep(Ep),
        .out(pc_out)
    );

    // Instantiate the Memory Address Register (MAR)
    input_MAR mar (
        .pc_out(pc_out),
        .s1(4'b0),  // No external address input
        .lm(Lm),
        .s2(1'b0),  // No external control for MAR loading
        .clk(clk),
        .mar_out(mar_out)
    );

    // Instantiate the RAM
    ram_16x8 ram (
        .mar_out(mar_out),
        .data_in(data_in),
        .prog_run(prog_run),
        .Ce(Ce),
        .data_out(from_ram)
    );

    // Instantiate the Instruction Register (IR)
    instruction_register ir (
        .from_ram(from_ram),
        .clk(clk),
        .clr(reset),
        .Li(Li),
        .Ei(Ei),  // Disable external bus connection for now
        .to_Cs(opcode),
        .to_bus_mar(),
        .ir(ir_out)
    );

    // Instantiate the Accumulator (A register)
    accumulator acc (
        .bus(bus),
        .clk(clk),
        .La(La),
        .Ea(Ea),
        .a(a_out),
        .to_adder(a_out),
        .to_bus(bus)
    );

    // Instantiate the B register
    register_B regb (
        .bus(bus),
        .clk(clk),
        .Lb(Lb),
        .regb_out(regb_out),
        .regb()
    );

    // Instantiate the ALU (Adder/Subtractor)
    adder_subtractor alu (
        .to_adder(a_out),
        .regb_out(regb_out),
        .Eu(Eu),
        .Su(Su),
        .res(alu_out),
        .to_bus(bus)
    );

    // Instantiate the Output Register
    output_register out_reg (
        .bus(bus),
        .Lo(Lo),
        .clk(clk),
        .out(output_reg_out),
        .to_display(display_out)
    );

    // Instantiate the Control Sequencer
    control_sequencer control_unit (
        .clk(clk),
        .reset(reset),
        .opcode(opcode),
        .control_signals(control_signals),
        .seven_seg_out(seven_seg_out)
    );

    // Assign the output of the top module to the output register's output
    assign display_out = output_reg_out;

endmodule
