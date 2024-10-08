#Correct the program of exercise 5 so that it works
#correctly and in the case where the maximum is equal to
#another number.
x = int(input("Give x: "))

maximum = x

y = int(input("Give y: "))

if y > maximum:
    maximum = y

z = int(input("Give z: "))

if z > maximum:
    maximum = z

print(maximum)
