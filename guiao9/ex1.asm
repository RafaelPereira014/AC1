#Mapa de Registos
#val:$t0
#res:$t1
#
#


	.data
	.eqv print_float,2
	.eqv read_int,5
f1:	.float 2.59375
	.text
	.globl main
		
main: 	
do:	li $v0,5
	syscall			#read_int
	move $t0,$v0		#val=readint()
	la $t2,f1		#load 2.59375
	mtc1 $t2,$f0		#float 2.59375
	mtc1 $t0,$f1		#(coprocessador val)
	cvt.w.s $f1,$f1		#(float val)	
	mul.s $f12,$f1,$f0	# val * 2.59375
	li $v0,2		#print(res)
	syscall
while:	mtc1 $0, $f3		#0.0
	c.eq.s $f12,$f3		#x=res==0.0
	bc1f do			#se x=false
	li $v0,0		#return 0
 
