''' Write a python program to print below pattern.

A 
B B 
C C C 
D D D D 
E E E E E 
'''
n=int(input("Enter number of rows: "))
for row in range (65,65+n):
    for j in range(65,row+1):
        print(chr(row),end=" ")
    print()
