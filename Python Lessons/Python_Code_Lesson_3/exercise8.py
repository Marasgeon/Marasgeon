#Two experienced backgammon players decide who will play
#first by rolling two dice each. He wins
#who has the highest total on the two dices.
#- Construct a program that decides who player has won and will play first.
p11 = 3
p12 = 6
p21 = 4
p22 = 5

if p11+p12 < p21+p22:
    print("Second player plays first.")
elif p11+p12 == p21+p22:
    print("Draw!")
else:
    print("First player plays first.")

