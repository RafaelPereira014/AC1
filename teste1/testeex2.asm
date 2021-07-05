#Mapa de Registos
# $t0: n_even; 
# $t1: n_odd 
#$t2:p1
#$t3:p2
#$t4: a+N
#$t5:*p1
#$t6:*p2


	.data
	.eqv N,35
	.eqv read_int,5
	.eqv print_int10,1
a: 	.space 140
b:	.space 140

	.text
	.globl main
	
main:
	li $t0,0		#n_even =0
	li $t1,0		#n_odd=0
	
for1:	la $t2,a		#p1=a
	la $t4,N		#la N
	sll $t4,$t4,2		#N*4
	addu $t4,$t4,$t2	#a+N
	bge $t2,$t4,for2	#
	li $a0,5		#read_int
	syscall
	lw $t5,0($v0)		#*p1=read_int
	addi $t2,$t2,1		#p1++
	j for1
	
for2: 	la $t2,a		#p1=a
	la $t3,b		#p2=b
	la $t2,a		#p1=a
	la $t4,N		#la N
	sll $t4,$t4,2		#N*4
	addu $t4,$t4,$t2	#a+N
	bge $t2,$t4,for3	#
	rem $t9,$t2,2		#p1%2
if:	beq $t9,0,else
	lw $t6,0($t3)		#*p2
	sw $t5,0($t6)		#*p2 =*p1
	addiu $t6,$t6,4		#p2++
	addi $t1,$t1,1		#n_odd++
	j for2
else:	addi $t0,$t0,1		#n_even++
	j for2
	
	
