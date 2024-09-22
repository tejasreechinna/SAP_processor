# RISC SAP-1 Processor 
This repository contains my Verilog implementation of the SAP-1 processor, an 8-bit microprocessor with a simple instruction set, ALU, registers, memory, and control unit. It demonstrates the fetch-decode-execute cycle and is ideal for learning basic CPU architecture. A testbench is included to simulate the processor's operations.

## Table of Contents
- [Description](#project-overview)
- [Architecture](#key-features)
- [Control Unit](#control_unit)
- [Simulation and Testing](#simulation-and-testing)
- [Future Enhancements](#future-enhancements)
- [Conclusion](#conclusion)


## Description
In this project, we implement an 8-bit SAP-1 (Simple-As-Possible) processor in Verilog. The sub-modules used in this design include the ALU, control unit, registers, memory, and program counter. Their interactions within the processor are demonstrated in the following diagram, showing the data flow and control signals

![SAP-1 Processor Diagram](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEje-5qfLwK7MbSywZJXEEuvJJCN6Hww3ECKz3Ho6ayLmj1W5CxNARhY2BN7cgFLTc0j8ITa5hxnbOFHNQsxC2kDAIUI64fvfCerC2Ver6KOgI6ljXBTpJq6jt_uJLjUrzUFWbjTvT9T8Xc/s1600/image1.jpeg)

## Architecture
The SAP-1 (Simple-As-Possible) processor is an 8-bit microprocessor designed to demonstrate fundamental concepts of computer architecture. It features a simple instruction set that allows for basic data manipulation and control operations.

Hypothetical Instructions
LDA: Load the Accumulator with data from a specified HEX address.
Example: LDA 8H loads data from memory address 8H into the Accumulator.

ADD: Adds the contents of the Accumulator with data from a specified memory location.
Example: ADD 9H transfers the contents of 9H to a temporary register (B), then adds the Accumulator (A) and B, storing the result back in the Accumulator.

SUB: Subtracts the contents of a specified memory location from the Accumulator.
Example: SUB CH subtracts the data at CH from the Accumulator, with the result loaded back into the Accumulator.

OUT: Transfers the contents of the Accumulator to the output register (implicit operation).

HLT: Halts execution, marking the end of the program.

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
