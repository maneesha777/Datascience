''' Write a Python program to convert a list of tuples into dictionary.

Input : [('Sachin', 10), ('MSD', 7), ('Kohli', 18), ('Rohit', 45)]
Output : {'Sachin': 10, 'MSD': 7, 'Kohli': 18, 'Rohit': 45}
'''
input1 = [('Sachin', 10), ('MSD', 7), ('Kohli', 18), ('Rohit', 45)]
d1=dict(input1)
print("Output via method-1 is:",d1)

# method 2
output1 = {}
for (key, value) in input1:
    output1.setdefault(key, value)
print("Output via method-2 is:",output1)
