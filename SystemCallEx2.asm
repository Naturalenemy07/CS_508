# System call example two, gets user input and returns that value, also prints an ascii character
# this code uses pseudo code

		.data
str1:	.asciz	"Hello, World!\n"
str2:	.asciz	"Enter an integer:\t"
str3:	.asciz	"The number entered was "

	.text
main:	
	# print first two strings
	ori	a7,zero,4		# system call to print string (4)
	la	a0,str1		# address of str1
	ecall			# print str1
	la	a0,str2		# address of str2
	ecall			# print str2
	
	# get input from user, save input to temp register
	ori	a7,zero,5		# system call to read integer (5)
	ecall			# read integer
	or	t0,zero,a0		# copy value to t0 using OR and zero... genius
	
	# print third string and input from t0
	ori	a7,zero,4		# system call to print string (4)
	la	a0,str3		# load address into a0
	ecall
	ori	a7,zero,1		# system call to print integer (1)
	or	a0,zero,t0		# copy integer to a0 using OR again
	ecall
	
	# Next, print a punctuation mark using ASCII character
	ori	a7,zero,11		# system call to print an ascii character
	ori	a0,zero,0x21	# load ascii character for "!" into a0, need to use ori
	ecall
	
exit:	ori	a7,zero,10 # system call for exit(10)
	ecall
	
	
