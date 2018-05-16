#Sean Wright
#Microprocessor design
#5/15/2018
#Lab 4 part 4

main:	
	#test add
	li t0 0x00000001
	li t1 0x01234567

	add s0 t0 t1
	
	#test subtract
	li t0 0x00000002
	li t1 0x00000001
	sub s1 t0 t1

	#test add immediately 
	li t0 0x00000001
	addi s2 t0 0x00000001
	
	#test and
	li t0 0x11111111
	li t1 0x00000000
	and s3 t0 t1
	
	#test and immediately
	li t0 0x00100000
	andi s4 t0 0x00001 
	
	#test or
	li t0 0x10101010
	li t1 0x01010101
	or s5 t0 t1

	#test or immediately
	li t0 0x00000001
	ori s6 t0 0x00001

	#test shift left
	li t0 0x11111110
	li t1 0x00000001
	sll s7 t0 t1

	#test shift right 
	srl s8 t0 t1

	
	li a7, 10

	ecall
