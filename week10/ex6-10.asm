.data 	
	Prompt: .asciiz "\nEnter a number: "
	less: .asciiz "\nValue is less than random number"
	greater: .asciiz "\nValue is greater than random number"
	lucky: .asciiz "\nCongratulation"
.text
main:
	# read an input value from the user
	la $a0, Prompt
	jal PromptInt
	move $s0, $v0

	li $a1, 100  #Here you set $a1 to the max bound.
    	li $v0, 42  #generates the random number.
    	syscall
    	
        li $v0, 1   #1 print integer
        syscall
    	blt $s0, $a0, min
    	blt $a0, $s0, max
    	beq $s0, $a0, equal
    	
min:
	la $a0, less
	jal PrintString
	j main
max: 
	la $a0, greater
	jal PrintString
	j main
equal:
	la $a0, lucky
	jal PrintString
	jal Exit
.include "utils.asm"
