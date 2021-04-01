# Tinh V = nRT / P
# R = 8314/1000
.data 
	str0: .asciiz "\nTinh V = nRT / P"
	str1: .asciiz "\nNhap vao gia tri n: "
	str2: .asciiz "\nNhap vao gia tri P: "
	str3: .asciiz "\nNhap vao gia tri T: "
	str4: .asciiz "\nKet qua la: "
.text
.globl main
main:

	# Tinh V = nRT / P
	addi $v0, $zero, 4
	la $a0, str0
	syscall

	# Nhap vao gia tri n
	addi $v0, $zero, 4
	la $a0, str1
	syscall
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Nhap vao gia tri P
	addi $v0, $zero, 4
	la $a0, str2
	syscall
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	# Nhap vao gia tri T
	addi $v0, $zero, 4
	la $a0, str3
	syscall
	addi $v0, $zero, 5
	syscall
	move $s2, $v0
	
	# Tinh V = nRT / P
	
	li $s3, 8314
	li $s4, 1000
	divu $s5, $s3, $s4 
	mul $t0, $s5, $s0
	mul $t0, $t0, $s2
	divu $t0, $t0, $s1
	
	# In ra man hinh
	
	addi $v0, $zero, 4
	la $a0, str4
	syscall
	addi $v0, $zero, 1
	move $a0, $t0
	syscall

	# Thoat chuong trinh
	addi $v0, $zero, 10
	syscall
	
	
