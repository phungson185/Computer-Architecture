.data
output1: .asciiz "\nPlease input a : "
output2: .asciiz "\nPlease input b : "
output3: .asciiz "\nResult a: "
output4: .asciiz "\nResult b: "
output5: .asciiz "\nResult a xor b: "
output6: .asciiz "\nResult (a xor b) xor b: "
.text
.globl main
main:
  ori $v0,$zero,4
  la $a0,output1
  syscall

  ori $v0,$zero,5
  syscall
  move $s0,$v0

  ori $v0,$zero,4
  la $a0,output2
  syscall

  ori $v0,$zero,5
  syscall
  move $s1,$v0

  ori $v0,$zero,4
  la $a0,output3
  syscall

  ori $v0,$zero,34
  move $a0,$s0
  syscall

  ori $v0,$zero,4
  la $a0,output4
  syscall

  ori $v0,$zero,34
  move $a0,$s1
  syscall

  ori $v0,$zero,4
  la $a0,output5
  syscall

  xor $s2,$s0,$s1
  ori $v0,$zero,36
  move $a0,$s2
  syscall

  ori $v0,$zero,4
  la $a0,output6
  syscall

  xor $s2,$s2,$s1
  ori $v0,$zero,36
  move $a0,$s2
  syscall
