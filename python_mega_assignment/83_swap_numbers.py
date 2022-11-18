# Write a Python program to swap two elements in a list.

def swap_numbers(list1, p1, p2):
    list1[p1], list1[p2] = list1[p2], list1[p1]
    return list1

print(swap_numbers([5, 90, 56, 45, 32, 2, 100], 5, 3))
