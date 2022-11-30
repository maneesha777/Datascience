# Write a Python program to interchange the first and last element in a list.

nlist = input("Enter numbers of list seperated by space: ").split()
temp = nlist[0] 
nlist[0]=nlist[-1]
nlist[-1]=temp
print(nlist)
