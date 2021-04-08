addiu $t0, $zero, 60000 
ori $t0, $zero, 60000 

#Kết quả :
# Lệnh addiu $t0, $zero, 60000 là lệnh giả được phân tích thành 3 lệnh
#    lui $1, 0x00000000
#    ori $1, $1, 0x0000ea60
#    add $8, $0, $1
# 2 lệnh cho kết quả giống nhau
# 2 lệnh tốc độ chạy gần như nhau vì thuộc khuôn lệnh kiểu I