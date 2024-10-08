# Write a program that will accept from the input
#three integers and then print the maximum of
#of them

x = int(input("Give x: "))
y = int(input("Give y: "))
z = int(input("Give z: "))

if x >= y and x >= z:
    print(x)

if y >= x and y >= z:
    print(y)

if z >= x and z >= y:
    print(z)

