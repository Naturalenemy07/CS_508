# Name: John Caruthers
# Course: CS 508: Computer Organization and Design
# Assignment: 4
# Date: 28 Feb 22

# Program Description: Arithmetic & Logic Operations, Register Management, Loading & Storing to Memory

# Register Usage: 
# 

	.data
y_num:	.half	78	# offset: 0, HexValue: 0x004e
w_num:	.half	-540	# offset: 2, Hexvalue: 0xfde4
x_num:	.byte	3	# offset: 4, HexValue: 0x03
z_num:	.byte	-7	# offset: 5, Hexvalue:
c_num:	.half	121	# offset: 6
d_num:	.byte	-10	# offset: 8 
f_num:	.half	90	# offset: 9
a_num:	.byte	-12	# offset: 11
b_num:	.half	720	# offset: 12
e_num:	.byte	-32	# offset: 14
h_result:	.word	0	# offset: 16
j_result:	.word	0	# offset: 20
k_result:	.word	0	# offset: 24

	
	
	.text
main:	lui	s0,0x10010	# Base Memory Address
# load appropriate data values from memory


# perform calculations for the three equations

# store the results to memory


exit:	ori	a7, zero, 10	# program exit system call
	ecall			# exit program
