''' Write a program that takes as input two integers and then checks whether a relational operator is valid.
operator between two numbers.
- For example, for the equal sign:
....
if x == y:
print(str(x) + "==" + str(y))
...
- The program should incorporate the relational operators ==, !=, <, >, <=, >='''
x = int(input("Give x: "))
y = int(input("Give y: "))

if x == y:
    print(str(x) + "==" + str(y))

if x != y:
    print(str(x) + "!=" + str(y))

if x < y:
    print(str(x) + "<" + str(y))

if x <= y:
    print(str(x) + "<=" + str(y))

if x > y:
    print(str(x) + ">" + str(y))

if x >= y:
    print(str(x) + ">=" + str(y))

