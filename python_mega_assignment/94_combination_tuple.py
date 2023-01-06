'''Write a Python program to get all combinations of 2 tuples.

Input : test_tuple1 = (7, 2), test_tuple2 = (7, 8)
Output : [(7, 7), (7, 8), (2, 7), (2, 8), (7, 7), (7, 2), (8, 7), (8, 2)]
'''
test_tuple1 = (7, 2)
test_tuple2 = (7, 8)
output=[]
for i in test_tuple1:
    for j in test_tuple2:
        t1= (i, j)
        output.append(t1)
for i in test_tuple2:
    for j in test_tuple1:
        t1= (i, j)
        output.append(t1)
print("All pair of combinations are: ", output)

