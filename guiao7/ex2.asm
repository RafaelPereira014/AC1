# Mapa de registos:
# str: $a0 -> $s0 (argumento é passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved) 

	.data
	.align 2
	.eqv print_string,4
str:	.asciiz "ITED - orievA ed edadisrevinU"
	.text
	.globl main
exchange: lb $t1,0($a0)		#*c1
	  lb $t2,0($a1)		#*c2
	  sb $t1,0($a1)		#*c1=*c2
	  sb $t2,0($a0)		#*c2=*c1
	  jr $ra

strrev: addiu $sp,$sp,-16	# reserva espaço na stack
 	sw $ra,0($sp) 		# guarda endereço de retorno
 	sw $s0,4($sp) 		# guarda valor dos registos
 	sw $s1,8($sp)		# $s0, $s1 e $s2
 	sw $s2,12($sp) 		#
 	move $s0,$a0 		# registo "callee-saved"
	move $s1,$a0 		# p1 = str
 	move $s2,$a0 		# p2 = str
 	lb $t0,0($s2)
while1: beq $t0,'\0',endw1	# while( *p2 != '\0' ) {
 	addiu $s2,$s2,1		# p2++;
 	j while1 		# }
endw1:	addiu $s2,$s2,-1	# p2--;
while2: bge $s1,$s2,endw2	# while(p1 < p2) {
 	move $a0,$s1 		#
 	move $a1,$s2 		#
 	jal exchange 		# exchange(p1,p2)
 	addiu $s1,$s1,1		#p1++
 	addiu $s2,$s2,1 	#p2++
 	j while2 		# }
endw2: 	move $v0,$s0 		# return str
 	lw $ra,0($sp) 		# repõe endereço de retorno
 	lw $s0,4($sp) 		# repõe o valor dos registos
 	lw $s1,8($sp) 		# $s0, $s1 e $s2
 	lw $s2,12($sp) 		#
 	addiu $sp,$sp,16 	# liberta espaço da stack
	jr $ra 			# termina a sub-rotina 
	
	
main: 	addiu $sp,$sp,4		#guarda espaço
	sw $ra,0($sp)		#save $ra
	la $a0,str		#str argumento
	jal strrev		#chamar funçao
	move $a0,$v0		#mover para printar
	li $v0,4		#print(strrev(str))
	syscall
	li $v0,0		#return 0
	lw $ra,0($sp)		#ir buscar $ra
	addiu $sp,$sp,4		# devolver memoria guardada
	jr $ra			#fim