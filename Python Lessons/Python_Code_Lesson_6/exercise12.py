# Exercise 12: Isosceles Triangle
# Construct a program which:
# - Will store the number of rows in a variable with
# The program will store the number of lines in a variable named N.
# - It will print an isosceles triangle with N lines.
# - For example, for N=5:
N = 5
for i in range(0, N):
    for j in range(0, N-i-1):
        print(" ", end=" ")
    for j in range(0, 2*i+1):
        print("*", end=" ")
    print("")
