"""Exercise 4: Statistical Text Analysis
Copy paste a text in English from a page and save it in a string (let it be a paragraph of 5-6 lines). Then:
- Convert the string into a list
- Print the list and observe its contents.
- Traverse the list to construct a dictionary of multitudes
of occurrences of each character (for each character, to
store the number of times the character appears in the
text)
- Print the character (or characters) with the maximum
number of occurrences."""
string = "Bolton refused to testify during Trump's \
impeachment inquiry, choosing instead to save his disclosures \
for the book that has already vaulted to Amazon's \
best seller list, though he later said he would testify \
in the impeachment trial if subpoenaed by the Senate. \
He argues in the book that lawmakers should have broadened \
impeachment inquiries to examine a raft of ways Trump \
sought to bend the law."

my_list = list(string)
print(my_list)

dictionary = {}

for char in my_list:
    if char not in dictionary:
        dictionary[char] = 1
    else:
        dictionary[char] += 1

max_value = max(list(dictionary.values()))

for key, value in dictionary.items():
    if value == max_value:
        if key == " ":
            print("blank")
        else:
            print(key)

#Observation:
#These exercises show the 3rd use of the dictionary 
#as "accumulators" of information.