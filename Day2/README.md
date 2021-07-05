# RISC-V ISA

RISC-V ISA is an open-specification, free Instruction Set Architecture, that originated in UC-Berkeley with David Patterson as one of the inventors, enabling any company or any individual to build a processor that can support the ISA.

An RV64I architecture supports Base Integer instructions. It contains 32 general-purpose registers (addressed as x0, x1, ... x31) with each register being 64bits wide (XLEN=64)

More information about the ISA can be found here-  
[RISC-V Specifications](https://riscv.org/technical/specifications/)  
[RISC-V card](https://inst.eecs.berkeley.edu//~cs61c/fa17/img/riscvcard.pdf)  

## GNU Compiler toolchain commands

### GCC compiler for C programs
  *Compile:*   gcc <file.c>  
  *Execute:*   ./a.out  
  
### GCC Compiler for RISC-V
  ###### Compile:     
  `riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o <obj.o> <inputfile.c>`   
        `-O1`            compiler name; Also try -Ofast which provides a smaller list of assembler instructions when compiled    
        `-mabi=lp64`     lp-longint pointer    
        `-march=rv64i`   RISC-V architecture    
        `-o    `         output object name    
        
  ###### Object Dump:     
  `riscv64-unknown-elf-objdump -d <obj.o>`    
       `-d `            "Disassemble" the given object and prints the assembly code of the C code provided.    
                       Easier to read with "less".  
                       
  ###### Execute:          
  `spike pk <obj.o>`  
  
  ###### Debugger:        
  `spike -d pk <obj.o>`     
   `:until pc 0 100cb`      Assembly code runs all the instructions previous to the address mentioned (0X100cb)  
        `:reg 0 a0`              Output the contents of register a0 on core0  
        `:reg 0 sp`              Print out the contents of stack pointer  
        `:<Enter key>`           To run the next instruction  
 
# ABI  
The Operating System accesses specific architectural registers in the hardware through the ABI(Application Binary Interface) or system-call interface. 
