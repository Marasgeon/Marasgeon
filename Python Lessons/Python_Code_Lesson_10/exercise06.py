"""Exercise 6: Dictionary from lists
The code file exercise06.initial contains a dictionary with 40 highest buildings in the world where as key is used the name of the building and as value is the country in which the building is located.
- Construct a new dictionary with the name country_buildings which will contain:
- key: the countries appearing in the dictionary
- value: a list of the tallest buildings located in that country
(Note: Obviously the conversion must be done with code
, by traversing the data of the 1st dictionary we have to construct the 2nd dictionary)"""
buildings = {
    "Burj Khalifa": "United Arab Emirates",
    "Shanghai Tower": "China",
    "Abraj Al-Bait Clock Tower": "Saudi Arabia",
    "Ping An Finance Center": "China",
    "Lotte World Tower": "South Korea",
    "One World Trade Center": "United States",
    "Guangzhou CTF Finance Center": "China",
    "Tianjin CTF Finance Center": "China",
    "Zun Taipei": "Taiwan",
    "Shanghai World Financial Center": "China",
    "Central Park Tower": "United States",
    "Lakhta Center": "Russia",
    "Landmark": "Vietnam",
    "Changsha IFS Tower": "China",
    "Petronas Tower 1": "Malaysia",
    "Petronas Tower 2": "Malaysia",
    "Zifeng Tower": "China",
    "Suzhou IFS": "China",
    "The Exchange": "Malaysia",
    "Willis Tower": "United States",
    "KK100": "China",
    "Guangzhou International Finance Center": "China",
    "Wuhan Center": "China",
    "111 West 57th Street": "United States",
    "One Vanderbilt": "United States",
    "Dongguan International Trade Center": "China",
    "432 Park Avenue": "United States",
    "Marina 101": "United Arab Emirates",
    "Trump International Hotel and Tower": "United States",
    "Jin Mao Tower": "China",
    "Princess Tower": "United Arab Emirates",
    "Al Hamra Tower": "Kuwait",
    "International Finance Centre": "China",
    "Haeundae LCT The Sharp a list of the tallest buildings located in that Landmark Tower": "South Korea",
    "Nanning China Resources Tower": "China",
    "Guiyang Financial Center Tower": "China",
    "China Resources Headquarters": "China",
    "23 Marina": "United Arab Emirates",
    "Shun Hing Square": "China",
    "Eton Place Dalian Tower 1": "China"
}

country_buildings = {}

for key,value in buildings.items():
    if value not in country_buildings:
        country_buildings[value] = [key]
    else:
        country_buildings[value].append(key)

print(country_buildings)

"""Comment:
To store the information of the exercise, "more correct" way 
of storing the information for the exercise information is the 
second way, because any information (country or building) appears
 once in the dictionary."""