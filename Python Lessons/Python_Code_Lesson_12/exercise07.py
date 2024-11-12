# Exercise 07: Construct a program that takes iterative input
# from the user a word, locate it in the utterance, and print
# the utterance with the word in uppercase until the user types 
# "quit"
quote = "I don't hate them...I just feel better when they're not around."

while True:
    while True:
        string = input("Give word: ")
        string = string.strip()

        if string.isalpha():
            word = string.lower()
            break
        else:
            print("only characters please! ")

    if word == "quit":
        break

    quote_lowered = quote.lower()

    if quote_lowered.find(word)!=-1:
        print(quote.replace(word,word.upper()))
    else:
        print("Word not exists in quote!")