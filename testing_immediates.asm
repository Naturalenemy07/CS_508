	.data
int:	.byte	5
	.half	0xfe

	.text
main:	lui	s0,0x10010
	lb	t0,0(s0)
	lh	t1,2(s0)
	
	addi	s3,t0,2
	addi	s4,t0,0x02
	addi	s5,t0,-2
	addi	s6,t0,0xfe
	add	s7,t1,zero
	addi	s8,t1,5
	add	s9,t1,t0
	addi	s10,t0,0xfffffffe
