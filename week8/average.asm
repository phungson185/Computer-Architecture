.data
	prompt: .asciiz "\nEnter the value of score, -1 to stop: "
	output: .asciiz "\nThe average is: "
	OutputA: .asciiz "\nGrade is A"
	OutputB: .asciiz "\nGrade is B"
	OutputC:.asciiz "\nGrade is C"
	OutputD: .asciiz "\nGrade is D"
	OutputF: .asciiz "\nGrade is F"
.text
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	
	# sum
	li $t0, 0
	
	# index
	li $t1, 0
	start_loop: 
		sne $s1, $s0, -1
		beqz $s1, end_outer_loop
		add $t0, $t0, $s0
		addi $t1, $t1, 1
		la $a0, prompt
		jal PromptInt
		move $s0, $v0
		b start_loop
	end_outer_loop:
		divu $t0, $t1
		mflo $t2
		la $a0, output
		jal PrintString
		move $a1, $t2
		jal PrintInt
		move $s0, $t2
	grade_A:
		sge $t1, $s0, 90
		beqz $t1, grade_B
		la $a0, OutputA
		jal PrintString
		b end_if	
	grade_B:
		sge $t1, $s0, 80
		beqz $t1, grade_C
		la $a0, OutputB
		jal PrintString
		b end_if
	grade_C:
		sge $t1, $s0, 70
		beqz $t1, grade_D
		la $a0, OutputC
		jal PrintString
		b end_if
	grade_D:
		sge $t1, $s0, 60
		beqz $t1, else
		la $a0, OutputD
		jal PrintString
		b end_if
	else:	
		la $a0, OutputF
		jal PrintString
		b end_if
	end_if:	
		jal Exit

.include "utils.asm"
