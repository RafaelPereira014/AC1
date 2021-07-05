	.data
	.eqv print_string,4
	.eqv print_double,3
	.eqv read_double,7
	.eqv read_int,5
str1:	.asciiz "\nQual o valor de x? "
str2:	.asciiz "\nQual o valor de y? "
str3:	.asciiz "\nResultado: "
	.text
	.globl main
	
main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0,str1
	li $v0,print_string
	syscall			# print_string(str1)
	
	li $v0,read_double
	syscall
	mov.d $f12,$f0		# x = read_double()
	
	la $a0,str2
	li $v0,print_string
	syscall			#  print_string(str2)
	
	li $v0,read_int
	syscall
	move $a0,$v0		# y = read_int()
	
	jal xtoy		# xtoy(x,y)
	mov.d $f12,$f0		# resultado = return(xtoy(x,y))
	
	la $a0,str3
	li $v0,print_string
	syscall			#  print_string(str3)
	
	li $v0,print_double
	syscall			# print_double(result)
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	li $v0,0
	jr $ra