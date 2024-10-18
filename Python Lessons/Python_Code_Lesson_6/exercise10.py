# Exercise 10: The party
# - Keeps a list of your 3 best friends
# - It will keep a second list of the 10 who have been invited to a party
# - It will count how many of your best friends are
# are invited to the party
# - If there are less than 2, then you will decline the invitation
# to the party, otherwise you will accept it.
my_friends = ["a", "b", "c"]
guests = ["1", "2", "a", "4", "5", "6", "b", "8", "9", "10"]

cnt = 0
for friend in my_friends:
    if friend in guests:
       cnt += 1

if cnt < 2:
    print("I won't come")
else:
    print("I'll come")