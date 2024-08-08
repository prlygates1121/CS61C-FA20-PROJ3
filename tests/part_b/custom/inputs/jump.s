.text
_start:
    li x5, 0
    li x6, 0
    li x7, label2

    jal x5, label1

    addi x7, x7, 0
    jalr x6, x7, 0

label1:
    jal x0, label2

label2:
    li x5, 1000