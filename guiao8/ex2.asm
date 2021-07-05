# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0
# Sub-rotina intermédia
	.data
	.text
toascii:add $v0,$v0,'0'		#v += '0'
if:	ble $v0,'9',endif	#v > '9' 
	add $v0,$v0,'7'		#v+=7
endif:	move $v0,$a0		#return V
	jr $ra			#fim


itoa: 	addiu $sp,$sp,-20 	# reserva espaço na stack
	sw $ra,0($sp)		#$ra guardado
	sw $s0,4($sp) 		# guarda registos $sx e $ra
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	move $s0,$a0		# copia n, b e s para registos
	move $s1,$a1
	move $s2,$a2		# "callee-saved")
 	move $s3,$a2 		# p = s;
do: 				# do {
	rem $t0,$s0,$s1		#digit = n % b; 
 	div $s0,$s0,$s1 	#n = n / b;
 	move $a0,$t0
 	jal toascii
 	sb $v0,0($s3)
 	addiu $s3,$s3,1
 	bgt $s0,'0',do 		# } while(n > 0);
 	sb $0,0($s3) 		# *p = 0;
 	la $a0,$s2 		#
 	jal strrev 		# strrev( s );
 	move $v0,$s2		#return s
 				# repõe registos $sx e $ra
 	lw $ra,0($sp)		#$ra guardado
	lw $s0,4($sp) 		# guarda registos $sx e $ra
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
 	addiu $sp,$sp,20 # liberta espaço na stack
	jr $ra # 