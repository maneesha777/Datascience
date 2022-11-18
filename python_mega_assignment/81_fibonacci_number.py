# Write a Python program to find the n-th Fibonacci Number.

num = int(input("Enter the idex of fibonacci number required: "))   
n1=0
n2=1
if num==0:
    print(num,"th fibonacci number is", n1)
elif num==1:
    print(num,"th fibonacci number is", n2)
else:
    for i in range(1, num):
        sum=n1+n2
        n1=n2
        n2=sum
    print(num,"th fibonacci number is", sum)
