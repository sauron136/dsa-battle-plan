def convert_strings(names):
    """
    - Goal: convert strings to uppercase
    Step 1: Create an empty list
    Step 2: Got through each string
    Step 3: Apply the .upper() function
    Step 4: Return the new strings
    """
    new_names = []
    for name in names:
        new_names.append(name.upper())
    return new_names


names = ['hello', 'krystian', 'ugo']

if __name__ == "__main__":
    print(convert_strings(names))
