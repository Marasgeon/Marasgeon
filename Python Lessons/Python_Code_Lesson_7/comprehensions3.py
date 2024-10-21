# Example 3 : A simple for...in with if...else (list comprehensions)
# Instead of this:
my_list = []
for number in range(10):
    if number % 2 == 0:
        my_list.append(number)
    else:
        my_list.append(number/2)
print(my_list)
# We can write this:
my_list = [number if number%2 == 0 else number/2 for number in range(10)]
print(my_list)