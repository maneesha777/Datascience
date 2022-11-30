# Write a code to take the age of person as an input and if age >= 18 display "I can vote". If age is < 18 display "I can't vote".

age = int(input("Enter your age: "))   # Input your age
if age >= 18:                          # Check whether your age is greater than or equal to 18
    print( "I can vote.")
else:
    print("I can't vote.")
