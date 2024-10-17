# Example for 2
# With the tools we have already learned, we can now
# write quite complex and useful programs:
semester_grades = [4, 6, 3, 8, 10]

passed = 0
sum_grades = 0
for grade in semester_grades:
    if grade >= 5:
        passed += 1
        sum_grades += grade

print("I've succeeded in " + str(passed) + " lessons")
print("My average is " + str(sum_grades/passed))
# Terminology:
# - Because the variable passed counts the number of some
# things, it is referred to as a counter.
# - The variable sum_grades adds up some things,
# it is referred to as an accumulator.