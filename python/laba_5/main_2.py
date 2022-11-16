def get_items(item):
    name = item[0]
    if (item[1] >= 18):
        return name


people = {
    "Bob Smith": 16,
    "Alice Taylor": 19,
    "Rolf Wilson": 21,
    "Anna Miller": 17
}
adult_names = list(filter(lambda x: x, map(get_items, people.items())))

print(adult_names)
