# Example of complex expression with many operations
my_list = [1,2,3]   # 2 3 1 2 7 8 2 3 1 2 7 8 2 3 1 2 7 8 2 3 1 2 7 8
new_list = ((my_list * 2)[1:5] + list((7,8)))*4
print(my_list)
print(new_list)
print(str((my_list+new_list).count(2)))
