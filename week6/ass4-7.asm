.data 
	str1: .asciiz "\nNhap vao mot so nguyen duong: "
.text
.globl main
main:
	li $t0, 10

	# Nhap vao so nguyen duong
	addi $v0, $zero, 4
	la $a0, str1
	syscall
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Nhan so do voi 10
	mul $t2, $s0, 10
	
	# Dich trai 1 bit
	sll $s1, $s0, 1
	
	# Dich trai 2 bit
	sll $s2, $s0, 3
	
	# Cong 2 so thu duoc
	add $s3, $s1, $s2
	
	
	