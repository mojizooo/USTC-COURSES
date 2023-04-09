.text
main:
# initialize
li s11, 5
li s2, 1
li s3, 2
# use s1 as a counter
li s1, 1
# fibo
fibo:
# s4 = s1 + s2
add s4, s2, s3
# s2 = s3, s3 = s4
sw s3, 0(s7)
lw s2, 0(s7)
sw s4, 0(s7)
lw s3, 0(s7)
# add counter value
addi s1, s1, 1
blt s1, s11, fibo
