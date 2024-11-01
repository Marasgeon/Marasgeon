#Example 7: dict.loop.py
heroes_weapons = {
    "Black Panther": "Anti-Metal Claws",
    "Wolverine": "Claws",
    "Ultron": "Plasma Weapons",
    "Spider-Man": "Web-shooters",
    "Beast": "Claws",
    "Venom": "Web-shooters"
}

print("Key-value loop: ")
for key, value in heroes_weapons.items():
    print(key + " has " + value)

print("\nOrdered Key loop: ")
for key in sorted(heroes_weapons.keys()):
    print(key + " has " + heroes_weapons[key])

print("\nWeapons Gallery: ")
for value in set(heroes_weapons.values()):
    print(value, end=", ")

"""Notes on the Python sorted function:
- sorted takes as its first argument a sequence, set, or dictionary.
- It returns a list of sorted items.
- If we set the 2nd argument reverse=True it sorts the elements into
in descending order"""