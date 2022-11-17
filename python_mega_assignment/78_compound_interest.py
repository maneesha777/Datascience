# Write a Python program to calculate the compound interest. Formula of compound interest is A = P(1+ R/100)^t.

p = int(input("Enter principal amount: "))   # Input principal amount
r = float(input("Enter rate of interest: "))   # Input rate of interest
t = int(input("Enter the number of years: "))   # Input number of years
ci = p*(1+r/100)**t
print("The compound interest is: ", ci)
