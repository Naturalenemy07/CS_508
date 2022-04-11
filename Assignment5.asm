# Name: John Caruthers
# Course: CS 508: Computer Organization and Design
# Assignment: 5
# Date: 11 Apr 22

# Program Description: Branching Logic, Loops, Arrays

# Register Usage: 
# s0: base address
# s1: large number
# s2: small number
# s3: index
# s4: offset
# s5: sum of offset and address
# s6: store number of values in array, this is hard coded
# t0: temporay storage of number prior to branching

	.data
arr:	.word	-160 -1830 922 -596 1432 -142 537 -94 2018 29	# offset: 0
large:	.word	0				# offset: 40
small:	.word	0				# offset: 44
	
	.text
main:	lui	s0,0x10010		# Base Memory Address
	lw	s1,40(s0)		# large number
	lw	s2,44(s0)		# small number
	
	or	s3,zero,zero 	# initialize index to zero
	addi	s6,zero,10		# store number of values in array (10) into s6
	
# Loop
iterator:	slli	s4,s3,2		# multiply index by 4 to get offset
	add	s5,s0,s4		# add offset to address and store as new address
	lw	t0,0(s5)		# store from memory into t0 for further comparison	
	blt	s1,t0,branch_G	# go to greater branch if array[index] is greater than number stored in large number register
	blt	t0,s2,branch_L	# go to lesser branch if array[index] is less than number stored in small number register
	
	# Branches
branch_G:	add	s1,t0,zero		# store array[index] into large number register
	beq	zero,zero,indaddex	# return to iterator for completion of loop
	
branch_L:	add	s2,t0,zero		# store array[index] into small number register
	beq	zero,zero,indaddex	# return to iterator for completion of loop
	
indaddex:	addi	s3,s3,1		# add 1 to index
	blt	s3,s6,iterator	# go back to beginning of loop if index is less than 10
	sw	s1,40(s0)		# store large number to memory
	sw	s2,44(s0)		# store small number to memory
	
	ori	a7,zero,10		# Exit program
	ecall
	
