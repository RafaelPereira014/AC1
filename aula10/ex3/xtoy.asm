	.data
f1:	.double 1.0	
	.text
	.globl xtoy
	
xtoy:	addiu $sp,$sp,-28
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	s.d $f20,12($sp)
	s.d $f12,20($sp)
	
	li $s0,0	# i = 0
	la $t0,f1	# $t1 = f1
	l.d $f20,0($t0)	# result = 1.0
	move $s1,$a0	# $s1 = y
	move $a0,$s1
	jal f_abs	# abs(y)
	
	move $t1,$v0	# $t1 = abs(y)		
	
for:	bge $s0,$t1,endfor
	
if:	ble $s1,0,else
	mul.d $f20,$f20,$f12
	j endif
	
else:	div.d $f20,$f20,$f12	

endif:	addi $s0,$s0,1	# i++
	j for
	
endfor:	mov.d $f0,$f20	# return result
	lw $ra,0($sp)		
	lw $s0,4($sp)		
	lw $s1,8($sp)		
	l.d $f20,12($sp)
	l.d $f22,20($sp)		
	addiu $sp,$sp,28		
	
	jr $ra

