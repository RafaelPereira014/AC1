#Mapa de registos



	.data
	.eqv SIZE,3
	.eqv print_str,4
	.eqv print_char,11
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "Ponteiros"
array:  .word str1,str2,str3


	.text
	.globl main
	
main:	li $t0,0		#i=0
for:	bge $t0,SIZE,endf	# while i<size
	la $t1,array		#endereço array
	sll $t2,$t0,2		#i*4
	addu $t2,$t2,$t1	#size[i]
	lw $a0,0($t2)		# 
	li $v0,4
	syscall
	li $a0,'\n'
	li $v0,11
	syscall
	addi $t0,$t0,1
	j for
endf: jr $ra
	