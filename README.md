# RISC SAP-1 Processor 
This repository contains my Verilog implementation of the SAP-1 processor, an 8-bit microprocessor with a simple instruction set, ALU, registers, memory, and control unit. It demonstrates the fetch-decode-execute cycle and is ideal for learning basic CPU architecture. A testbench is included to simulate the processor's operations.

## Table of Contents
- [Description](#project-overview)
- [Architecture](#key-features)
- [Components](#components)
- [Simulation and Testing](#simulation-and-testing)
- [Future Enhancements](#future-enhancements)
- [Conclusion](#conclusion)


## Description
In this project, we implement an 8-bit SAP-1 (Simple-As-Possible) processor in Verilog. The sub-modules used in this design include the ALU, control unit, registers, memory, and program counter. Their interactions within the processor are demonstrated in the following diagram, showing the data flow and control signals

![SAP-1 Processor Diagram]([https://louis-dr.github.io/SAP1/sap1_block.svg](https://2.bp.blogspot.com/_KJVEj0Bkn74/TFAiffaC--I/AAAAAAAAAAU/aiJaG8AgXdA/s320/SAP+1+Architecture.jpg))

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
Mnemonic	Opcode
LDA	0000
ADD	0001
SUB	0010
OUT	1110
HLT	1111
Control Matrix for Fetch Cycle
Control Word:

T State	Control Sq.	Active Bits
T1	5E3H	
T2	BE3H	CP
T3	263H	
Operation Control Matrix
T State	Control Sq.	Active Bits	Routine
T1	5E3H		FETCH
T2	BE3H	CP	
T3	263H		
T4	1A3H		LDA
T5	2C3H		
T6	3E3H		
T4	1A3H		ADD
T5	2E1H		
T6	3C7H		
T4	1A3H		SUB
T5	2E1H		
T6	3C7H		
T4	3F2H		OUT
T5	3E3H		
T6	3E3H		
This architecture provides a clear understanding of how the SAP-1 processor functions, including the operations it can perform and the corresponding control sequences required for each instruction. The design facilitates basic data processing tasks, making it an excellent educational tool for understanding microprocessor architecture.

## Components
Explain the components used...

## Simulation and Testing
Detail the testing approach...

## Future Enhancements
Outline potential future improvements...

## Conclusion
Summarize the project...
