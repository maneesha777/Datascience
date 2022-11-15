a = int(input("Enter first number: "))       # Enter first number
b = int(input("Enter second number: "))      # Enter second number
c = int(input("Enter third number: "))       # Enter third number
if a > b and a > c:                          # Check whether first number is greater
    greatest = a
elif b > a and b > c:                        # Check whether second number is greater
    greatest = b
else:
    greatest = c


print( "The greatest number is ", greatest)
