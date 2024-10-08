'''
Build a program which:
- Define a logical variable named is_geek
- Initialize it with your self-assessment of whether
if you are a geek
- Define an integer variable named computer_hours
- Initialize it with your self-assessment of whether you are a geek
how many hours you sit at the computer per day.
- It will define an integer variable called sport_hours
- Initialize it with your self-assessment of
how many hours you play sports per day.
- Store it in a new logical variable geek_factor:
- "I sit at the computer more than 5 hours,I play sports for less than 2 hours and I don't believe that I am a geek".
- Interpret the result for your controls.
'''

is_geek = True
computer_hours = 8
sport_hours = 1
geek_factor = computer_hours > 5 and sport_hours < 2 and not is_geek
print(geek_factor)
