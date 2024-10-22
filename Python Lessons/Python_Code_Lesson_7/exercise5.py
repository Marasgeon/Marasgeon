# Exercise 5
# Construct a list containing the even numbers that are both multiples
# of 3, using a descriptive list for the construction.
my_list = [number for number in range(100) if number%2 == 0 and number%3 == 0]
print(my_list)