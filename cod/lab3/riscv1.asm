.text
main:
addi s2, zero, 10 
# sw and lw test
sw s2, 8(s3)
lw s1, 4(s3)
ttt:
lw s1, 8(s3)
beq s1, s2, ttt
jal x0, tt
# s1 should be 10 now
# add and addi test
add s3, s1, s2
# s3 should be 20 now
sub s4, s3, zero
# s3 should be 5 now
# beq test
beq s3, s4, ttt
jaltest:
addi s9, zero, 1
# s5 should be 1 now
exit:
addi a7, zero, 10
beqtest:
addi s8, zero, 1
# s8 should be 1 now
# jump to jaltest
jal  a0, exit
tt:
addi x1, zero, 1
addi x1, zero, 1
addi x1, zero, 1
addi x1, zero, 1
