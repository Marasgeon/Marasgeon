# Exercise 2: Tree (again)
# Rewrite the exercise to print the tree, using the * operator on strings:
# Reminder for N=5:
N = 5

for i in range(N):
    print("  " * (N-i-1), end="")
    print("* " * (2*i+1), end="")
    print("")