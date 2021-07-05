	.data
str1:	.asciiz "Valor de x: "
str2:	.asciiz "\nResultado: "
	.eqv print_string, 4
	.eqv read_double, 7
	.eqv print_double, 3
	.text
	.globl main
	
main:	addiu $sp,$sp,-4		
	sw $ra,0($sp)		
					
	la $a0,str1		
	li $v0,print_string		
	syscall				# print_string(str1);
	li $v0,read_double	
	syscall				
	mov.d $f12,$f0			# val = read_double;
	jal sqrt			# xtoy(val)
	la $a0,str2			
	li $v0, print_string	
	syscall				# prin_string(str2);
	mov.d $f12,$f0		
	li $v0, print_double		# print_double(return(xtoy(val)));
	syscall	
					
	lw $ra,0($sp)		
	addiu $sp,$sp,4		
	li $v0,0			
	jr $ra		