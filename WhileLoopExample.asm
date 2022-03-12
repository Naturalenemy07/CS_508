# Name: John Caruthers

# Program Description: While Loop Example

# Register Usage: 
# s0: base memory address
# t0: i
# t1: k
# t2: register to hold offset and offset, address of save[i]
# t3: array of half vlaues

	.data
save:	.half	0 1 2 3 4 5	# offset: 0
k:	.half	3	# offset: 24	
i:	.half	1	# offdet: 28
	
	.text
main:	lui	s0,0x10010	# Base Memory Address
loop:	lh	t3,0(s0)	# Load save into t3
	lh`	t1,24(s0)	# load k into t1
	lh	t0,28(s0)	# load i into t0
	slli	t2,t0,2	# 

exit:	ori	a7, zero, 10	# program exit system call
	ecall			# exit program
