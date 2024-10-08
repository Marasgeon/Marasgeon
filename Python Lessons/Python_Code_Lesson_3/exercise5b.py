#Correct the program of exercise 5 so that it works
#correctly and in the case where the maximum is equal to
#another number.
x = int(input("Give x: "))
y = int(input("Give y: "))
z = int(input("Give z: "))

if x >= y and x >= z:
    print(x)
elif y >= x and y >= z:
    print(y)
else:
    print(z)

