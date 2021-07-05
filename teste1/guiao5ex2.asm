#Mapa REgistos




	.data
	.eqv SIZE 10
	.eqv print_string,4
	.eqv print_int10,1

lista: .word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15

str1: 	.asciiz "\nConteudo do array:\n"
str2: 	.asciiz "; "

	.text
	.globl main
	
main:	la $a0,str1
	li $v0,4
	syscall
	la $t0,lista #p=lista endeço
	li $t1,SIZE
	sll $t1,$t1,2
	addu $t1,$t1,$t0
while: 	bgeu $t0,$t1,endfor
	lw $t2,0($t0)
	or $a0,$t2,$0
	li $v0,1
	syscall
	la $a0,str2
	li $v0,4
	syscall
	addi $t0,$t0,4
	j while
endfor: jr $ra