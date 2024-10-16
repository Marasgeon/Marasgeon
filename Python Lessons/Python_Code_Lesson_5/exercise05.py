# Exercise 5: Play with the range
# Construct a program which:
# - Print all even numbers from 10 to 20
# - Will print all odd numbers from 19 to 11
# (in descending order)
# - Will print those odd numbers from 1 to
# 29 that are also multiples of 3.
for number in range(10,20+1,2):
    print(number)

print("===========")

for number in range(19,11-1,-2):
    print(number)

print("===========")

for number in range(1,29+1,2):
    if number % 3 == 0:
        print(number)