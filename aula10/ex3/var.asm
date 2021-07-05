	.data
d1:	.double 0.0
	.text
	.globl var
	
var:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $t0,d1
	l.d $f2,0($t0)	# soma = 0.0
	
	li $t0,0	# i = 0
	
	jal average	# average(array,nval)
	
	mov.d $f4,$f0	# media = average(array,nval)
	
for:	bge $t0,$a1,endfor
	
	la $t1,$a0	# t1 = &(array)
	sll $t2,$t0,3	# i * 4
	addu $t3,$t1,$t2	# $t3 = &(array[i])
	l.d $f6,0($t3)		# $f6 = array[i]
	sub.d $f6,$f6,$f4	# $f6 = array[i]-media
	move $f12,$f6
	li $a0,2
	jal xtoy		# xtoy(array[i]-media,2)
	add.d $f2,$f2,$f0	# soma += xtoy(array[i] - media, 2)
	addi $t0,$t0,1		# i++
	j for
	
endfor: div.d $f2,$a1		# soma / nval
	move $f12,$f2		# return soma/val
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	jr $ra
	