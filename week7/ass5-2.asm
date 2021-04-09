.text
main:
	# read an input value from the user
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	
	# print the value back to the user
	la $a0, result
	move $a1, $s0
	jal PrintInt
	jal PrintNewLine
	jal PrintTab
	# call the Exit subprogram to exit
	jal Exit
.data
	prompt: .asciiz "Please enter an integer: "
	result: .asciiz "\nYou entered: "
	
.include "utils.asm"
