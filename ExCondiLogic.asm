# Example Program for conditionals

# Register Usage
# t0: val1
# t1: val2
# t3: result for ex1
# t4: result for ex2

	.data
val1:	.word	25	# offset: 0
val2:	.word	20	# offset: 4

	.text
main:	lui	s0, 0x10010
	lw	t0, 0(s0)		# load val1 into t0
	lw	t1, 4(s0)		# load val2 into t1
	
# if(val1 = val2){val4 = val1 + val2}
ex1:	beq	t0,t1,addvals
	beq	zero,zero,noadd
addvals:	add	t3,t0,t1
noadd:	# no execution

# if(val1 != val2) {val4 = val1 - val2}
ex2:	bne	t0,t1,subvals
	beq	zero,zero,nosub
subvals:	sub	t4,t0,t1
nosub:	# no execution

exit:	ori	a7,zero,10
	ecall
