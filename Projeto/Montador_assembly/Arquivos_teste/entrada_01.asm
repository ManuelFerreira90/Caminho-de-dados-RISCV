addi x2, x0, 7
sw x2, 4(x0)
lw x1, 4(x0)
add x2, x1, x0
add x1, x1, x2
add x1, x1, x2
sub x1, x1, x2
sub x1, x1, x2
beq x1 x2 12
add x1, x1, x1
sw x1, 0(x0)
and x1, x1, x2
or x1, x1, x0
sw x1, 0(x0)