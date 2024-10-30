# Case 4: Nested Loops
# - Instead of writing :
# my_set = set()
# for i in range(2):
# 	for j in range(3):
# 		my_set.add((i,j))
# - we can write (on one line) the following:
# my_set = {(i, j) for i in range(2) for j in range(3)}
my_set = set()

for i in range(2):
    for j in range(3):
        my_set.add((i,j))
print(my_set)

my_set = {(i, j) for i in range(2)
                 for j in range(3)}
print(my_set)