#Mapa de Registos
#
#
#
#


	.data
	.eqv print_str,4
	.eqv print_intu10,36
	.eqv print_char,11
	.eqv print_float,2
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz "\nNome: "
str3:	.asciiz "\nNota: "
	.eqv id_number,0
	.eqv firstname,4
	.eqv last_name,24
	.eqv grade,40
stg:	.word 72343
	.asciiz "Napoleao"
	.space 9
	.asciiz "Bonaparte"
	.space 5
	.float 5.1

	.text
	.globl main

main:	la $a0,str1
	li $v0,4
	syscall
	la $t0,stg
	lw $a0,id_number($t0)
	li $v0,36
	syscall
	la $a0,str2
	li $v0,4
	syscall
	lw $a0,last_name($t0)
	li $v0,4
	syscall

	
	
