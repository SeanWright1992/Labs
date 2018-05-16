#Sean Wright
#Microprocessor Design
#5/14/2018
#lab 4 part 3

.data

	a:	.word	0	#stores variables a,b,c
	b:	.word	0
	c:	.word 	0

.text
main:

	addi	a2,zero,3 	#To perform fibonacci(3)
	jal	fibseq
	sw	a0,a,t6		#stores 
	
	addi	a2,zero,10 	#To perfrom fibonacci(10)
	jal	fibseq
	sw	a0,b,t6

	addi	a2,zero,20 	#To perform fibonacci(20)
	jal	fibseq
	sw	a0,c,t6
	
	li a7,10		#exists
	ecall

	

fibseq:
	addi 	sp,sp,-12	#allocate stack with room for 3 ints in stack pointer
	sw 	ra,0(sp)	#stores first number into ra
	sw 	s0,4(sp)	#stores second number into s0
	sw 	s1,8(sp)	#stores last number into final slot

	add 	s0,a2,zero	#adds whatever input is(3,10,20) into s0
	addi	t1,zero,1	#t1 = 1
	beq 	s0,zero,ret0	#if s0 = 0, jumps to ret0
	beq 	s0,t1,ret1	#if s0 = 1, jumps to ret1

	addi 	a2,s0,-1	#store input -1 into a2
	jal 	fibseq
	add 	s1,zero,a0	#s1=fib(n-1)
	addi 	a2,s0,-2	#stores input -2 into a2
	jal 	fibseq		#fib(n-2)
	add 	a0,a0,s1       	#a0=fib(n-2)+fin(n-1)
	
exit:
	lw 	ra,0(sp)       	#loads registers from stack
	lw 	s0,4(sp)	#loads the second entry in the stack
	lw 	s1,8(sp)	#loads the final entry in the stack
	addi 	sp,sp,12  	#deallocates stack 
	jr 	ra,0		

ret1:
	li	a0,1		#loads 1 into a0
	j	exit		#jumps to exit
	
ret0 :     
	li 	a0,0		#loads 0 into a0
	j	exit		#jumps to exit
	

