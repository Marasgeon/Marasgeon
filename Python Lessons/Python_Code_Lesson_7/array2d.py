# 1 Example of 2d array (2d list)
# Construction of a 2D array from user input:
array = []
rows = int(input("Give number of rows: "))
cols = int(input("Give number of columns: "))

for i in range(rows):
    array.append([])
    for j in range(cols):
        elem = int(input("Give " + str(i) + "," + str(j) + " element: "))
        array[i].append(elem)


print(array)

# Note: We also used nested loops.