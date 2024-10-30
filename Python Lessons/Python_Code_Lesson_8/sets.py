# Example 1: sets.py
# In the example we see the definition of 4 sets:
int_set = {1, 2, 3}
collection = {"hi", 3.14, True}
empty_set = set()
duplicates = {1, 2, 3, 1, 1, 2}

print(duplicates)
print(type(int_set))

# Comments:
# - Each element must exist exactly once in the
# set, so any duplicates are ignored
# - There is a peculiarity with the empty set. It does not work.
# obvious {} (since this is bound to the definition of the
# empty "dictionary" as we will see in the next lesson)
# - We expect the order of the elements to be random.