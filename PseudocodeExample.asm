# Demo for pseudoinstructions (la, mv, snez, sltz, not)

	.data
string:	.asciz	"Hello, World!"	# first string printed amongst CS students

	.text
main:
	# print string to the run io console
	la	a0,string		# load address of sting to a0
	ori	a7,zero, 4		# putting value 4 into a7, 4 is the system call code for printing a string
	ecall			# prints the string
	
	mv	s1,a0		# copys value from a0 into s1
	snez	t0,s1		# t0 = 1
	sltz	t1,t0		# t1 = 0
	not	t3,a0		# complement bits of a0
	not	t4,t3		# bits of string into t4
	
	
	
exit:	ori	a7,zero,10		# exit program system call
	ecall
