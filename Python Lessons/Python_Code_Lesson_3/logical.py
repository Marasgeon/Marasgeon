# Example of logical operators
spirit = True
flesh = False
print(spirit and flesh) #False
print(spirit or flesh) #True
print(not spirit) #False
print(spirit and not flesh) #True

# Truth tables for and, or, not
print("-------------")
print(True and True)
print(True and False)
print(False and True)
print(False and False)
print("-------------")
print(True or True)
print(True or False)
print(False or True)
print(False or False)
print("-------------")
print(not True)
print(not False)