# Write a Python program to find cumulative sum of a list.


num_list = input("Enter numbers of list seperated by space: ").split()  # Input any number
sum=0
for i in num_list:
    n=int(i)
    sum+=n
print(sum)
