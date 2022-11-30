''' Write a python program to print below pattern.
1 
1 2 
1 2 3 
1 2 3 4 
1 2 3 4 5 '''

n = int(input("Enter no. of rows: "))        
for row in range(n):
    for i in range(1, row + 2):
        print(i, end=' ')
    print()
