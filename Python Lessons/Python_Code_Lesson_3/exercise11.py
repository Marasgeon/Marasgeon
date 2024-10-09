''' Write a program that asks the user to
enter 2 numbers a,b and calculate the solution to the equation
ax+b=0 (a and b are real numbers)
 Reminder: If a is not 0 the solution to the equation is
x=-b/a. If α is 0, the message "The solution of the equation is not 0.
equation has no solution".'''
a = int(input("Give a: "))
b = int(input("Give b: "))

if a != 0:
    result = -b/a
    print("The solution is : " + str(result))
else:
    print("Undefined")