# SAP-1 (Simple As Possible) Computer Implementation Using Verilog

The SAP-1 computer is a foundational model designed to introduce core computer architecture concepts. Its simplicity makes it ideal for those beginning their exploration of how a computer operates at the most basic level, including interaction with memory, input/output, and executing instructions. Despite its simplicity, SAP-1 incorporates essential components such as an Arithmetic Logic Unit (ALU), registers, memory, and a control unit, which execute the fundamental fetch-decode-execute cycle.

In this project, I have implemented the SAP-1 computer using Verilog. This 8-bit microcomputer demonstrates the basic working of a CPU, including instruction fetch, memory interaction, and data processing. Our implementation focuses on key instructions like LDA, ADD, SUB, OUT, and HLT to simulate basic arithmetic and control operations.

The design was tested using an FPGA, which allows us to configure the processor after manufacturing, providing flexibility in testing and refining our implementation. A comprehensive testbench is included to verify the functionality of the processor, ensuring the correct execution of operations at each step of the cycle.

This project serves as an excellent tool for learning CPU architecture and the principles of digital design.

## Table of Contents
- [Description](#project-overview)
- [Architecture](#key-features)
- [Control Unit](#control_unit)
- [Simulation and Testing](#simulation-and-testing)
- [Future Enhancements](#future-enhancements)
- [Conclusion](#conclusion)


## Description
In this project, we implement an 8-bit SAP-1 (Simple-As-Possible)computer in Verilog. The sub-modules used in this design include the Program counter, MAR, 16x8 static TTL RAM, IR, Accumulator, Adder/subtractor, B Register and Binary display. Their interactions within the processor are demonstrated in the following diagram, showing the data flow and control signals

![SAP-1 Processor Diagram](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEje-5qfLwK7MbSywZJXEEuvJJCN6Hww3ECKz3Ho6ayLmj1W5CxNARhY2BN7cgFLTc0j8ITa5hxnbOFHNQsxC2kDAIUI64fvfCerC2Ver6KOgI6ljXBTpJq6jt_uJLjUrzUFWbjTvT9T8Xc/s1600/image1.jpeg)

## Architecture
1. **Program Counter**: Stores and increments the memory address of the next instruction to be executed.
2.**Memory Address Register (MAR)**: Holds the 4-bit address of data or instructions in memory, sent from the Program Counter.
3. **Random-Access Memory (RAM)**: A 16 x 8 memory that stores data/instructions. Data is accessed based on the address from MAR.
4. **Instruction Register**: Receives and splits instructions from RAM into upper and lower nibbles for control.
5. **Controller-Sequencer**: Manages the control signals (control word) to ensure the correct operation of the system.
6. **Accumulator**: An 8-bit register that holds intermediate results for arithmetic operations.
7. **Adder-Subtractor**: Performs addition or subtraction based on the value in the accumulator and B-register.
8. **B-Register**: Stores data for arithmetic operations, interacting with the adder-subtractor.
9.**Output Register**: Stores and displays the final output from the accumulator.
10. **Binary Display**: LEDs show the binary output from the output register for visual confirmation.


Reduced Instruction Set of SAP-1
| Mnemonic | Operation |
|----------|--------|
| LDA      | Load the Accumulator with data from a specified HEX address.   |
| ADD      | Adds the contents of the Accumulator with data from a specified memory location.  |
| SUB      | Subtracts the contents of a specified memory location from the Accumulator.   |
| OUT      | Transfers the contents of the Accumulator to the output register (implicit operation)   |
| HLT      | Halts execution, marking the end of the program.   |

Opcode Design
| Mnemonic | Opcode |
|----------|--------|
| LDA      | 0000   |
| ADD      | 0001   |
| SUB      | 0010   |
| OUT      | 1110   |
| HLT      | 1111   |

Control Matrix for Fetch Cycle
Control Word:

| T State | Control Sq. | Active Bits |
|---------|--------------|-------------|
| T1      | 5E3H        |             |
| T2      | BE3H        | CP          |
| T3      | 263H        |             |

Operation Control Matrix pf SAP Architecture

| T State | Control Sq. | Active Bits | Routine      |
|---------|--------------|-------------|--------------|
| T1      | 5E3H        |             | FETCH        |
| T2      | BE3H        | CP          |              |
| T3      | 263H        |             |              |
|---------|-------------|-------------|--------------|
| T4      | 1A3H        |             |              |
| T5      | 2C3H        |             | LDA          |
| T6      | 3E3H        | ---         |              |
|---------|-------------|-------------|--------------|
| T4      | 1A3H        |             |              |
| T5      | 2E1H        |             | ADD          |
| T6      | 3C7H        |             |              |
|---------|-------------|-------------|--------------|
| T4      | 1A3H        |             |              |
| T5      | 2E1H        |             | SUB          |
| T6      | 3C7H        |             |              |
|---------|-------------|-------------|--------------|
| T4      | 3F2H        |             |              |
| T5      | 3E3H        |             | OUT          |
| T6      | 3E3H        |             |              |
|---------|-------------|-------------|--------------|
This architecture provides a clear understanding of how the SAP-1 processor functions, including the operations it can perform and the corresponding control sequences required for each instruction. The design facilitates basic data processing tasks, making it an excellent educational tool for understanding microprocessor architecture.

## Control Unit
Explain the components used...

## Simulation and Testing
Detail the testing approach...

## Future Enhancements
Outline potential future improvements...

## Conclusion
Summarize the project...
