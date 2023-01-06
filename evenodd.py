# Write a code to take a number as an input from the user and check if the number is odd or even.

num = int(input("Enter any number: "))   # Input any number
if num %2 == 0:                          # Check the number is even or odd
    print(num, "is even number.")
else:
    print(num, "is odd number.")
