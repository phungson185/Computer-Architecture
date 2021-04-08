.data 
	str1: .asciiz "\nNhap vao gia tri x: "
	str2: .asciiz "\nNot x: "
	str3: .asciiz "\nNhi phan: "
.text
.globl main
main:

	# Nhap vao gia tri x
	addi $v0, $zero, 4
	la $a0, str1
	syscall
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Nhi phan
	addi $v0, $zero, 4
	la $a0, str3
	syscall
	addi $v0, $zero, 35
	move $a0, $s0
	syscall
	
	# Tinh not x
	
	xori $s0, $s0, 0xFFFFFFFF
	
	# In ra 
	addi $v0, $zero, 4
	la $a0, str2
	syscall
	addi $v0, $zero, 35
	move $a0, $s0
	syscall
	
	
