# Exercise 3: Sets of Numbers
# Construct the following sets of natural numbers:
# 1) The set of even numbers from 0 to 100
# 2) The set of odd numbers from 0 to 100
# 3) The multiples of 3 from 0 to 100
# 4) The set of the prime numbers from 0 to 100 (see and previous lesson, exercise 4)
# Print their contents, as well as the number of elements of each set.
#
# Then use these to construct and print the sets
# of natural numbers from 0 to 100 that:
# 1) Are even or multiples of 3
# 2) Are odd primes
# 3) They are prime but not odd
# 4) They are odd or prime but not both odd and prime
N = 100

evens = set()
for number in range(0,N+1,2):
    evens.add(number)
print(evens)

odds = set()
for number in range(1,N,2):
    odds.add(number)
print(odds)

multiples3 = set()
for number in range(0,N,3):
    multiples3.add(number)
print(multiples3)

primes = set()
for number in range(2, N+1):
    for i in range(2, number):
        if number % i == 0:
            break
    else:
        primes.add(number)
print(primes)

set1 = evens | multiples3
print(set1)

set2 = odds & primes
print(set2)

set3 = primes - odds
print(set3)

set4 = primes ^ odds
print(set4)