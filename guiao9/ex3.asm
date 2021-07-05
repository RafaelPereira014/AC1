#Mapa de Registos
#$t0:i
#
#
#

	.data
	.eqv SIZE,10
	.eqv print_double,
	.eqv read_int,5
array:	.space 80
sum:	.double 0.0
	
	.text
average:move $t0,$a1
	la $t1,sum
	l.d $f1,0($t0)
for:	ble $t0,0,endfor
	

main:	addiu $sp,$sp,-16
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,12($sp)
	
	li $t0,0
	la $s0,array
for1:	bge $t0,SIZE,endfor1
	addiu $t1,$t1,$t0
	li $v0,5
	syscall
	mtc1.d $v0,$f0
	
	move $f0,$t1
	addiu $t0,$t0,1
	j for1
	
endfor1:la $a0,array
	li $a1,SIZE
		
	jal average
	
	li $v0,7
	syscall
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,12($sp)
	addiu $sp,$sp,16
	li $v0,0
	jr $ra
