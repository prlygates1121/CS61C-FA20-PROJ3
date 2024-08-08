.text
main:
    addi t0, x0, -10
    addi t1, x0, 1
    addi t2, x0, 2
    beq t0, t0, a
a:
    beq t0, t1, a
    bne t0, t1, b
b:
    bne t0, t0, b
    blt t0, t1, c
c:
    blt t1, t0, c
    bge t1, t0, d
d:
    bge t0, t1, d
    bltu t1, t2, e
e:
    bltu t2, t1, e
    bgeu t2, t1, f
f:
    bgeu t1, t2, f
    addi t0, x0, 233
