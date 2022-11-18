# Write a Python program to find N largest element from a list.

def largest_elements(list1, n):
    l1=[]
    for i in range(len(list1)):
        max1=0
        for j in range(len(list1)):
            if list1[j]>max1:
                max1=list1[j]
            
        list1.remove(max1)   
        l1.append(max1)
    return(l1[:n])


print(largest_elements([0, 78, 22, 1, 900, 12, 141, 5],4))
