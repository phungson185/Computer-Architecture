.text
NorSubprogram:
	# Value is stored in $s0, $s1
	nor $s2, $s0, $s1
	li $v0, 4
	la $a0, NorResult
	syscall
	
	#move $a1 to print int
	move $a1, $s2
	jr $ra
.data	
	NorResult: .asciiz "\nNorResult: "

.text
NAND:
	# Value is stored in $s0, $s1
	and $s2, $s0, $s1
	not $s2, $s2
	li $v0, 4
	la $a0, NANDResult
	syscall
	
	#move $a1 to print int
	move $a1, $s2
	jr $ra
.data
	NANDResult: .asciiz "\nNAND: "
	
.text
NOT:
	# Value is stored in $s0
	not $s2, $s0
	li $v0, 4
	la $a0, NOTResult
	syscall

	#move $a1 to print int
	move $a1, $s2
	jr $ra
.data
	NOTResult: .asciiz "\nNOT: "

.text
Mult4: 
	# Value is stored in $s0
	sll $s2, $s0, 2
	li $v0, 4
	la $a0, Mult4Result
	syscall

	#move $a1 to print int
	move $a1, $s2
	jr $ra
.data
	Mult4Result: .asciiz "\nMult4: "
	
.text
Mult10: 
	# Value is stored in $s0
	sll $s2, $s0, 1
	sll $s3, $s0, 3
	add $s2, $s2, $s3 
	li $v0, 4
	la $a0, Mult10Result
	syscall

	#move $a1 to print int
	move $a1, $s2
	jr $ra
.data
	Mult10Result: .asciiz "\nMult10: "
	
.text
Swap:
	xor $s0, $s0, $s1
	xor $s1, $s0, $s1
	xor $s0, $s0, $s1
	li $v0, 4
	la $a0, SwapResult
	syscall
	jr $ra
.data
	SwapResult: .asciiz "\nSwap: "
	
.text
RightCircularShift: 
	ror $s2, $s0, 1
	li $v0, 4
	la $a0, RightCircularShiftResult
	syscall
	
	#move $a1 to print int
	move $a1, $s2
	jr $ra
.data
	RightCircularShiftResult: .asciiz "\nRightCircularShift: "
	
.text
LeftCircularShift: 
	rol $s2, $s0, 1
	li $v0, 4
	la $a0, LeftCircularShiftResult
	syscall
	
	#move $a1 to print int
	move $a1, $s2
	jr $ra
.data
	LeftCircularShiftResult: .asciiz "\nLeftCircularShift: "

.text
ToUpper:
    li $v0, 4
    la $a0, StringToUpper
    syscall
    li $v0, 8
    li $a1, 20
    la $a0, input
    syscall

    li $v0, 4
    li $t0, 0

loop:
    lb $t1, input($t0)
    beq $t1, 0, exit
    blt $t1, 'a', case
    bgt $t1, 'z', case
    sub $t1, $t1, 32
    sb $t1, input($t0)

case: 
    addi $t0, $t0, 1
    j loop

exit:
    li $v0, 4
    la $a0, input
    syscall
    jr $ra
	
.data
	input: .space 20
	StringToUpper: .asciiz "\nString to upper: "
	
.text
ToLower:
    li $v0, 4
    la $a0, StringToLower
    syscall
    li $v0, 8
    li $a1, 20
    la $a0, inputToLower
    syscall

    li $v0, 4
    li $t0, 0

loopToLower:
    lb $t1, inputToLower($t0)
    beq $t1, 0, exitToLower
    blt $t1, 'A', caseToLower
    bgt $t1, 'Z', caseToLower
    add $t1, $t1, 32
    sb $t1, inputToLower($t0)

caseToLower: 
    addi $t0, $t0, 1
    j loopToLower

exitToLower:
    li $v0, 4
    la $a0, inputToLower
    syscall
    jr $ra
	
.data
	inputToLower: .space 20
	StringToLower: .asciiz "\nString to lower: "
	

.text
PrintBinary:
	li $v0, 4
	la $a0, Binary
	syscall
	
	# The value in $at
	li $v0, 35
	move $a0, $t0
	syscall
	jr $ra
.data
	Binary: .asciiz "\nBinary: "

.text 
PrintNewLine: 
	li $v0, 4
	la $a0, _PNL_newline
	syscall
	jr $ra
.data
	_PNL_newline: .asciiz "\n"
	
	
.text
PrintTab:
	li $v0, 4
	la $a0, tab
	syscall
	jr $ra
.data
	tab: .asciiz "\t"


.text
PrintString:
	addi $v0, $zero, 4
	syscall 
	jr $ra
			
			
.text
PrintInt:
	# Print integer. The integer value is in $a1, and must
	# be first moved to $a0.
	move $a0, $a1
	li $v0, 1
	syscall
	
	# Print a new line character
	# jal PrintNewLine
	
	#return 
	jr $ra
	
.text
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
	
	
.text
Exit: 
	li $v0, 10
	syscall
