# Mapa de registos:
# $t0 – soma
# $t1 – value
# $t2 - i

 	.data
str1: 	.asciiz "Introduza um numero: "
str2: 	.asciiz "Valor Ignorado \n"
str3: 	.asciiz "A soma dos positivos é: "
 	.eqv print_string,4
 	.eqv read_int,1
 	.eqv print_int10,1 
  	.text
 	.globl main
 	
main: 	li $t0,0 		# soma = 0;
 	li $t2,0 		# i = 0;
 	la $a0,str1
 	
for: 	bge $t2,5,endfor 	# while(i < 5) {
 	ori $v0,$0,print_string # print_string("...");
 	syscall 		
 	ori $v0,$0,read_int	
 	syscall			# value=read_int();
 	or $t1,$0,$v0         
 	ble $t1,$0,else 	# if(value > 0)
 	add $t0,$t0,$t1 	# soma += value;
 	j endif			#
 	
else: 	la $a0,str2		# else
 	ori $v0,$0,print_string	# print_string("...");
 	syscall
 	
endif: addi $t2,$t2,1 		# i++;
 	j for 			# }
endfor: la,$a0,str3
  	ori $v0,$0,print_string	# print_string("...");
  	syscall
  	or $a0,$t0,$0
  	ori $v0,$0,print_int10	# print_int10(soma);
 	jr $ra 
