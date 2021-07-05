#Mapa de registos
# $t0:i
# $t1:j
#
#
#

	.data
	.eqv SIZE,3
	.eqv print_char,11
	.eqv print_string,4
	.eqv print_int10,1

str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "Ponteiros"
str4:	.asciiz "\nString #"
str5: 	.asciiz ": "

array: .word str1,str2,str3
	
	.text
	.globl main

main:
	li $t0,0	#i=0
	
for:	bge $t0,SIZE,endf 	# while i menor size
	la $a0,str4		#load str4 
	li $v0,4
	syscall			#print_str(\nString)
	or $a0,$t0,$0		#mover $t0 para a0
	li $v0,1
	syscall			#printint10 (i)
	la $a0,str5		#load str5
	li $v0,4
	syscall			#printstring(: )
	
	
	li $t1,0	#j=0
	
	#passar i*4 por ser word
while:		