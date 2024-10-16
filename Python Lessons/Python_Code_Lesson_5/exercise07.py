# Exercise 7: Accessing specific items in a list
# Construct a program that creates a list of all even numbers
# from 0 to 1000, and then prints the list.
numbers = []

for number in range(0,1000+1,2): # How would you do odd numbers ?
    numbers.append(number)

print(numbers)