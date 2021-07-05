# Mapa de registos
# i:$t0
# p :$t1
# endereço (i) = $t3


	
	.data
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "Ponteiros"

p: 	.word str1,str2,str3
	
	.eqv print_string,4
	.eqv print_char,11
	.eqv SIZE,3
	.text
	.globl main
 
main: 	li $t0,0		#i=0
for: 	bgt $t0,SIZE,endfor 	#for(i<size)
	la $t1,p		# criação array p
	sll $t2,$t0,2		#multiplicação endereço por 4 (2^2)
	addu $t3,$t1,$t2	#t3= endereço p[i]
	lw $a0,0($t3)		#a0=p[i]
	li $v0,4		# print_string
	syscall
	li $v0,11
	syscall
	addiu $t0,$t0,1		#i++;
	j for 			#}
endfor: jr $ra 