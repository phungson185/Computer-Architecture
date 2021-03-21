.data
    A   : .word  2, 6, -3, -9, 10, 13, 1, 0, -15, 5
    i	: .word 0
    n   : .word 10
    max : .word 0
.text
	la $s0, A          # tr? ??n ph?n t? hi?n t?i
  	lw $s1 i          # ch? s? m?ng i
  	lw $s2 max	   # giá tr? max
  	lw $s3 n	# kích th??c m?ng
loop:
add $t1,$s1,$s1		# nhân ?ôi i
add $t1,$t1,$t1		# nhân 4 l?n i
add $t1,$t1,$s0		# k?t h?p 2 thành ph?n ??a ch?
lw $t0,0($t1)
abs $t0,$t0
slt $at,$s2,$t0
bgtz $at, endif
add $s1, $s1, 1
beq $s1, $s3, endloop
j loop
endif:
	add $s2, $t0, $zero
	j loop
endloop:


