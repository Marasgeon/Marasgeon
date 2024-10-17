# Example while 7
# And several times we use a logic
# variable to do the control of the
# condition:
active = True
while active:
    user_input = input("Type string or 'quit': ")
    if user_input == "quit":
        print("Bye bye!")
        active = False
    else:
        print("Why " + user_input + "?!")
