# Exercise 9.1: Guess the Number
# We will construct our first game, "Guess the Number".
# - The program will "hide" a number.
# - We will try to guess it.
# - The program will guide us: e.g. if we type
# number that is smaller than the hidden number, the program will
# display an appropriate message.
#
# First, start the construction:
# - Storing in a variable the "hidden" number.
# - Repeatedly the user enters a number and if it is the same
# as the hidden number then display a success message and terminate.
# - Consider how you can make the iteration run
# "forever", so that the program only terminates if
# the user has found the number.
#
# Exercise 9.2: Extension with messages
# Extend the program so that:
# - Display guidance messages about whether the user has typed
# a smaller or larger number than the hidden number
#
# Exercise 9.3: Expansion with maximum number of attempts
# Extend the program so that:
# - Define a variable that represents the maximum number
# of attempts allowed.
# - Define one more variable that measures how many attempts
# the user has made.
# - Stop execution and display a message to the user
# that it has lost if it reaches the maximum number
# of attempts allowed.
hidden = 43

cnt = 0
max_guesses = 10 + 1
guess = int(input("Give a number: "))

while True:
    cnt += 1
    if cnt == max_guesses:
        print("You lose!")
        break

    if guess > hidden:
        print("It's smaller! ")
    elif guess < hidden:
        print("It's bigger! ")
    else:
        print("You've found it!")
        break

    guess = int(input("Give a number: "))

