.data 
	str1: .asciiz "\nNhap vao gia tri x: "
	str2: .asciiz "\n Nhi phan: "
	str3: .asciiz "\nsll 4 bits: "
	str4: .asciiz "\nsllv 4 bits: "
	str5: .asciiz "\nsrl 4 bits: "
	str6: .asciiz "\nsrlv 4 bits: "
	str7: .asciiz "\nsra 4 bits: "
	str8: .asciiz "\nsrav 4 bits: "
	str9: .asciiz "\nsol 4 bits: "
	str10: .asciiz "\nsor 4 bits: "
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
	la $a0, str2
	syscall
	addi $v0, $zero, 35
	move $a0, $s0
	syscall
	
	# sll 4 bits
	addi $v0, $zero, 4
	la $a0, str3
	syscall
	addi $v0, $zero, 35
	sll $t1, $s0, 4
	move $a0, $t1
	syscall
	
	#sllv 4 bits
	addi $v0, $zero, 4
	la $a0, str4
	syscall
	li $s1, 4
	addi $v0, $zero, 35
	sllv $t1, $s0, $s1
	move $a0, $t1
	syscall
	
	# Nhi phan
	addi $v0, $zero, 4
	la $a0, str2
	syscall
	addi $v0, $zero, 35
	move $a0, $s0
	syscall
	
	#srl 4 bits
	addi $v0, $zero, 4
	la $a0, str5
	syscall
	addi $v0, $zero, 35
	srl $t1, $s0, 4
	move $a0, $t1
	syscall
	
	#srlv 4 bits
	addi $v0, $zero, 4
	la $a0, str6
	syscall
	li $s1, 4
	addi $v0, $zero, 35
	srlv $t1, $s0, $s1
	move $a0, $t1
	syscall
	
	# Nhi phan
	addi $v0, $zero, 4
	la $a0, str2
	syscall
	addi $v0, $zero, 35
	move $a0, $s0
	syscall
	
	#sra 4 bits
	addi $v0, $zero, 4
	la $a0, str7
	syscall
	addi $v0, $zero, 35
	sra $t1, $s0, 4
	move $a0, $t1
	syscall
	
	#srav 4 bits
	addi $v0, $zero, 4
	la $a0, str8
	syscall
	li $s1, 4
	addi $v0, $zero, 35
	srav $t1, $s0, $s1
	move $a0, $t1
	syscall
	
	# Nhi phan
	addi $v0, $zero, 4
	la $a0, str2
	syscall
	addi $v0, $zero, 35
	move $a0, $s0
	syscall
	
	#rol 4 bits
	addi $v0, $zero, 4
	la $a0, str9
	syscall
	addi $v0, $zero, 35
	rol  $t1, $s0, 4
	move $a0, $t1
	syscall
	
	#ror 4 bits
	addi $v0, $zero, 4
	la $a0, str10
	syscall
	addi $v0, $zero, 35
	ror $t1, $s0, 4
	move $a0, $t1
	syscall
	
	# Thoat chuong trinh
	addi $v0, $zero, 10
	syscall
	
	
