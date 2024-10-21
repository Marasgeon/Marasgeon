# 2 Example of 2d array
# The program changes the value to
# an element and then traverses the table:
array = [[1,2,3], [4,5,6]]
array[0][1] = 0
for row in array:
    for elem in row:
        print(elem, end=" ")
    print("")

# Note: We also used nested loops.