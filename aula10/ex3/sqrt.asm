	.data
d1:	.double 1.0
d2:	.double 0.5
d3:	.double 0.0
	.text
	.globl sqrt
	
sqrt:	la $t1,d1
	l.d $f4,0($t1)	# double xn = 1.0
	
	la $t0,d2
	l.d $f6,0($t0)	# $f6 = 0.5
	
	la $t0,d3
	l.d $f8,0($t0)	# $f8 = 0.0
	
	li $t0,0	# i = 0
	
if:	c.le.d $f12,$f8
	bc1t else
	
do:	mov.d $f2,$f4
	div.d $f4,$f12,$f4	# xn = val/xn
	add.d $f4,$f4,$f2	# xn = aux + val/n
	mul.d $f4,$f6,$f4	# xn = 0.5 * (xn + val/xn)
	
while:	c.eq.d $f2,$f4
	bc1t endif
	addi $t0,$t0,1
	blt $t0,25,do
	j endif	

else:	mov.d $f4,$f8	# xn = 0.0

endif:	mov.d $f0,$f4	# return xn
	jr $ra
	
	