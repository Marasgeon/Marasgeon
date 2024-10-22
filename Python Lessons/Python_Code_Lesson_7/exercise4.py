# Exercise 4: Prime numbers
# Build a program which:
# - Construct and print a tuple of prime numbers.
# Create a tuple of the first numbers that exist from 2 to 100.
primes_list = []

for N in range(2, 100+1):
    for i in range(2, N):
        if N % i == 0:
            break
    else:
        primes_list.append(N)


primes = tuple(primes_list)
print(primes)