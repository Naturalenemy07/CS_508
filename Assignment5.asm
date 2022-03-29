# Name: John Caruthers
# Course: CS 508: Computer Organization and Design
# Assignment: 5
# Date: 27 Mar 22

# Program Description: Branching Logic, Loops, Arrays

# Register Usage: 
# s0: base address
# s1: large number
# s2: small number
# s3: index
# s4: offset
# s5: sum of offset and address
# s6: store number of values in array, this is hard coded
# t0: temp display of values from array for me to test loop

	.data
arr:	.word	-160 -1830 922 -596 1432 -142 537 -94 2018 29	# array
large:	.word	0
small:	.word	0

# testing strings
#text:	.asciz	"loop works!\n"
	
	.text
main:	lui	s0,0x10010		# Base Memory Address
	lw	s1,40(s0)		# large number
	lw	s2,44(s0)		# small number
	
	or	s3,zero,zero 	# initialize index to zero
	addi	s6,zero,10		# store number of values in array (10) into s6
	
iterator:	slli	s4,s3,2		# multiply index by 4 to get offset
	add	s5,s0,s4		# add offset to address and store as new address
	lw	t0,0(s5)		# store from memory into t0 for further comparison	
	# compare
	bgt	t0,s1,greater	# go to greater branch if array[index] is greater that the number stored in large number register
	
indexadder:	addi	s3,s3,1		# add 1 to index
	blt	s3,s6,iterator	# go back to beginning of loop if index is less than 10
	
greater:	add	s1,t0,zero		# store array[index] into large number register
	beq	zero,zero,indexadder	# return to iterator for completion of loop
