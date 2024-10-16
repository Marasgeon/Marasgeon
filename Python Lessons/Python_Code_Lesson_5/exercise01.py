# Exercise 1: Number squares
# Build a program which:
# - Take a number as input and print the number's square
# (power of 2) of it.
# - The above is done iteratively, until the user types "quit", at which point it will terminate.
user_input = input("Give a number (or type 'quit' to exit): ")
while user_input != "quit":
    print(int(user_input) ** 2)
    user_input = input("Give a number (or type 'quit' to exit): ")