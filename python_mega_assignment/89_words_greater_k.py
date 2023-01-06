# Write a Python program to find words which are greater than given length k.

list1=input("Enter list of words seperated by space: ").split()
k=int(input("Enter length of words: "))
for i in list1:
    if len(i)>k:
        print(i)
