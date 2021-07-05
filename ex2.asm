# Mapa de registos:
# $t0 – value
# $t1 – bit
# $t2 - i

 	.data
str1: 	.asciiz "Introduza um numero: "
str2: 	.asciiz "\n O Valor em binário é"
 	.eqv print_string,4
 	.eqv read_int,5
 	.eqv print_char,11
 
 
  	.text
 	.globl main
main: 	la $a0,str1
 	li $v0,4			# (instrução virtual)
	la $a0,str1 			# print_string(str1);
	syscall	
	ori $v0,$0,5 			# value=read_int();
 	syscall	
 	la $a0, str2			
 	li $v0, print_string		# print_string("str2");
 	syscall
 	li $t2,0			# i = 0
for: 	bge $t2,32,endfor 		# while(i < 32) {
	andi $t1,$t0,0x80000000 	# (instrução virtual)
 	bne $t1,$0,else 		# if(bit != 0)
	ori $v0,$0,11 			# print_char('1');
	ori $a0, $0, 0x31
	syscall
else: 					# else
 	ori $v0,$0,11 			# print_char('0');
 	ori $a0, $0, 0x31
 	syscall
	sll $t0,$t0,1			# value = value << 1;
 	addi $t2,$t2,1			# i++;
 	j for 				# }
endfor: 				#
 	jr $ra 				# fim do programa 
