#Continuing exercise 10 of the previous lesson,
#correct the program to elegantly display the exact
#time (e.g. 01:14:08 instead of 1:14:8)
hours = int(input("Give hours: "))
minutes = int(input("Give minutes: "))
seconds = int(input("Give seconds: "))

if hours < 10:
    message1 = "0" + str(hours)
else:
    message1 = str(hours)

if minutes < 10:
    message2 = "0" + str(minutes)
else:
    message2 = str(minutes)

if seconds < 10:
    message3 = "0" + str(seconds)
else:
    message3 = str(seconds)


message = message1 + ":" + message2 + ":" + message3
print(message)