# Exercise 8: Sorting numbers
# Construct a program which:
# - Will take as input a number that must be between 3 and 20, let be N.
# - It will read from the input N integers and assign them
# and store them in a list.
# - It will sort the list of numbers
# - It will print it
N = int(input("Give N: "))
while N<3 or N>20:
    N = int(input("Give N(3-20): "))

numbers = []
for cnt in range(0,N):
    numbers.append(int(input("Give " + str(cnt+1) + "th number: ")))

numbers.sort()

print(numbers)
