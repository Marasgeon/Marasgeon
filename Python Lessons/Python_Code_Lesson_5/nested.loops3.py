# Example Nested Loops 3
# The following program shows a variant of the previous scheme!
N = 5
for i in range(0, N):
    for j in range(0, N-i-1):
        print(" ", end="")
    for j in range(0, i+1):
        print("*", end="")
    print("")

# # Observation: Print is a polymorphic function. Here
# # we see that if we put end="" as its second argument,
# # it does not do line change, but continues printing
# # on the same line.