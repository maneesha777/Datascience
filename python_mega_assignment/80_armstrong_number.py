# Write a Python program to check Armstrong Number.

num = int(input("Enter any number: "))   # Input any number
sum = 0        
temp = num
while temp>0:
    n1 = temp % 10
    sum += n1**3
    temp //= 10
if sum == num:
    print(num,"is a armstrong number.") 
else:
    print(num,"is not a armstrong number.") 
