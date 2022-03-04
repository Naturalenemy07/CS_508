# Name: John Caruthers
# Course: CS 508: Computer Organization and Design
# Assignment: 4
# Date: 03 Mar 22

# Program Description: Arithmetic & Logic Operations, Register Management, Loading & Storing to Memory

# Register Usage: 
# s4: y_num
# s5: w_num
# s6: x_num
# s7: z_num
# s8: c_num
# s9: d_num
# s10: f_num
# s11: a_num
# t0: b_num
# t1: e_num
# s1: h_result
# s2: j_result
# s3: k_result

	.data
y_num:	.half	78	# offset: 0, Hex Value: 0x004e
w_num:	.half	-540	# offset: 2, Hex Value: 0xfde4
x_num:	.byte	4	# offset: 4, Hex Value: 0x04
z_num:	.byte	-7	# offset: 5, Hex Value: 0xf9
c_num:	.half	121	# offset: 6, Hex Value: 0x0079
d_num:	.byte	-10	# offset: 8, Hex Value: 0xf6
f_num:	.half	1207	# offset: 10, Hex Value: 0x04b7
a_num:	.byte	-11	# offset: 12, Hex Value: 0xf5
b_num:	.half	720	# offset: 14, Hex Value: 0x02d0
e_num:	.byte	-2	# offset: 16, Hex Value: 0xfe
h_result:	.word	0	# offset: 20
j_result:	.word	0	# offset: 24
k_result:	.word	0	# offset: 28

	
	
	.text
main:	lui	s0,0x10010	# Base Memory Address
# load appropriate data values from memory
	lh	s4,0(s0) 	# store y_num in s4
	lh	s5,2(s0)	# store w_num in s5
	lb	s6,4(s0)	# store x_num in s6
	lb	s7,5(s0)	# store z_num in s7
	lh	s8,6(s0)	# store c_num in s8
	lb	s9,8(s0)	# store d_num in s9
	lh	s10,10(s0)	# store f_num in s10
	lb	s11,12(s0)	# store a_num in s11
	lh	t0,14(s0)	# store b_num in t0
	lb	t1,16(s0)	# store e_num in t1
	
# perform calculations for the three equations
	# Equation 1
	add	t2,s4,s5	# t2 = y_num + w_num
	srli	t3,s6,2	# t3 = x_num / 4
	sub	t4,t2,t3	# t4 = (y_num + w_num) - (x_num / 4)
	add	t5,t4,s7	# t5 = ((y_num + w_num) - (x_num / 4)) + z_num
	xori	s1,t5,-1	# h_result = (((y_num + w_num) - (x_num / 4)) + z_num) XOR (-1)
	
	# Equation 2
	sub	t2,s8,s9	# t2 = c_num - d_num
	slli	t3,t0,1	# t3 = b_num * 2
	add	t4,s10,s11	# t4 = f_num + a_num
	sub	t5,t3,t1	# t5 = (b_num * 2) - e_num
	add	t6,t4,t5	# t6 = f_num + a_num + (b_num * 2) - e_num
	sub	t3,t2,t6	# t3 = (c_num - d_num) - (f_num + a_num + (b_num * 2) - e_num)
	or	s2,t3,s1	# j_result = (c_num - d_num) - (f_num + a_num + (b_num * 2) - e_num) OR h_result
	
	# Equation 3
	add	t2,s1,s2 	# t2 = h_result + j_result
	sub	t3,s1,s2	# t3 = h_result - j_result
	and	s3,t2,t3	# k_result = (h_result + j_result) AND (h_result - j_result)

# store the results to memory
	sw	s1,20(s0)	# store h_result
	sw	s2,24(s0)	# store j_result
	sw	s3,28(s0)	# store k_result

exit:	ori	a7, zero, 10	# program exit system call
	ecall			# exit program
