# Exercise 11: Pythagorean triads
# Construct a program which:
# - Will print all triads (a,b,c) with the property that:
# a^2 + b^2 = c^2
# - For integers 1<=a,b,c<=20
for a in range(1,20+1):
    for b in range(1, 20+1):
        for c in range(1, 20+1):
            if a**2 + b**2 == c**2:
                print("(" + str(a)+","+str(b)+","+str(c)+")")