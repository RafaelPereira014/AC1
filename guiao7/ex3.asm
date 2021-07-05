# Mapa de registos:
# str: $a0 -> $s0 (argumento é passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved) 


	.data
	.eqv STR_MAX_SIZE, 30		# define STR_MAX_SIZE 30
str1:	.asciiz	"Arquitectura de Computadores I"		# static char str1[]="I serodatupmoC ed arutetiuqrA";
str2:	.space 31			# static char str2[STR_MAX_SIZE + 1];		
str3:	.asciiz "\n"
str4:	.asciiz "String too long: "

strrev: addiu $sp,$sp,-16	# reserva espaço na stack
 	sw $ra,0($sp) 		# guarda endereço de retorno
 	sw $s0,4($sp) 		# guarda valor dos registos
 	sw $s1,8($sp)		# $s0, $s1 e $s2
 	sw $s2,12($sp) 		#
 	move $s0,$a0 		# registo "callee-saved"
	move $s1,$a0 		# p1 = str
 	move $s2,$a0 		# p2 = str
 	lb $t2,0($s2)
while1: beq $t2,'\0',endw1	# while( *p2 != '\0' ) {
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
	
strlen: li $t1,0		#len=0
while:	lb $t0,0($a0)		#*s
	addiu $a0,$a0,1 	#s++       ???????
	beq $t0,'\0',end	#s!=\0
	addi $t1,$t1,1		#len++
	j while			#volta while
endw: 	move $v0,$t1		#return len
	jr $ra			#	
strcpy:
	li $t3,0		#i=0
do:	add $t4,$t3,$a0		#dst+i
	add $t5,$t3,$a1		#src+i
	
	lb $t6,0($t5)		#
	sb $t6,0($t4)		#dst[i]=src[i]
	addi $t3,$t3,1		#i++
	add $t5,$t3,$t5		#src[i++]
	bne $t5,'\0',do		#src[i++]!=\0
enddo:	move $v0,$a0		#return dst
	jr $ra			#termina sub-rotina
	

main: 	addiu $sp,$sp,-4	#guardar espaço
	sw $ra,0($sp)		#guardar $ra
	la $a0,str1		#str argumento
	
	jal strlen		#strlen(str)
	move $t7,$v0		
if:	blt $t7,30,else		#(strlen(str1) <= STR_MAX_SIZE)
	la $a0,str2		#str2 - 1
	la $a1,str1		#str1 - 1
	jal strcpy		#strcpy(str2,str1)
	move $a0,$v0
	li $v0,4		#print_string(str2);
	syscall
	la $a0,str3		#print_string("\n"); 
	syscall
	la $a0,str2		
	jal strrev		#strrev(str2)
	move $a0,$v0
	li $v0,4		#print_string(strrev(str2)); 
	syscall
	
	li $v0,0		#exit_value=0
	j endif	
	
else:	la $a0,str4		
	li $v0,4		#print_string("String too long: "); 
	syscall

	move $a0,$t7
	li $v0,1		#print_int10(strlen(str1)); 
	syscall
	
	li $v0,-1		#exit_value=-1
	
endif: 	lw $ra,0($sp)		#ir buscar valor ra
	addiu $sp,$sp,4		#devolver espaço
	jr $ra			#fim
