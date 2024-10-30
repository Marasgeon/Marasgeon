#   Case 1: A simple for..in
# my_set = {number for number in range(3)}
# - Returns the set: 0,1,2
# - Case 2: A simple for..in with if
# my_set = {number for number in range(10) if number%2 == 0}
# - Returns the set: 0,2,4,6,8
# - Case 3: A simple for..in with if..else
# my_set = {number if number%2 == 0 else number/2 for number in range(10)}
# - Returns the set: 0, 0.5, 2, 1.5, 4, 2.5, 6, 3.5, 8, 4.5

my_set = {number for number in range(3)}
print(my_set)

my_set = {number for number in range(10) if number%2 == 0}
print(my_set)

my_set = {number if number%2 == 0 else number/2
           for number in range(10)}
print(my_set)

# Observation:
# - The above (1-3) is exactly the same as what we saw in
# lists. They simply use {, } instead of [, ].
# - While 4 can also be used for lists.