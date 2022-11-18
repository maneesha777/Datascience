''' Write a Python program to create a list of tuples from given list having number and its cube in each tuple.

Input: list = [9, 5, 6]
Output: [(9, 729), (5, 125), (6, 216)]

'''
input1 = [9, 5, 6]
output1=[]
for i in input1:
    t1= (i, i**3)
    output1.append(t1)       
print(output1)
