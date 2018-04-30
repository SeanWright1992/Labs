 #Lab 2 Part 3
 #Sean Wright
#ECEGR 2220 
#4/30/2018

	.data	# Data declaration section
	
Z:	.word	2
I:	.word	

	.text #Readable only section include executable code
main:
	la x1, Z		# Z
	la x2, I		# I
	lw x28,0(x1)		#for math use x28 as Z
	lw x29, 0(x2)		#for logic use x29 as I
	li x5,20		#x5 = 20, use in for loop
	li x6, 99		#x6 = 99 for the while loop
	li x7,1			#x7 = 1, use for the subtraction loop
	slt x16, x29,x5		#gets 1 if x2 (I) < x5 (20)
	bne x16,x0	loop
	
loop:
	beq x29,x5	do
	addi x28,x28,1
	addi x29,x29,2
	j	loop

do:
	addi x28,x28, 1
	beq x28,x6	while
	j	do
	
while:
	beq x29,x7	exit
	sub x29,x29,x7
	sub x28,x28,x7
	j	while
	
exit:
	sw x28,0(x1)
	sw x29,0(x2)
	
