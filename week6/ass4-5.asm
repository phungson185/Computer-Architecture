.data 
	str1: .asciiz "\nNhap vao gia tri x: "
	str2: .asciiz "\nSo bu 2 cua x: "
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
	
	#Tinh bu 2
	xori $s0, $s0, 0xFFFFFFFF
	addi $s0, $s0, 1
	
	addi $v0, $zero, 4
	la $a0, str2
	syscall
	addi $v0, $zero, 1
	move $a0, $s0
	syscall
	
	