# Exercise 6: Accessing specific items in a list
# Construct a program which:
# - Define a list of 5 cities
# - The list will print out those cities that are
# at even positions in the list.
cities = ["New York", "London", "Ptolemaida", "Tokyo", "Aizuwakamatsu"]

for index in range(0,len(cities),2): # 0, 2, 4
    print(cities[index])
