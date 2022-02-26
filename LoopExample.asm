# Name: John Caruthers
# RISC-V Loop Example
# Date: 26 Feb 22

# Sample Loop Program

# Register Usage
# s0: Base Address-0x10010
# t0: Number of elements
# s1: Counter
# s2: Offset
# s3: Sum of the Base Address and Offset

	.data
array:	.word	0 0 0 0 0

	.text
main:
	lui	s0,0x10010		# base address
	addi	t0,zero,5		# number of elements
	or	s1,zero,zero	# initialize counter
	
loop:	slli	s2,s1,2		# 2^s1 into s2, need to use 
	add	s3,s0,s2		# add offset to base address
	sw	s1,0(s3)		# store the counter value to array
	
	addi	s1,s1,1		# increment the counter
	blt	s1,t0,loop
	
exit:	ori	a7,zero,10
	ecall
