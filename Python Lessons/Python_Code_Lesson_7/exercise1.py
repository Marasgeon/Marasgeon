# Exercise 1: Dynamic construction of tuples
# For some mysterious reasons we want to construct a program that:
# - Read from the input 10 integers between 10 and 20 and stores them in a list
# - Will create a tuple containing these 10
# - Create a second tuple containing 10 numbers in order, the squares of these 10 numbers.
my_list = []
for i in range(10):
    user_input = int(input("Give a number: "))
    while user_input < 10 or user_input > 20:
        user_input = int(input("Give a number(10...20): "))
    my_list.append(user_input)

print(my_list)

my_tuple = tuple(my_list)
print(my_tuple)

list_squares = []
for i in range(10):
    list_squares.append(my_list[i]**2)

list_squares.sort()
tuple_squares = tuple(list_squares)
print(tuple_squares)
