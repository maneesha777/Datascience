'''Write a Python program to sort a list of tuples by second item.

Input : [('for', 24), ('Geeks', 8), ('Geeks', 30)] 
Output : [('Geeks', 8), ('for', 24), ('Geeks', 30)]

'''
input1 = [('for', 24), ('Geeks', 8), ('Geeks', 30)]
#for i in range(len(input)):
input1[0], input1[1]=input1[1], input1[0]
print(input1)
