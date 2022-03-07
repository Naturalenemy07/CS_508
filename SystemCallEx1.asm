# sample system call for user input

	.data
prompt:	.asciz	"Enter and integer:\t"
reply:	.word	0
	
	.text
main:	lui	s0,0x10010	# memory base address
	# print the prompt
	ori	a7,zero,4	# system call for print string in a7
	la	a0,prompt	# load address of string into a0
	ecall		# prints string to console
	
	# get user feedback
	ori	a7,zero,5	# read integer
	ecall
	sw	a0,20(s0)	# store the read number into memory
	
exit:	ori	a7,zero,10	# system call to exit program
	ecall
