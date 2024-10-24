# Exercise 1: Subset construction
# Construct a program which
# - Initialize a variable N with the value 5.
# - It will construct the set A={{1,2,...,N}
# - Then for each element of the set, it will construct a
# tuple with its number and its square
# - All these elements should belong to a set.
# The answer should be (the tuples not necessarily with this in that order):
# {(1,1), (2,4), (3,9), (4,16), (5,25)}
N = 5

A = set()
for i in range(1,N+1):
    A.add(i)

print(A)

result = set()
for element in A:
    result.add((element, element**2))

print(result)