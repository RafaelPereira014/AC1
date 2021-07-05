# Mapa de registos
# res: $v0
# s: $a0
# *s: $t0
# digit: $t1
# Sub-rotina terminal: não devem ser usados registos $sx
	.data
	.eqv print_int10,1
str:	.asciiz "2016 e 2020 sao anos bissextos";
atoi: 	li $v0,0 # res = 0;
while: 	lb $t0,0($a0) # while(*s >= ...)
 	blt $t0,'0',endw ... #
 	bgt $t0,'9',endw # {
 	sub $t1,$t0,'0' # digit = *s – '0'
 	addiu $t0,$t0,1 # s++;
 	mul $v0,$v0,10 # res = 10 * res;
 	add $v0,$t1,$v0 # res = 10 * res + digit;
 	j while # }
endw: 	jr $ra # termina sub-rotina 


main:	addiu $sp,$sp,-4#guardar espaço
	sw $ra, 0($sp)	#guardar $ra
	la $a0,str	#load str
	
	jal atoi	#atoi(str)
	move $a0,$v0	
	li v0,1		#print(atoi[str))
	syscall	
	
	lw $ra,0($sp)	#devolver $ra armazenado
	addiu $sp,$sp,4 #devolver espaço
	li $v0,0	#return 0
	
	jr $ra		#fim
	