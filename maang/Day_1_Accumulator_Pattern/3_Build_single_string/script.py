def build_a_single_string(strings):
    """
    Build a single string from list of words
    Step 1: Start with an empty string = ""
    Step 2: Add the first word to the smpty string
    Step 3: Repeat step 2 for all subsequent numbers
    Step 4: Return strings once all the strings have been added
    """
    if not strings:
        return "No string in the list"
    total = ""
    for string in strings:
        total = total + string
    return total

strings = ["Krystian", "Ugochukwu", "Nmeze"]

if __name__ == "__main__":
    print(build_a_single_string(strings))
