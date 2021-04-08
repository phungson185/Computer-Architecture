 .text
	li   $s1, 0x7fffffff
	li   $s2, 0x7fffffff
start:
	li   $t0, 0           # No overflow is set as default status
	addu $s3, $s1, $s2    # s3 = s1 + s2
	xor  $t1, $s1, $s2    # Check if $s1 and $s2 have the same sign?
	bltz $t1, EXIT        # If not, exit
	slt  $t2, $s3, $s1
	bltz $s1, NEGATIVE    # Check if $s1 and $s2 is negative?
	beq  $t2, $zero, EXIT # s1 and $s2 are positive
	                      # If $s3 > $s1 then the result doesnot
	                      # overflow
	j    OVERFLOW
NEGATIVE:
	bne  $t2, $zero, EXIT # s1 and $s2 are negative
	                      # If $s3 < $s1 then the result
	                      # does not overflow
OVERFLOW:
	li   $t0, 1           #The result overflows
EXIT:

# addu $s3, $s1, $s2 : cộng 2 số không dấu $s1 và $s2
# xor  $t1, $s1, $s2 : kiểm tra $s1 và $s2 có cùng dấu hay không. Nếu không thì thoát chương trình
# slt  $t2, $s3, $s1 : kiểm tra $s3 có nhỏ hơn $s1 hay không. Khi này $s3 = fffffffe < $s1 nên $t2 = 1
# bltz $s1, NEGATIVE : kiểm tra $s1 có nhỏ hơn 0 hay không. Nếu có thì nhảy đến NEGATIVE. $s1 = 0x7fffffff > 0
# beq  $t2, $zero, EXIT : kiểm tra $t2 có bằng 0 hay không. Nếu có thì thoát. $t2 = 1 != 0
# j OVERFLOW : nhảy đến OVERFLOW và gán $t0 bằng 1.

# Ở đây đã xảy ra hiện tượng tràn khi thực hiện cộng 7fffffff và 7fffffff 
 
# 0111|1111|1111|1111|1111|1111|1111|1111      
# 0111|1111|1111|1111|1111|1111|1111|1111      
# ---------------------------------------
# 1111|1111|1111|1111|1111|1111|1111|1110    
