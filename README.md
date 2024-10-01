# SAP-1 (Simple As Possible) Computer Implementation Using Verilog

The SAP-1 computer is a foundational model designed to introduce core computer architecture concepts. Its simplicity makes it ideal for those beginning their exploration of how a computer operates at the most basic level, including interaction with memory, input/output, and executing instructions. Despite its simplicity, SAP-1 incorporates essential components such as an Arithmetic Logic Unit (ALU), registers, memory, and a control unit, which execute the fundamental fetch-decode-execute cycle.

In this project, I have implemented the SAP-1 computer using Verilog. This 8-bit microcomputer demonstrates the basic working of a CPU, including instruction fetch, memory interaction, and data processing. Our implementation focuses on key instructions like LDA, ADD, SUB, OUT, and HLT to simulate basic arithmetic and control operations.

The design was tested using an FPGA, which allows us to configure the processor after manufacturing, providing flexibility in testing and refining our implementation. A comprehensive testbench is included to verify the functionality of the processor, ensuring the correct execution of operations at each step of the cycle.

This project serves as an excellent tool for learning CPU architecture and the principles of digital design.

---

## Table of Contents
- [Description](#description)
- [Architecture](#architecture)
- [Instruction Set](#instruction-set)
- [Control Unit](#control-unit)
- [Simulation and Testing](#simulation-and-testing)
- [Future Enhancements](#future-enhancements)
- [Conclusion](#conclusion)

---

## Description
In this project, we implement an 8-bit SAP-1 (Simple-As-Possible) computer in Verilog. The sub-modules used in this design include the Program Counter, MAR, 16x8 static TTL RAM, IR, Accumulator, Adder/Subtractor, B Register, and Binary Display. Their interactions within the processor are demonstrated in the following diagram, showing the data flow and control signals.

![SAP-1 Processor Diagram](https://karenok.github.io/SAP-1-Computer/images/sap-1-architecture.png)

---

## Architecture
1. **Program Counter**: Stores and increments the memory address of the next instruction to be executed.
2. **Memory Address Register (MAR)**: Holds the 4-bit address of data or instructions in memory, sent from the Program Counter.
3. **Random-Access Memory (RAM)**: A 16 x 8 memory that stores data/instructions. Data is accessed based on the address from MAR.
4. **Instruction Register**: Receives and splits instructions from RAM into upper and lower nibbles for control.
5. **Controller-Sequencer**: Manages the control signals (control word) to ensure the correct operation of the system.
6. **Accumulator**: An 8-bit register for intermediate arithmetic operations results.
7. **Adder-Subtractor**: Performs addition or subtraction based on the values in the Accumulator and B-register.
8. **B-Register**: Stores data for arithmetic operations, interacting with the Adder-Subtractor.
9. **Output Register**: Stores and displays the final output from the Accumulator.
10. **Binary Display**: LEDs show the binary output from the Output Register for visual confirmation.

---

## Instruction Set
Reduced Instruction Set of SAP-1

| Mnemonic | Operation                                                            |
|----------|----------------------------------------------------------------------|
| LDA      | Load the Accumulator with data from a specified memory address.       |
| ADD      | Adds the contents of the Accumulator with data from a specified memory location. |
| SUB      | Subtracts the contents of a specified memory location from the Accumulator. |
| OUT      | Transfers the contents of the Accumulator to the output register.     |
| HLT      | Halts execution, marking the end of the program.                     |

LDA, ADD, and SUB are Memory-Reference Instructions as they use the data stored in the memory.

---

## Programming SAP-1
The address and data switches of the Input Block allow us to program the SAP-1 memory. When programming the data switches with an instruction, the op-code goes into the upper nibble and the operand goes into the lower nibble.

Assembly language involves working with mnemonics when writing a program.
Machine language involves working with the strings of 0s and 1s.

### Opcode Design - Table-1
| Mnemonic | Opcode |
|----------|--------|
| LDA      | 0000   |
| ADD      | 0001   |
| SUB      | 0010   |
| OUT      | 1110   |
| HLT      | 1111   |

---

## Control Unit
### Operation Control Matrix of SAP Architecture

| T State | Control Seq. | Active Bits | Routine      |
|---------|--------------|-------------|--------------|
| T1      | 5E3H         |             |              |
| T2      | BE3H         | CP          | FETCH        |
| T3      | 263H         |             |              |
| T4      | 1A3H         |             |              |
| T5      | 2C3H         |             | LDA          |
| T6      | 3E3H         | ---         |              |
| T4      | 1A3H         |             |              |
| T5      | 2E1H         |             | ADD          |
| T6      | 3C7H         |             |              |
| T4      | 1A3H         |             |              |
| T5      | 2E1H         |             | SUB          |
| T6      | 3C7H         |             |              |
| T4      | 3F2H         |             |              |
| T5      | 3E3H         |             | OUT          |
| T6      | 3E3H         |             |              |

This architecture provides a clear understanding of how the SAP-1 functions, including its operations and the corresponding control sequences required for each instruction. The design facilitates basic data processing tasks, making it an excellent educational tool for understanding microprocessor architecture.

---

## Simulation and Testing
The implementation was thoroughly tested using Verilog simulation tools. The testbench simulated different scenarios for each instruction (LDA, ADD, SUB, OUT, and HLT) to ensure that the processor executes correctly. Each module, such as the Program Counter, Memory, and Accumulator, was verified separately to ensure they behave as expected.

The FPGA implementation was done using Xilinx Vivado (or Intel Quartus, depending on the FPGA). This allowed the design to be synthesized and deployed on the FPGA. LEDs and 7-segment displays were used to visually confirm the correctness of the output.

---

## Future Enhancements
1. **Instruction Set Expansion**: More instructions like `JMP`, `CMP`, and logical operations can be added to enhance the processor's functionality.
2. **Increasing Data Width**: Expanding the data bus width to 16 or 32 bits would increase the complexity and capability of the system.
3. **Pipelining**: Introducing instruction pipelining to improve the throughput and performance of the processor.
4. **Integration with I/O Devices**: Adding I/O devices (e.g., keyboards, displays) to make the processor interact with real-world systems.
5. **Memory Mapping**: Implementing more advanced memory structures like stack or heap, and enabling more complex program execution.

---

## Conclusion
The SAP-1 computer is a simple yet powerful tool for understanding the basics of computer architecture. This project demonstrates how fundamental components like registers, memory, and a control unit can interact to execute instructions in a sequential manner. Implementing this system in Verilog and deploying it on an FPGA provided valuable insights into both hardware design and digital logic. With potential for future enhancements, the SAP-1 serves as a foundation for more advanced CPU designs.
