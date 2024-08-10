.data
global_value:
    .word 0x12345678          # Some arbitrary global data value

.text

_start:
    # Using LUI to load the upper 20 bits of an address
    la t1, global_value

    # Now let's demonstrate AUIPC by calculating a relative address
    auipc t2, 0                 # Set t2 to the current PC + 0 (i.e., current PC)
    addi t2, t2, 12             # Move t2 forward by 12 bytes (to the lui instruction)
    jalr ra, t2, 0              # Jump to the new PC (relative to the original PC)

    # Another use of LUI and AUIPC for further demonstration
    lui t0, 0xABCD              # Load upper immediate 0xABCD00000 into t0
    addi t0, t0, 0x123          # Add a small constant to t0, making it 0xABCD00123

    auipc t2, 1                 # Load current PC + 4096 into t2
    addi t2, t2, 0x456          # Add 0x456 to the value in t2 (PC-relative computation)

    # Simple arithmetic using the computed values
    add t1, t0, t2              # t1 = t0 + t2 (combining both upper immediate values)