# Exercise 02:
# "I guess the only time most people think about injustice
#  is when it happens to them." (exercise02.initial.py)
# Find the number of occurrences of each letter in the above above quotation by Charles Bukowski (all of whose quotations are in the today's lesson) and print them in alphanumeric order.
# The first few lines of the printout should be:
#  : 16
# .: 1
# Ι: 1
# a: 2
string = "I guess the only time most people think about in justice is when it happens to them."

letters = set(string)
dictionary = {letter: 0 for letter in letters}

for char in string:
    dictionary[char] += 1

for key in sorted(dictionary.keys()):
    print(key + ": " + str(dictionary[key]))
