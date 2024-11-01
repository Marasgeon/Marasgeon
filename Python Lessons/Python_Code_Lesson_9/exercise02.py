#Exercise 2: Entity with attributes
"""
In the Database of the C' Subdivision A/B/23/8 of the
Ministry of Bureaucracy, a register of the entities is maintained
A register of employees. For each employee the details are maintained:
- Name
- Surname
- Father's Name
- Date of Birth
- Address
- Telephone number
Construct a Python program which will initialize
(with data of your choice) an employee with the above
data.
Then print the employee's details.
"""
person = {
    "name": "Peter",
    "surname": "Parker",
    "father_name": "Richard",
    "birth_date": "01/08/1962",
    "address": "Forest Hills, Queens",
    "phone": "8901234567"
}

print("Full Name  : " + person["name"] + " " + person["father_name"] + " " + person["surname"])
print("Birthdate  : " + person["birth_date"])
print("Address    : " + person["address"])
print("Phone      : " + person["phone"])

# Observation:
# In these exercises we saw (a) the use of a dictionary 
# with the expected usage (keys that identify values) 
# and (b) as the means for to group the attributes of an entity.