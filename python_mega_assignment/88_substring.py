# Write a Python program to check if a substring is present in a given string.

s=input("Enter any string: ")
w=input("Enter the substring to check: ")
if w in  s:
    print("The substring ", w, "is present")
else:
    print("The substring ", w, "is not present")
