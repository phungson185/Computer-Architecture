.data 
	str1: .asciiz "\nNhap vao gia tri x: "
	str2: .asciiz "\nNhap vao gia tri y: "
	str3: .asciiz "\nx NAND y = "
	str4: .asciiz "\nNhi phan: "
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
	
	addi $v0, $zero, 4
	la $a0, str4
	syscall
	addi $v0, $zero, 35
	move $a0, $s0
	syscall
	
	# Nhap vao gia tri y
	
	addi $v0, $zero, 4
	la $a0, str2
	syscall
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	addi $v0, $zero, 4
	la $a0, str4
	syscall
	addi $v0, $zero, 35
	move $a0, $s1
	syscall
	
	# Tinh x NAND y
	and  $t0,$s0,$s1  
	not  $t0, $t0
	
	# In ra
	addi $v0, $zero, 4
	la $a0, str3
	syscall
	addi $v0, $zero, 35
	move $a0, $t0
	syscall 
	
	# Thoat chuong trinh
	addi $v0, $zero, 10
	syscall