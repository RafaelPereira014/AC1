#Mapa de Registos
#$t0=*s
#$t1=len


	.data
	.eqv print_int10,1
str:	.asciiz  "Arquitetura de Computadores I"
	.globl main
strlen: li $t1,0		#len=0
while:	lb $t0,0($a0)		#*s
	addiu $a0,$a0,1 	#s++       ???????
	beq $t0,'\0',end	#s!=\0
	addi $t1,$t1,1		#len++
	j while			#volta while
endw: 	move $v0,$t1		#return len
	jr $ra			#
	  
	  
main: 	addiu $sp, $sp,-4	#ra store
	sw $ra,0($sp)		#ra saved
	la $a0,str		#argumento str
	jal strlen		#
	move $t2,$v0		#
	
	li $v0,1		#
	move $a0,$t2
	syscall
	
	li $v0,0
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra
