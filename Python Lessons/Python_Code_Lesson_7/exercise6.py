# Exercise 6:
# Construct a list representing a 3x4 table
# (with elements of your choice) and then:
# - Add a row of zeros at the beginning
# - Prints the 4x4 table
# - Adds a column of zeros at the end
# - prints the 4x5 table
array = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 0, 1, 2]
]

array.insert(0, [0, 0, 0, 0])

for row in array:
    for elem in row:
        print(elem, end=" ")
    print("")

for row in array:
    row.append(1)

print("")
for row in array:
    for elem in row:
        print(elem, end=" ")
    print("")
