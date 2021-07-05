	.data
	.text
	.globl average
	
average:
	mtc1 $0,$f0
	cvt.d.w $f0,$f0	# sum = 0.0
	
	move $t0,$a0	# $t0 = &(array)
	move $t1,$a1	# i = n
	
for:	ble $t1,0,endfor	# while(i > 0)
	addi $t3,$t1,-1		# $t3 = i-1
	sll $t3,$t3,3		# $t3 = (i-1)*8
	addu $t2,$t0,$t3	# $t2 = &(array[i-1])
	l.d $f2,0($t2)		# $f2 = (double)array[i-1]
	add.d $f0,$f0,$f2	# sum += array[i-1]
	addiu $t1,$t1,-1	# i--
	
	j for
	
endfor:	mtc1 $a1,$f4
	cvt.d.w $f4,$f4		# (double)n
	div.d $f0,$f0,$f4	# return (sum / (double)n)
	
	jr $ra