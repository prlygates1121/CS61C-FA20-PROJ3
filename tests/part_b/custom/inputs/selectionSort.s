.data
array:
    .word 3, 1, 5, 4, 9, 0, 8, 6, 7, 2

.text
main:
    la a0, array
    li a1, 10
    jal sort

    li a0, 10
    ecall

# a0: array start address
# a1: 1st index
# a2: 2nd index
swap:
    slli t0, a1, 2            # t0(offset) = a1(index) * 4
    add t1, a0, t0            # t1(position) = a0(start) + t0(offset)
    lw t2, 0(t1)              # t2 is the 1st word to be swapped

    slli t0, a2, 2            # t0(offset) = a2(index) * 4
    add t3, a0, t0            # t3(position) = a0(start) + t0(offset)
    lw t4, 0(t3)              # t4 is the 2nd word to be swapped

    sw t2, 0(t3)              # store t2 to where t4 belonged
    sw t4, 0(t1)              # store t4 to where t2 belonged

    jr ra

# a0: array start address
# a1: array length
sort:
    # prologue
    addi sp, sp, -40
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)
    sw s4, 20(sp)
    sw s5, 24(sp)
    sw s6, 28(sp)
    sw s7, 32(sp)
    sw s8, 36(sp)

    # store function arguments
    mv s0, a0                      # s0 holds the array start address
    mv s1, a1                      # s1 holds the array length
    addi s2, a1, -1                # s2 holds the index of the last element

    li s3, 0                       # s3 is the iterator index of the outer loop
outer_loop_begin:
    beq s3, s2, outer_loop_end     # exit outer loop on reaching the last element

    slli t0, s3, 2
    add t0, s0, t0
    lw s7, 0(t0)                   # s7 is the current minimum (initialized with the first element in the outer loop)
    mv s8, s3                      # s8 is the index of the current minimum

    addi s6, s3, 1                 # s6 is the iterator index of the inner loop
inner_loop_begin:
    beq s6, s1, inner_loop_end     # exit inner loop on reaching the last element

    slli s4, s6, 2                 # s4 is the offset in the inner loop
    add s5, s0, s4                 # s5 is the position in the inner loop
    lw t0, 0(s5)                   # t0 gets the current element in the inner loop
    blt t0, s7, findMin            # if t0 < s7, update s7
    j continue
findMin:
    mv s7, t0                      # t0 becomes the current minimum
    mv s8, s6                      # s8 becomes the index of the current minimum
continue:
    addi s6, s6, 1                 # increment s6
    j inner_loop_begin

inner_loop_end:

    mv a0, a0
    mv a1, s3
    mv a2, s8
    jal swap

    addi s3, s3, 1                 # increment s3
    j outer_loop_begin

outer_loop_end:

    # epilogue
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    lw s4, 20(sp)
    lw s5, 24(sp)
    lw s6, 28(sp)
    lw s7, 32(sp)
    lw s8, 36(sp)
    addi sp, sp, 40
    jalr ra










