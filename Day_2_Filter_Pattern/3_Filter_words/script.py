def filter_words(titles):
    """
    - Goal: Filter words longer than 4 characters
    Step 1: Start with an empty list
    Step 2: Check each word in the titles in the given list
    Step 3: For each word you see, check if the length is more than 4 char
    Step 4: If a word is more than 4 char, add it to the empty list
    Step 5: Return the new list with those words
    """
    new_words = []
    if not titles:
        return "There are no book titles in the list"
    for word in titles:
        if len(word) > 4:
            new_words.append(word)
    return new_words

titles = ["cat", "elephant", "dog", "butterfly"]

if __name__ == "__main__":
    print(filter_words(titles))
