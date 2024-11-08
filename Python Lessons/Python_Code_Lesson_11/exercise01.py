# Exercise 01: Define a 3x3 list of random integers 
# in the interval 0...999
# Then print the table in the following 
# format (note the use of tabs) : 

from random import seed
from random import randrange
from datetime import datetime  # all 3 at the beginning

seed(datetime.now().timestamp())  # once, before randint call

array = []

for row in range(3):
    new_row = []
    for item in range(3):
        new_row.append(randrange(0,1000))
    array.append(new_row)

print(array)

for row in array:
    for _ in range(3):
        print("+----", end="")
    print("+")
    for item in row:
        print(("|" + str(item) + "\t").expandtabs(5), end="")
    print("|")
for _ in range(3):
    print("+----", end="")
print("+")

