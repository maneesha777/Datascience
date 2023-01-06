# Write a Python program to remove i'th element from a string.

s=input("Enter any string: ")
i=int(input("Enter index of string to be removed: "))
print(s[:i]+s[i+1:])
