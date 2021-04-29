.text
main:
	# read an input value from the user
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	# move to $t0 to print binary
	move $t0, $s0
	jal PrintBinary
	
	la $a0, prompt
	jal PromptInt
	move $s1, $v0
	# move to $t0 to print binary
	move $t0, $s1
	jal PrintBinary
	
	# Cal NorSubprogram
	jal NorSubprogram
	jal PrintInt
	# move to $t0 to print binary
	move $t0, $s2
	jal PrintBinary
	
	# Cal NAND
	jal NAND
	jal PrintInt
	# move to $t0 to print binary
	move $t0, $s2
	jal PrintBinary
	
	# Cal NOT
	jal NOT
	jal PrintInt
	# move to $t0 to print binary
	move $t0, $s2
	jal PrintBinary
	
	# Mult4
	jal Mult4
	jal PrintInt
	
	# Mult10
	jal Mult10
	jal PrintInt
	
	# RightCircularShift
	jal RightCircularShift
	jal PrintInt
	# move to $t0 to print binary
	move $t0, $s2
	jal PrintBinary
	
	# LeftCircularShift
	jal LeftCircularShift
	jal PrintInt
	# move to $t0 to print binary
	move $t0, $s2
	jal PrintBinary
	
	# Toupper
	jal ToUpper
	
	# Tolower
	jal ToLower
	
	# Swap
	jal Swap
	move $a1, $s0
	jal PrintInt
	move $a1, $s1
	jal PrintInt
	
	# call the Exit subprogram to exit
	jal Exit
.data
	prompt: .asciiz "\nPlease enter an integer: "
	
.include "utils.asm"
