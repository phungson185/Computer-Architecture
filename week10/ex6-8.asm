.data 	
	Prompt: .asciiz "Enter a number: "
	dot: .asciiz ", "
.text
main:
	# read an input value from the user
	la $a0, Prompt
	jal PromptInt
	move $s0, $v0
	li $s1, 2
loopPrompt:
	blt $s0, $s1, exitLoop
	move $a0, $s1
	jal  is_prime				
	bgtz $v0, prime
	addi $s1, $s1, 1
	j loopPrompt
prime:
	move $a1, $s1
	jal PrintInt
	la $a0, dot
	jal PrintString
	addi $s1, $s1, 1
	j loopPrompt
## Tells if a number is prime
# $a0	The number to check if it's prime
# $v0	1 if the number is prime, 0 if it's not
is_prime:
	addi	$t0, $zero, 2				# int x = 2
	
is_prime_test:
	slt	$t1, $t0, $a0				# if (x > num)
	bne	$t1, $zero, is_prime_loop		
	addi	$v0, $zero, 1				# It's prime!
	jr	$ra						# return 1

is_prime_loop:						# else
	div	$a0, $t0					
	mfhi	$t3						# c = (num % x)
	slti	$t4, $t3, 1				
	beq	$t4, $zero, is_prime_loop_continue	# if (c == 0)
	add	$v0, $zero, $zero				# its not a prime
	jr	$ra							# return 0

is_prime_loop_continue:		
	addi $t0, $t0, 1				# x++
	j	is_prime_test				# continue the loop
exitLoop:
	jal Exit
.include "utils.asm"
