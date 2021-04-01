# Tinh gia tri bieu thuc 5x + 3y + z

.data 
	str0: .asciiz "\nTinh gia tri bieu thuc 5x + 3y + z"
	str1: .asciiz "\nNhap vao gia tri x: "
	str2: .asciiz "\nNhap vao gia tri y: "
	str3: .asciiz "\nNhap vao gia tri z: "
	str4: .asciiz "\nKet qua la: "
.text
.globl main
main:

	# Nhap vao gia tri x
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
	
	# Nhap vao gia tri y
	addi $v0, $zero, 4
	la $a0, str2
	syscall
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	# Nhap vao gia tri z
	addi $v0, $zero, 4
	la $a0, str3
	syscall
	addi $v0, $zero, 5
	syscall
	move $s2, $v0
	
	# Tinh gia tri bieu thuc 5x + 3y + z
	
	mul $t0, $s0, 5
	mul $t1, $s1, 3
	add $t0, $t0, $t1
	add $t0, $t0, $s2
	
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
	
	