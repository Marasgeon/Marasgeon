# Exercise 3: Sum of numbers (alternative)
# Repeat Exercise 2, except that the 10 numbers will
# are initially stored in a list.
numbers = [1,2,3,4,5,6,7,8,9,10]
cnt = 0
s = 0
while cnt < len(numbers):
    s += numbers[cnt]
    cnt += 1


print("sum=" + str(s))
