# Exercise 06: Construct a program that will read 
# from the input.
# Perform a standard string check:
# - Trimming
# - Determine that it consists only of letters
# - Correct the lower-case letters in case of an input error.
# Then print it in a 30-character-wide box, centered, a 
# greeting to the user
while True:
    string = input("Give name: ")
    string = string.strip()

    if string.isalpha():
        name = string.capitalize()
        print(f"Name entered: {name}")
        break
    else:
        print("only characters please! ")

while True:
    string = input("Give surname: ")
    string = string.strip()

    if string.isalpha():
        surname = string.capitalize()
        print(f"Surname entered: {surname}")
        break
    else:
        print("only characters please! ")


print(f"+{28*'-'}+")
print(f"|{(name+ ' ' + surname).center(28)}|")
print(f"+{28*'-'}+")