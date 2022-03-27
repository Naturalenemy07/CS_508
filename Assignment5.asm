# Name: John Caruthers
# Course: CS 508: Computer Organization and Design
# Assignment: 5
# Date: 27 Mar 22

# Program Description: Branching Logic, Loops, Arrays

# Register Usage: 
# s0: base address
# s1: array
# s2: large number
# s3: small number
# s4: counter
# s5: offset
# s6: sum of offset and address

	.data
arr	.word	-160 -1830 922 -596 1432 -142 537 -94 2018 29	# array
large	.word	0
small	.word	0
	
	.text
main:	lui	s0,0x10010	# Base Memory Address
	lw	s1,0(s0)	# array of signed
	lw	s2,40	# large number
	lw	s3, 44	# small number
	
iterator:	
