# A example of a problem with copying lists
list1 = [1,2,3]
list2 = list1
list2[0] = 4
print(list1) #  [1, 2, 3]
print(list2) #  [4, 2, 3]

# Notes:
# - The name of the list and tuple is a reference and not an ordinary variable.
# - References present such problems in copying.
# - We'll understand this fully in a later lesson.
