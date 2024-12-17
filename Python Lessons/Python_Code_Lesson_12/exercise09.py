# Exercise 09:
# Define an integer, a real and a string.
# Then, print all three on one line in 4 ways:
# - With string concatenation (+)
# - Me f-strings
# - With a C formatting
# - With the format method
string = "Hello!"
integer = 5
fl = 3.14

print(string + " " + str(integer) + " " + str(fl))
print(f"{string} {integer} {fl}")
print("%s %d %f" % (string, integer, fl))
print("{} {} {}".format(string, integer, fl))