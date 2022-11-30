#  Write a Python program to calculate the simple interest. Formula to calculate simple interest is SI = (PRT)/100

p = int(input("Enter principal amount: "))   # Input principal amount
r = float(input("Enter rate of interest: "))   # Input rate of interest
t = int(input("Enter the number of years: "))   # Input number of years
si = p*r*t/100
print("The simple interest is: ", si)
