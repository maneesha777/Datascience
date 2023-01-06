# Write a Python program to extract unique dictionary values.

dict1 = {'A' : [10, 11, 2],
             'B' : [4, 6, 8, 10],
             'C' : [9, 10, 23, 11, 2],
             'D' : [10, 3, 4]}
x = []
for values in dict1.values():
    x.extend(values)
print(set(x))
x.sort()
print("The unique value list is: ", list(x))
