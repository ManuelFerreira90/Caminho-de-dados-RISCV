lw x0, 0(x1)
sw x2, 4(x3)
sub x5, x5, x5
xor x6, x6, x6
addi x5, x5, 10
srl x8 , x8, x5
beq x0,x0, loop
add x5, x5, x5
loop: