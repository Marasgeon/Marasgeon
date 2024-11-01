#Exercise 1: Dictionary
"""Build a program that
- Construct a real dictionary.
- Contain the initial entries:
- defiant: insolent, impertinent
- reproach: disgraceful, stormy.
- pompousness: blather, nonsense
- Print the dictionary
- Then add the entry:
- gibberish: nonsense, drivel
- To ask the user for a new key-value pair
- Add the pair to the dictionary and print the dictionary."""
dictionary = {
    "defiant" : "insolent, impertinent",
    "reproach": "disgraceful, stormy",
    "pompousness": "blather, nonsense"
}

print(dictionary)

dictionary["gibberish"] = "nonsense, drivel"

print(dictionary)

key = input("Give the word: ")
value = input("Give the explanation: ")

dictionary[key] = value

print(dictionary)