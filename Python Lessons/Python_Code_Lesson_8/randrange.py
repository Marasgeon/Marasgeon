# Example of random usage
from random import seed
from random import randrange
from datetime import datetime  # all 3 at the beginning
from random import seed
from random import randrange
from datetime import datetime

seed(datetime.now().timestamp())  # once, before randint call
print(datetime.now().timestamp())
x = randrange(10, 20)  # from 10 to 19
print(x)
