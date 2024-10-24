# Exercise 4: Dividing into groups
# The teacher of a classroom wants to build a program that is divided
# into groups.
# which:
# - Given N (let's say N even) students of the class
# - She will divide them into N/2 groups of 2 students, with
# randomly chosen groups of 2 students.
# She will assign them a group task.
# Help the teacher to make two divisions into random groups of 2,
# one for the math lesson
# and one for the geography lesson.
from random import seed
from random import randrange
from datetime import datetime  # all 3 at the beginning

seed(datetime.now().timestamp())  # once, before randint call

N = 30

pupils = set()
for number in range(N):
    pupils.add("pupil" + str(number))

list_pupils = list(pupils)
math_teams = set()
for _ in range(N//2):
    pos1 = randrange(0, len(list_pupils))
    pupil1 = list_pupils.pop(pos1)
    pos2 = randrange(0, len(list_pupils))
    pupil2 = list_pupils.pop(pos2)
    team = (pupil1, pupil2)
    math_teams.add(team)
print("Math teams: " + str(math_teams))

list_pupils = list(pupils)
geography_teams = set()
for _ in range(N//2):
    pos1 = randrange(0, len(list_pupils))
    pupil1 = list_pupils.pop(pos1)
    pos2 = randrange(0, len(list_pupils))
    pupil2 = list_pupils.pop(pos2)
    team = (pupil1, pupil2)
    geography_teams.add(team)
print("Geography teams: " + str(geography_teams))