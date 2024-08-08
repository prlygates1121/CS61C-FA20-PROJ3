.text
main:
    addi t0, x0, 1
    slli t1, t0, 2
    slti t2, t0, 2
    slti t2, t0, 0
    xori t1, t2, -3
    srli t1, t1, 4
    srai t2, t2, 2
    ori t1, t0, -1
    andi t1, t1, 2

    add t0, t2, t1
    mul t1, t0, t0
    sub t2, t1, t0
    sll t0, t1, t2
    mulh t0, t0, t0
    mulhu t1, t1, t1
    slt t2, t1, t1
    slt t2, t1, t0
    slt t2, t0, t1
    xor t0, t1, t2
    srl t0, t1, t1
    sra t1, t0, t0
    or t0, t0, t1
    and t2, t2, t0
