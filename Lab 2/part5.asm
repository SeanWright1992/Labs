# Lab 2 Part 5 - Function Call

	.data

a:	.word	0
b:	.word	0
c:	.word	0

	.text
main:
	addi	t0,x0,5		# i = 5
	addi	t1,x0,10	# j = 10
	addi	sp,sp,-8	# allocate memory
	sw	t0,0(sp)	# store 5 in stack for calling additup 5.
	sw	t1,4(sp)	# store 10 in stack for calling additup 10.
	jal	addItUp		# go to additup with 0(sp) = 4
	
	sw	a0,a,t6
	lw 	s3, a		#moves a value to s3
	
	lw	t1,4(sp)
	sw	t1,0(sp)	#store 10 in first spot of stack to run same logic as with 5.
	jal 	addItUp		#go to additup with 0(sp) = 10
	
	sw	a0,b,t6		#stores b into a0 offset t6
	lw 	s4, b		#moves b value to s4
	
	add 	t5, s3, s4	#c = a+b
	sw 	t5, c, t6	#store c value into t5 offset t6
	
    	li  	a7, 1		# print integer
    	lw  	a0, c		#moves c value to a0
    	ecall
	li  	a7,10		#system call for an exit
    	ecall

addItUp:
	lw	a2, 0(sp)	#load first int of sp into register (5 and then 10)
	addi 	t0, x0, 0	#x = 0
	addi	t1, x0,0	#i = 0
	j loop
	
loop:
	add	t0, t0, t1	# x = x + i
	addi	t0, t0, 1	# gets final value x = x + 1
	addi	t1, t1, 1	# increments i
	blt	t1, a2, loop	#if i > value of a2( a2 is 5 then 10) then repeats forloop
	add	a0, zero,t0	#store final x value into return register a0
	ret