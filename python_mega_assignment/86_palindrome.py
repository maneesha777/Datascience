# Write a Python program to check if a string is palindrome or not.

s=input("Enter any string: ").lower()
text=""
for i in range(len(s)):
    if s[i].isalnum():
        text += s[i]
if text==text[::-1]:
    print("The string is a palindrome.")
else:
    print("The string is not a palindrome.")
