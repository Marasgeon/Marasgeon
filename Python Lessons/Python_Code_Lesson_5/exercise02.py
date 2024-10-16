# Exercise 2: Sum of numbers
# Build a program which:
# - Read from the input 10 numbers
# - It will add them up and print their sum.
# Note: Slightly advanced exercise.
cnt = 1
s = 0
while cnt <= 10:
    user_input = int(input("Give " + str(cnt) + "th number: "))
    cnt += 1
    s += user_input

print("sum=" + str(s))
