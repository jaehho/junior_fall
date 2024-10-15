**Implementation of a Pipelined MIPS Processor**

### Overview of MIPS and ARM Processors

MIPS and ARM processors are two of the most prominent RISC (Reduced Instruction Set Computing) architectures.

**MIPS Processors** use a fixed-length instruction set and a load/store architecture. MIPS includes functional blocks like the Program Counter, Instruction Memory, ALU, Register File, Control Unit, and Data Memory. Pipelined MIPS is relatively straightforward, with five pipeline stages: Fetch, Decode, Execute, Memory, and Writeback

**ARM Processors** feature additional performance enhancements, such as conditional execution, advanced addressing modes, and extensive use of pipeline techniques. Pipelined ARM architecture is more advanced, often with 8-16 stages, depending on the generation, and sophisticated power management, making it popular in mobile and embedded devices.

MIPS processors are simpler to implement and thus more instructive for learning fundamental computer architecture, whereas ARM processors offer more advanced features and efficiency for real-world commercial applications, however MIPS is still widely used in embedded systems.

### Implemented MIPS Processor

The MIPS processor implemented in this project follows a classic 5-stage pipelined design, inspired by D. Harris and S. L. Harris, *Digital Design and Computer Architecture*. The processor includes the following components:

- **Program Counter (PC)**: Holds the address of the current instruction to be fetched. The PC is incremented each clock cycle to point to the next instruction or updated based on branching/jumping instructions.

- **Instruction Memory**: Stores the program instructions. It is read-only and provides the current instruction based on the value in the PC.

- **Control Unit**: Decodes the fetched instruction to generate control signals required to execute the instruction. The control unit determines whether an instruction writes to registers, accesses memory, or performs an arithmetic operation.

- **Register File**: Holds the general-purpose registers. It allows two source operands to be read and one result to be written back in the same clock cycle.

- **Arithmetic Logic Unit (ALU)**: Performs arithmetic and logical operations. The ALU control signal determines which operation is performed, such as addition, subtraction, or bitwise AND/OR.

- **Data Memory**: Stores and loads data as needed. The memory can be accessed only through load and store instructions.

### Core Instructions

The core instructions implemented are:

- **R-type**: ADD, SUB, AND, OR, SLT
- **I-type**: LW, SW, ADDI, BEQ
- **J-type**: JUMP

### Testbench Analysis

The testbench provided for this implementation is designed to validate the functionality of the processor. The testbench includes a clock generator and reset logic to initialize the processor. The program is loaded into the instruction memory, and the output is monitored to verify the correct behavior.

The testbench checks if the processor correctly executes instructions and writes the expected data to memory. If the values match the expected results, a success message is displayed; otherwise, a failure message indicates incorrect behavior.

#### Synthesized vs. Simulated Results

The synthesized/implemented results are compared against the simulation results to ensure that the hardware design matches the expected behavior. Simulation is carried out at the RTL (Register Transfer Level) to verify functional correctness. Once the design is synthesized, the resource usage and timing constraints are analyzed to ensure the design meets performance requirements.

### FPGA Utilization

The MIPS processor is implemented on an FPGA to evaluate resource usage. The FPGA utilization metrics include:

- **LUTs (Look-Up Tables)**: 507 used out of 53,200 available, resulting in a utilization of approximately 0.95%.
- **LUTRAM**: 44 used out of 17,400 available, resulting in a utilization of approximately 0.25%.
- **Flip-Flops (FF)**: 231 used out of 106,400 available, resulting in a utilization of approximately 0.22%.
- **BRAM (Block RAM)**: 0.5 blocks used out of 140 available, resulting in a utilization of approximately 0.36%.
- **IO Pins**: 67 used out of 200 available, resulting in a utilization of 33.5%.

The low utilization percentages for LUTs, LUTRAM, and FFs indicate that the implemented design is efficient in terms of resource consumption. The relatively higher utilization of IO pins reflects the number of connections needed to interface with external components, such as memory and peripherals.

### Timing Analysis

Timing analysis is critical to ensure that the design meets the required clock speed. The metrics analyzed include:

- **Worst Negative Slack (WNS)**: The WNS is 1.045 ns, indicating that the design comfortably meets the timing requirements, as there is no violation and a positive slack margin. This metric represents the difference between the required time and the actual arrival time of the slowest path.
- **Total Negative Slack (TNS)**: The TNS is 0.000 ns, which means that there are no paths in the design that fail to meet the timing constraints. A TNS of zero confirms that the design meets all the specified timing requirements without any violations.

The positive WNS and zero TNS indicate that the implemented MIPS processor is capable of operating at the intended clock frequency without any timing issues, ensuring reliable operation in an FPGA environment.

### Pipelining Implementation

Pipelining is implemented to improve the performance of the MIPS processor by overlapping the execution of multiple instructions. The 5-stage pipeline consists of the following stages:

1. **Instruction Fetch (IF)**: The instruction is fetched from memory.
2. **Instruction Decode (ID)**: The fetched instruction is decoded, and source operands are read from the register file.
3. **Execute (EX)**: The ALU performs the arithmetic or logic operation.
4. **Memory Access (MEM)**: The memory is accessed if the instruction is a load or store.
5. **Writeback (WB)**: The result is written back to the register file.

Hazard detection and forwarding units are used to handle data dependencies between instructions, reducing the need for stalls and improving the overall throughput. The pipeline architecture allows multiple instructions to be processed simultaneously, increasing the instruction throughput compared to a single-cycle or multi-cycle implementation.

### Figure Descriptions

- **Figure 1: MIPS Processor Architecture**: This figure provides a high-level overview of the MIPS processor architecture, showing the major functional blocks such as the Program Counter, Instruction Memory, Control Unit, Register File, ALU, and Data Memory. Each component's role in instruction execution is illustrated.

- **Figure 2: Pipeline Stages**: This figure illustrates the 5-stage pipeline of the MIPS processor, highlighting the Instruction Fetch, Instruction Decode, Execute, Memory Access, and Writeback stages. It shows how instructions are processed in parallel to improve throughput.

- **Figure 3: Hazard Detection and Forwarding**: This figure depicts the hazard detection and forwarding logic used to manage data dependencies between pipeline stages. It shows how data hazards are mitigated to maintain efficient pipeline flow.

- **Figure 4: FPGA Resource Utilization**: This figure presents the FPGA resource utilization metrics, including LUTs, Registers, and BRAM usage. It provides insight into the hardware requirements of the implemented MIPS processor.

- **Figure 5: Testbench Waveform**: This figure shows the simulation waveform from the testbench, demonstrating the behavior of the MIPS processor as it executes instructions. Key signals such as the clock, reset, program counter, and memory write data are highlighted.
