# Exercise 4: Maximum (again)
# Build a program that:
# - Defines a list of 10 integers
# - Locates the maximum of them (using iteration).
numbers = [21,2,3,14,5,6,7,8,9,10]
cnt = 1
maximum = numbers[0]
while cnt < len(numbers):
    if numbers[cnt] > maximum:
        maximum = numbers[cnt]
    cnt += 1

print(maximum)

