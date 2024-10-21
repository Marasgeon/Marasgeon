# Example 1 : A simple for...in (list comprehensions)
# Instead of this:
my_list = []
for number in range(3):
    my_list.append(number)
print(my_list)
# We can write this:
my_list = [number for number in range(3)]
print(my_list)