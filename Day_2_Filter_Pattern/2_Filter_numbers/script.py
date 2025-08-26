def filter_numbers(numbers):
    """
    - Goal: Filter numbers greater than 5
    Step 1: Start with an empty list
    Step 2: Go through each number in the given list
    Step 3: For each number, check if it is greater than 5
    Step 4: If it is greater than 5, add it to the empty list
    Step 5: Return the new list that contain numbers greater than 5
    """
    greater_than_five = []
    if not numbers:
        return "There are no scores in the list"
    for number in numbers:
        if number > 5:
            greater_than_five.append(number)

    return greater_than_five

numbers = [1, 6, 3, 8, 2, 9]

if __name__ == "__main__":
    print(filter_numbers(numbers))

