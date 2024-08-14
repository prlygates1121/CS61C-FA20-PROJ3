.text
main:
    addi t0, x0, -10
    addi t1, x0, 1
    addi t2, x0, 2
#     beq t0, t0, a
# a:
#     beq t0, t1, a
#     bne t0, t1, b
# b:
#     bne t0, t0, b
#     blt t0, t1, c
# c:
#     blt t1, t0, c
#     bge t1, t0, d
# d:
#     bge t0, t1, d
#     bltu t1, t2, e
# e:
#     bltu t2, t1, e
#     bgeu t2, t1, f
# f:
#     bgeu t1, t2, f
#     addi t0, x0, 233

    beq x0, x0, far
    addi t0, t0, 1
    sub t0, t0, t1
    xor t0, t0, t1
far:
    beq x0, x0, far2
far2:
    beq t0, x0, far3
    addi t0, t0, 3
    addi t1, t1, 9
far3:
    add t2, t1, t0
    beq x0, x0, far4
far4:
    beq t0, x0, far5
far5:
    beq x0, x0, far6
    addi a0, x0, 3
far6:
    add t0, t0, t0


