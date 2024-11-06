"""Exercise 7: Simpsons Family Tree
Observe the information of a family in a complex dictionary, in the file exercise07.initial.py. Then build a program that prints:
- The name of each family member accompanied by a random quote.
Note: The exercise has increased difficulty. """

from random import seed
from random import randrange
from datetime import datetime  # all 3 at the beginning

seed(datetime.now().timestamp())  # once, before randint call

family = {
    "father": {
        "name": "Homer Simpson",
        "occupation": "nuclear safety inspector",
        "quotes": [
            "Lord Help Me, I’m Just Not That Bright",
            "Kids, You Tried Your Best And You Failed Miserably. The Lesson Is, Never Try.",
            "It Takes Two To Lie; One To Lie, And One To Listen.",
            "To Alcohol! The Cause Of, And Solution To, All Of Life's Problems.",
            "I Am So Smart! I Am So Smart! S-M-R-T! I Mean S-M-A-R-T!",
            "D'Oh!"
        ]
    },
    "mother": {
        "name": "Marge Simpson",
        "occupation": "housewife",
        "quotes": [
            "Am I Pregnant?",
            "And all this time I thought 'Googling yourself' meant the other thing.",
            "Homer, we have to do something. Today he's drinking people's blood. Tomorrow he could be smoking.",
            "I guess one person can make a difference. But most of the time, they probably shouldn't."
        ]
    },
    "children": [
        {
            "name": "Bart Simpson",
            "quotes": [
                "Eat My Shorts!",
                "random Does It Make You Feel Superior To Tear Down People’s Dreams?",
                "Pablo Neruda Said, 'Laughter Is The Language Of The Soul.'",
                "I Just Think It's A Fantasy. If You Believe In Angels, Why Not Sea Monsters, Unicorns Or Leprechauns?"
            ]
        },
        {
            "name": "Maggie Simpson",
            "quotes": [
                "(sucking noise)",
                "(crying)",
                "Daddy!"
            ]
        }
    ]
}

print(family["father"]["name"] + ": " + family["father"]["quotes"][randrange(len(family["father"]["quotes"]))])
print(family["mother"]["name"] + ": " + family["mother"]["quotes"][randrange(len(family["mother"]["quotes"]))])
for i in range(len(family["children"])):
    print(family["children"][i]["name"] + ": " + family["children"][i]["quotes"][randrange(len(family["children"][i]["quotes"]))])

# Observation:
# This type of information organization is common 
# in real-world(4th use of dictionaries)