numbers = [12, 75, 150, 180, 145, 525, 50]   # list of numbers
x = 0                                        # initialise x as 0
for i in numbers:                            # select each number from the array
    if i % 2 == 0:                           # check number is odd or even
        x = x+i                              # sum of even numbers
print("Sum of even numbers is: ", x)         # display the output
