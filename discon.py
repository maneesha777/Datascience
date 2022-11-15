numbers = [12, 75, 150, 180, 145, 525, 50]
num=[]
for i in numbers:
    if i > 150:
        if i > 500:
            break
        continue
    if i <= 150:
        if i % 5 ==0:
            num.append(i)


print(num)
