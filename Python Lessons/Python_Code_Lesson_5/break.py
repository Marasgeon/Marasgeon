# Example break
# The program searches for a specific item in a list
# (serial search). It stops when the item is found.
numbers = [1, 8, 7, 4, 11, 12, 2, 9, 2, 5]
search = 2
for number in numbers:
    if search == number:
        print("Found it!")
        break

# if search in numbers:
#    print("Found it!")

# Break
# - If during the execution of a loop we decide that we want to interrupt its execution
# (i.e. not to execute the next steps of the loop), we use the break command:
# - Common syntax (e.g., in for, but also applies to while):