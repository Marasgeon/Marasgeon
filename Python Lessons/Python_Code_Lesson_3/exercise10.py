#Build a program that prompts the user to
#enter his/her favourite fruit.
#- If the user enters orange then the program should
#reply that it is indeed delicious
#- If the user enters apple the program should reply that
#it is awful
#- If the user enters anything else, the program should
#reply that it is simply satisfactory.
fruit = input("Give fruit: ")

if fruit == "orange":
    print("delicious!")
elif fruit == "apple":
    print("awful!!")
else:
    print("satisfactory.")