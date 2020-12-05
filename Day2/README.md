Commands list

GCC
  Compile:   gcc <file.c>
  Execute:   ./a.out
  
RISC-V
  Compile:       riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o <obj.o> <inputfile.c>
  Object Dump:   riscv64-unknown-elf-objdump -d <obj.o>
  Execute:       spike pk <obj.o>
  Debugger:      spike -d pk <obj.o>
  
  Compile command explained:
        -O1            compiler name; Also try -Ofast which provides a smaller list of assembler instructions when compiled
        -mabi=lp64     lp-longint pointer
        -march=rv64i   RISC-V architecture
        -o             output object name
  Object dump explained:
        -d             "Disassemble" the given object and prints the assembly code of the C code provided. It is easier to read with "less".
  
  Some Debugger commands:
        :until pc 0 100cb      Assembly code runs all the instructions previous to the address mentioned (0X100cb)
        :reg 0 a0              Output the contents of register a0 on core0
        :reg 0 sp              Print out the contents of stack pointer
        :<Enter key>           To run the next instruction
