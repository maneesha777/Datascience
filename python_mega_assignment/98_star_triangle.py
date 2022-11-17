''' Write a python program to print below pattern.

    * 
   * * 
  * * * 
 * * * * 
* * * * * 
'''
n = int(input("Enter no. of rows: "))        
for row in range(n):
    for i in range(n-row-1):
        print( end=' ')
    for i in range(row+1):
        print("*", end=' ')
    print()
