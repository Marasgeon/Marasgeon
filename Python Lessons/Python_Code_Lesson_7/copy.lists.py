# A example of a solution to the problem with copying lists
list1 = [1,2,3]
list2 = list1[:]
list2[0] = 4
print(list1)
print(list2)

# Copying Sequences:
# - Great care when we want to copy a sequence
# We need to be very careful when we want to copy a sequence to another sequence (list or tuple).
# - Either we will use slicing without boundaries:
# new_list = old_list[:]
# - Either we will use the copy() method
# new_list = old_list.copy()
# - Slicing is faster and we will prefer it.