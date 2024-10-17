# Example Nested Loops 2
# The following program shows an interesting pattern!
for i in range(1,6):
    for j in range(1,i+1):
        print("*", end=" ")
    print("")

# Observation: Print is a polymorphic function. Here
# we see that if we put end=" " as its second argument,
# it does not do line change, but continues printing
# on the same line.

