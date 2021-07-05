#Mapa de Registos
#
#
#
#

	.data
	.eqv read_double,7
d1:	.double 5.0
d2:	.double 9.0
d3	.double 32.0
	.text
	.globl f2c
		
f2c:	li $v0,7			#read double
	syscall
	move $t0,$v0			#ft=readdouble()
	mtc1.d $t0,$f0		#copressador ft


	la $t1,d1			#
	l.d $f1,0($t1)		#5.0
	la $t2,d2			#
	l.d $f2,0($t2)		#9.0
	la $t3,d3
	l.d $f3,0($t3)		#32.0
	sub.d $f12,$f0,$f3		#ft-32
	mul.d $f12,$f12,$f1	#5*(ft-32.0)
	div.d $f12,$f12,$f2	#return (5*(ft-32.0)) / 9.0
	
	
	
	