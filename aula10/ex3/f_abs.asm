	.data
	.text
	.globl f_abs

f_abs:	bgez $a0,endif
	mul $t0,$a0,-1
	move $a0,$t0
	
endif:	move $v0,$a0
	jr $ra