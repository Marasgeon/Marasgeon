# Exercise 3: First Number
# Construct a program which: - Define a non-negative integer N
# - It will check if it is prime and print the result
# Reminder: 0 and 1 are not prime and any natural >= 2
# is prime if it is (exactly) divisible only by itself and
# unit.
N = 27

if N == 0 or N == 1:
    print("It's not prime")
else:
    for i in range(2,N):
        if N % i == 0:
            print("It's not prime")
            break
    else:
        print("It's prime")
