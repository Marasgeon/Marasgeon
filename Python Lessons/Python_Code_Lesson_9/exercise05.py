"""Exercise 5: Learning to trade
A small trader without a professional conscience makes the following:
- He stores in a dictionary with a name (merchandise) the market prices of his products
- He specifically trades (construct the dictionary):
- Copies of "50 Shades of Grey" with a purchase price
10.18 euros
- Parsley bunches with a purchase price of EUR 0.22
- Repair cement with a purchase price of EUR 5.17
- pirated Billie Eilish CDs with a purchase price of EUR 0.05.
- Then with his experienced eye he rates the customer who comes
with a positive real number (rate) from 0 to 5 (the lower the number, the lower the attempt to win from that customer)
- It then constructs (via dictonary comprehension)
a new dictionary named new_values where each value has
multiplied by (1+rate)
- It prints the new dictionary to show the new price list
to its client."""
merchandise = {
    "book": 10.18,
    "parsley": 0.22,
    "cement": 5.17,
    "cd": 0.05
}

rate = 2.2

new_values = { key: value*(1+rate) for key, value in merchandise.items()}

print(new_values)
