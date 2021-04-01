.data 
	str0: .asciiz "\nTinh gia tri bieu thuc x^3+2x^2+3x+4"
	str1: .asciiz "\nNhap vao gia tri x: "
	str2: .asciiz "\nKet qua la: "
.text
.globl main
main:
	# Tinh gia tri bieu thuc x^3+2x^2+3x+4
	addi $v0, $zero, 4
	la $a0, str0
	syscall

	# Nhap vao gia tri x
	addi $v0, $zero, 4
	la $a0, str1
	syscall
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Tinh gia tri bieu thuc x^3+2x^2 +3x+4
	
	mul $t0, $s0, $s0
	mul $t1, $t0, 2
	mul $t0, $t0, $s0
	mul $t2, $s0, 3
	add $t0, $t0, $t1
	add $t0, $t0, $t2
	addi $t0, $t0, 4
	
	# In ra man hinh
	
	addi $v0, $zero, 4
	la $a0, str2
	syscall
	addi $v0, $zero, 1
	move $a0, $t0
	syscall

	# Thoat chuong trinh
	addi $v0, $zero, 10
	syscall