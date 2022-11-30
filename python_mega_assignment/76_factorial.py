# Write a Python program to find the factorial of a given number.

num = int(input("Enter any number: "))   # Input any number
fact = 1
temp = num
if (temp==0):
    print("The factorial of ", num, " is ", fact)
else:
    while temp>=1:
        fact *= temp
        temp -= 1
    print("The factorial of ", num, " is ", fact)
