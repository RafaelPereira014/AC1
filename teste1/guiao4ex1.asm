#Mapa de Registos
#$t0:i
#$t1:num
#$t2: str[i]
#$t3


	.data
	.eqv SIZE, 20
	.eqv read_string,8
	.eqv print_int10,1
str:	.space 20

	.text
	.globl main
main: 	
	la $a0,str
	li $a1,20
	li $v0,8
	syscall
	li $t0,0		# i=0
	li $t1,0		#num=0
while:	la $t2,str		#load endereço array
	addu $t3,$t2,$t0	# str[i]
	lb $t4,0($t3) 		# $t4 = str[i]
	beq $t4,'\0',endw	#while(str[i]!='\0'			#{
if:	blt $t4,'0',endif	#if(str[i] >= '0')
	bgt $t4,'9',endif	#if(str[i] <= '9') 
	addi $t1,$t1,1		#num++
endif: 	addi $t0,$t0,1		#i++
	j while			#}
endw:   move $a0,$t1		#a0=num
	li $v0,1		#
	syscall			#print(num)
	jr $ra			#termina programa
	
