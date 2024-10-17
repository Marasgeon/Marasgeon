# Example Nested Loops 1
# - The two repeat commands are just two more (more complicated)
# instructions.
# - So it is common to have a loop instruction inside a loop
# instruction.
# - often referred to as nested loops.
# The following program calculates the multiplication table
# of 1,2,...,..., 9
for i in range(1,10):
    for j in range(1,11):
        print(str(i) + "*" + str(j) + "=" + str(i*j))
    print("============")

# The inner loop runs for each value of i of the outer loop.

i=1: j=1
i=1: j=2
i=1: j=3
i=1: j=4
.....j=10
i=2: j=1
i=2: j=2
i=2: j=3