.text
_start:
    # Initialize the stack pointer
    addi sp, sp, -30             # Allocate 30 bytes on the stack (4 words)                                             # 0000

    # Store values into the stack
    li t0, 0x12345678            # Load immediate value 0x12345678 into t0                                              # 0001, 0002
    sw t0, 0(sp)                 # Store the word in t0 to the top of the stack (sp)                                    # 0003

    li t1, 0xABCD                # Load immediate value 0xABCD into t1                                                  # 0004, 0005
    sh t1, 4(sp)                 # Store the lower half-word in t1 to the stack (sp + 4)                                # 0006

    li t2, 0x7F                  # Load immediate value 0x7F into t2                                                    # 0007
    sb t2, 6(sp)                 # Store the byte in t2 to the stack (sp + 6)                                           # 0008

    # Load values back from the stack
    lw t0, 0(sp)                 # Load the word from the top of the stack into t0                                      # 0009
    lh t1, 4(sp)                 # Load the half-word from the stack into t1 (sign-extended)                            # 000a
    lb t2, 6(sp)                 # Load the byte from the stack into t2 (sign-extended)                                 # 000b

    # Store back to the stack after modifying registers
    li t0, 0x87654321            # Load a new immediate value into t0
    sw t0, 0(sp)                 # Store the modified word back to the stack

    li t1, 0xDCBA                # Load a new immediate value into t1
    sh t1, 4(sp)                 # Store the modified half-word back to the stack

    li t2, 0xFF                  # Load a new immediate value into t2
    sb t2, 6(sp)                 # Store the modified byte back to the stack

    # Load the modified values back from the stack
    lw t0, 0(sp)                 # Load the modified word from the stack into t0
    lh t1, 4(sp)                 # Load the modified half-word from the stack into t1
    lb t2, 6(sp)                 # Load the modified byte from the stack into t2

    # Store again
    sh t0, 10(sp)

    # Load again
    lh t0, 10(sp)

    # Clean up the stack and finish
    addi sp, sp, 30              # Deallocate the 30 bytes from the stack
