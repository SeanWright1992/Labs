#Sean Wright
#Microprocessor Design
#5/14/2018
#lab 4 part 2

.data
	Val1: .float 5.0
	Val2: .float 9.0
	Val3: .float 32.0
	Val4: .float 273.15
	ValCelsius: .float 0
	ValKelvin: .float  0
	ValFahrenheight: .float 0
	user:	.asciz	"Enter Temperature (Fahrenheight): "
	Cel:	.asciz  "Equivalent Temperature in Celsius: "
	Kel:	.asciz	"Equivalent Temperaturein Kelvin: "
	newln:	.asciz	"\r\n"
main:
	# Formula for:
	# Celsius = (Fahrenheit – 32.0) x 5.0 / 9.0
	# Kelvin = Celsius + 273.15
	.text
	li	a7, 4			#prints out enter temperature string
	la	a0, user
	ecall
	
	li	a7, 6			#system call for reading floating point
	ecall
	fmv.s	ft1,fa0	 		# puts user input in ft1
	
	fsw f10, ValFahrenheight, t0	#stores fahrenheight to f10 register
	
	jal temperatureConverter	
	
	li a7, 4			#prinits out a new line
	la a0, newln
	ecall
	
	li a7, 4			#prints out celsius:
	la a0, Cel
	ecall
	
	flw fa0, ValCelsius, t0		#loads and prints out celsius value
	li a7, 2
	ecall
	
	li a7, 4			#prints a blank line
	la a0, newln
	ecall
	
	li a7, 4			#prints out kelvin:
	la a0, Kel
	ecall
	
	flw fa0, ValKelvin, t0		#loads and prints out celsius value
	li a7, 2
	ecall
	j End				#jumps to end to finish program
	
temperatureConverter:
	flw f0, ValFahrenheight, t0	#loads entered floating point into f0
	flw f1, Val1, t0 		# 5
	flw f2, Val2, t0 		# 9
	flw f3, Val3, t0 		# 32
	flw f4, Val4, t0 		# 273.15
	fsub.s f0, f0, f3		#Performs first operation, F-32, then stores in old F register
	fmul.s f0, f0, f1		#performs (f-32)*5
	fdiv.s f0, f0, f2		#performs((f-32)*5)/9, stores in f0 register
	fsw f0, ValCelsius, t0		#stores value of f0 into the ValCelsius 
        fadd.s f0, f0, f4		#performs operation of celsusis + 273.15
	fsw f0, ValKelvin, t0		#
	ret
	
End:
	ecall