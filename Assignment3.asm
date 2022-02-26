# Name: John Caruthers
# Assignment: 3
# Date: 17 Feb 22

# Program Description: Memory and Defining Data

# Register Usage: 
# no registers used in program

	.data
num1:	.byte	127	# offset = 0, memory address = 0x10010000
num2:	.byte	-128	# offset = 1, memory address = 0x10010001
num3:	.half	65535	# offset = 2, memory address = 0x10010002
num4:	.half	255	# offset = 4, memory address = 0x10010004
num5:	.word	-1	# offset = 8, memory address = 0x10010008
strg1:	.ascii	"A1 B2 C3"	# offset = 12, memory address = 0x1001000c
strg2:	.asciz	"Z"	# offset = 20, memory address = 0x10010014
spc1:	.space	12	# offset = 22, memory address = 0x10010016
	
	
	.text
main:


exit:	ori	a7, zero, 10	# program exit system call
	ecall			# exit program
