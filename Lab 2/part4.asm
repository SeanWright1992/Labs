 #Lab 2 Part 4
#Mahaed Mohamud & Sean Wright
#ECEGR 2220 
#4/30/2018

    .data   # Data declaration section

arr:   .space   20
brr:   .word    1, 2, 4, 8, 16  

    .text

main:       # Start of code section
    
    # Read variables from memory to registers
    li  t1, 0        	# Loads 1 into t1
    la 	s1, arr		# Load A array reference into s0
    la 	s0, brr		# Load B into s0
   
    			#runs into forloop
loop: slti t0, t1, 5
    beq t0, x0, EndFor	#if t0 ==0 jumps to end
    slli t2, t1, 2	#shifts t1 value 2 stores in t2
    add t3, t2, s0	#adds shifted t1 value with array b stores in t3
    lw t4, 0(t3)	#loads t3 value into t4
    addi t4, t4, -1	#decrments t4
    slli t5, t1, 2	#shifts t1 value 2 stores in t5
    add t6, t5, s1	#adds a array and t1 shifted stores in t6
    sw 	 t4, 0(t6)	#moves the first value of t6 to t4
    addi t1, t1, 1	#increments t1
    j loop
EndFor:
    addi t1, t1, -1	#decrements t1
    li s3, 2		#put 2 into s3, use in the while loop
While:	slti t0, t1, 0	#when t1 <0 t0 = 0
    bne t0, x0, endWhi	#once t0 = 0 go to end
    slli t2, t1, 2	#shifts i by 2 left store in t2
    add t2, t2, s1
    lw t3, 0(t2)	#stores value of t2 into tw
    slli t4, t1, 2
    add t4, t4, s0
    lw t5, 0(t4)	#stores value of t4 which is b array indexing by t4
    add t5, t5, t3	
    mul t5, t5, s3	#multiplies t5 and 2
    sw t5, 0(t2)
    addi t1, t1, -1
    j While
endWhi:
    li  a7,10       #exits program
    ecall
