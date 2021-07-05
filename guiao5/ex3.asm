# Mapa de registos
# k: $t0
#k*4: $t1
# lista + k:$t2
# houve_troca: $t4
# i: $t5
# lista: $t6
# lista + i: $t7
 	 .data
str1:	 .asciiz "Introduza numero:\n"
	 .align 2
	 .eqv FALSE,0
	 .eqv TRUE,1
 	 .eqv SIZE,10
 	 .eqv print_string,4
 	 .eqv read_int,5
 lista:  .space 40	 
 	 .text
 	 .globl main
 	
main: 	# código para leitura de valores
	li $t0,$0		#k=0
while:	bge $t0,SIZE,do		#while (k menor size)
	la $a0,str1  
	li $v0,4
	syscall			# print_string("Introduza numero")
	li $v0,5		#read_int
	la $t6,lista
	sll $t1,$t0,2		#k*4
	addu $t1,$t6,$t0	# &lista[i]
	sw $v0,0($t1)	 	#lista[k]=read_int
	addi $t0,$t0,1		#k++
	j while 		#
do: 				# do {
 	li $t4,FALSE		# houve_troca = FALSE;
 	li $t5,0 		# i = 0;
 	li $t1,SIZE
	sub $t1,$t1,1		#t1=SIZE
for: 	bge $t5,$t1,endfor 	# while(i < SIZE-1){
if: 	sll $t7,$t5,2		# $t7 = i * 4
 	addu $t7,$t7,$t6 	# $t7 = &lista[i]
 	lw $t8,0($t7) 		# $t8 = lista[i]
 	lw $t9,4($t8) 		# $t9 = lista[i+1]
 	ble $t8,$t9,endif 	# if(lista[i] > lista[i+1]){
 	sw $t8,4($t9) 		# lista[i+1] = $t8
 	sw $t9,0($t8) 		# lista[i] = $t9
	li $t4,TRUE 		#
 	j endif			# }
endif:  addi $t5,$t5,1		# i++;
	j for			# }
while: bne $t4,TRUE,do		# } while(houve_troca == TRUE);
 (...) 				# codigo de impressao do conteudo do array
 jr $ra 			# termina o programa 
