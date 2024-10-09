#Write a program that will accept from the input
#the age of the user and print a message about whether the user is
#underage (<18), adult (18..65) or retired (>65)
age = int(input("Give age: "))

if age<18:
    print("underage")
elif age>=18 and age<=65:
    print("adult")
else:
    print("retired")