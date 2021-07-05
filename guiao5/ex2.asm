# Mapa de registos
# p: $t0
# *p: $t1
# lista+Size: $t2
 	.data
str1: 	.asciiz "; "
str2: 	.asciiz "\nConteudo do array:\n"
lista:	.word 8,-4, 3, 5, 124, -15, 87, 9, 27, 15 # a diretiva ".word" alinha num endere�o m�ltiplo de 4
 	.eqv print_int10,1
 	.eqv print_string,4
 	.eqv SIZE,10
 
 	.text
 	.globl main
main: 	la $a0,str2 
	li $v0,4		# print_string("\nConteudo do array:\n")
	syscall
 	la $t0,lista 		# p = lista
 	li $t2,SIZE 		# t2=size
 	sll $t2,$t2,2 		# size *4 para avan�ar
 	addu $t2,$t2,$t0 	# $t2 = lista + SIZE;
while: 	bgeu $t0,$t2,endw 	# while(p < lista+SIZE) {
 	lw $t1,0($t0) 		# $t1 = *p;
 	or $a0,$t1,$0 		
 	li $v0,1		# print_int10( *p );
 	syscall
 	la $a0,str1
 	li $v0,4 		# print_string(;);
 	syscall
 	addiu $t0,$t0,4		# p++;
 	j while
endw:				# }
 	jr $ra 			# termina o programa. 