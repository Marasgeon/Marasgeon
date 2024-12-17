# Exercise 2:
# Construct a set with all subsets of {1,2,...,Ν} where N=10.
# (Hint: Increased Difficulty Exercise.)
N = 4

subsets = set()
subsets.add(frozenset())

for i in range(1,N+1):
    new_subsets = set()   
    for subset in subsets:
        nonfz = set(subset)
        nonfz.add(i)
        fz = frozenset(nonfz)
        print(fz)
        new_subsets.add(fz)
    subsets.update(new_subsets)

#print(subsets)
#print(len(subsets))
