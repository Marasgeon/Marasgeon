"""Exercise 3: Shall we play dice on the computer?
Construct a program that will check if the random numbers of players are random enough.... so that we can use them for games of chance, such as dice.
- Construct a dictionary with the following structure
- key: the numbers (dice) from 1-6
- value: One counter for each key. Initially it will be 0
for all keys.
- Then for 1,000,000 times:
- It will roll a die (random number from 1-6)
- It will increment the counter of the corresponding die.
- It will display the occurrence percentages of each roll (by dividing the corresponding counter by 1,000,000)
Repeat for 1000 rolls of the dice and 10 rolls of the dice."""
from random import seed
from random import randrange
from datetime import datetime  # all 3 at the beginning

seed(datetime.now().timestamp())  # once, before randint call

numbers = {}
N = 1000000000

for i in range(1,6+1):
    numbers[i] = 0

for _ in range(N):
    num = randrange(1, 6+1)
    numbers[num] += 1

for i in range(1,6+1):
    print(str(i) + ": " + str(numbers[i]/N))


"""Observation:
- The above exercise could also be done with a list instead of dictionary.
- However, more complex keys require the use of a dictionary."""