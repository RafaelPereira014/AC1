# Mapa de registos:
# $t0 – value
# $t1 – bit
# $t2 - i
	.data
str1: 	.asciiz "Introduza um numero: "
str2: 	.asciiz "\nO valor em binário é: "
 	.eqv print_string,4
 	.eqv read_int,5
 	.eqv print_char,11
 
 	.text
 	.globl main
main: 	la $a0,str1
 	li $v0,4 		# (instrução virtual)
 	syscall 		# print_string(Introduza um numero:);
 	li $v0,5 
 	syscall
 	or $t0,$v0,$0 		# value=read_int();
 	la $a0,str2 	
 	li $v0,4		# print_string("\nO valor em binário é:");
 	syscall
 	li $t2,0 		# i = 0
for: 	bge $t2,32,endfor 	# while(i < 32) {
 	andi $t1,$t0,0x80000000 # (instrução virtual)
 	beq $t1,$0,else 	# if(bit != 0)
 	li $a0,'1'
 	li $v0,11		# print_char('1');
 	syscall
 	j endif
else: 				# else
 	li $a0,'0'		
 	li $v0,11		# print_char('0');
 	syscall
endif: 	sll $t0,$t0,1		# value = value << 1;
 	addi $t2,$t2,1		# i++;
 	j for 			# }
endfor: 			#
 	jr $ra 			# fim do programa 
