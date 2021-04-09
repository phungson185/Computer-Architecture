# Print new line
.text 
PrintNewLine: 
	li $v0, 4
	la $a0, _PNL_newline
	syscall
	jr $ra
.data
	_PNL_newline: .asciiz "\n"
	
	
# Print tab
.text
PrintTab:
	li $v0, 4
	la $a0, tab
	syscall
	jr $ra
.data
	tab: .asciiz "\t"


# Print string
.text
PrintString:
	addi $v0, $zero, 4
	syscall 
	jr $ra
			
			
# Print integer
.text
PrintInt:
	# Print string. The string address is already in $a0
	li $v0, 4
	syscall
	
	# Print integer. The integer value is in $a1, and must
	# be first moved to $a0.
	move $a0, $a1
	li $v0, 1
	syscall
	
	# Print a new line character
	# jal PrintNewLine
	
	#return 
	jr $ra
	
	
# Prompt int
PromptInt:
	# Print the prompt, which is already in $a0
	li $v0, 4
	syscall
	# Read the integer value, Note that at the end of the
	# syscall the value is already in $v0, so there is no
	# need to move it anywhere.
	
	li $v0, 5
	syscall
	
	#return 
	jr $ra
	
	
# Exit
.text
Exit: 
	li $v0, 10
	syscall
