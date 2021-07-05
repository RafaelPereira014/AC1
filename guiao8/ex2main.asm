# Mapa de registos
# str: $s0
# val: $s1
# O main é, neste caso, uma sub-rotina intermédia
 	.data
str: 	.space 33
 	.eqv STR_MAX_SIZE,33
	.eqv read_int,5
 	.eqv print_string,4
 	.text
 	.globl main
 	
main: 	addiu $sp,$sp,12	#save space
	sw $ra,0($sp)		#save $ra
	sw $s0,4($sp)		#s0
	sw $s1,8($sp)		#s1

do: 	li $v0,5		#
	syscall			#readint()
	move $s1,$v0		#val = readint()
	########################################### print_string( itoa(val, 2, str) );
	move $a0,$s1		#
	la $a1,'2'		#loadarguments
	la $a2,str		#
	
	jal itoa		#function
	
	move $a0,$v0
	li $v0,4		#print
	syscall
	
	########################################### print_string( itoa(val, 8, str) );
	move $a0,$s1
	la $a1,'8' 		#load arguments
	la $a2,str
	
	jal itoa		#function
	
	move $a0,$v0
	li $v0,4		#print
	syscall
	
	########################################### print_string( itoa(val, 16, str) );
	
	move $a0,$s1
	la $a1,'16'		#load arguments
	la $a2,str
	
	jal itoa		#function
	
	move $a0,$v0
	li $v0,4		#print
	syscall
	
	bne $s1,'0',do		#while(val != 0); 
	
	li $v0,0		#return 0
	
	
	lw $ra,0($sp)		#rescue $ra
	lw $s0,4($sp)		#reset space
	lw $s1,8($sp)		#reset space
	addiu $sp,$sp,12	#save space
	
	jr $ra			#end
	