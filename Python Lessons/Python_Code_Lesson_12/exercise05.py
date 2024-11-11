# Exercise 05:
# Notice that with the command
# x = int(input("Give an integer")
# if the user types something that is not an integer, 
# an error is generated.
# Think about how you would check the input so that 
# if the input does not contain an integer, 
# print a message to the user to re-enter the number.
while True:
    string = input("Give an integer: ")

    if string.isdigit():
        number = int(string)
        print(f"Number entered: {number}")
        break
    else:
        print("INTEGER please! ")
