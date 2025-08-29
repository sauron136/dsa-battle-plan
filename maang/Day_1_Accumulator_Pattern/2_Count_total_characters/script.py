def count_total_number_of_characters(words):
    """
    - Count total number of characters in a list
    Step 1: Start with total = 0
    Step 2: Get the length of the first word
    Step 3: Add the first length to the total
    Step 4: Repeat step 2 and 3 for all subsequent words
    Step 5: Return total once all numbers have been added
    """
    if not words:
        return "No word in the list"
    total = 0
    for word in words:
        total = total + len(word)
    return total


words = ["hello", "world", "python"]

if __name__ == "__main__":
    print(count_total_number_of_characters(words))
