#Mapa de registos
# $t0: i
#$t1:array[i]
#t2:i*4


	.data
	.eqv SIZE,3
	.eqv print_str,4
	.eqv print_char,11
str2:	.asciiz "Array"
str3:	.asciiz "de"
str4:	.asciiz "ponteiros"
array:  .word str2,str3,str4
	.text
	.globl main
main:   li $t0,0	#i=0
	la $t1,array	#t1=array
	
for:	bge $t0,SIZE,endf	#while(i menos size)
	sll $t2,$t0,2		#i*4
	addu $t3,$t2,$t1	#array[i]
	lw $t4,0($t3)		#array[i] para registos		
	move $a0,$t4		# a0= array[i]
	li $v0,4		# print_string
	syscall
	li $a0,'\n'		#load str1
	li $v0,11		
	syscall			#print_char(\n)
	addi $t0,$t0,1		# i++
	j for			#voltar for
endf:	jr $ra
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	