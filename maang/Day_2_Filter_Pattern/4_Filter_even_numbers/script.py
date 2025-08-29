def filter_even_numbers(numbers):
    """
    - Goal: Filter even numbers
    Step 1: Start with an empty list
    Step 2: Go through every number
    Step 3: For each number, check if it is even
    Step 4: Add the even number found to the empty list
    Step 5: Return the new list
    """

    even_numbers = []
    if not numbers:
        return "There are no numbers in the list"
    for number in numbers:
        if number % 2 == 0:
            even_numbers.append(number)
    return even_numbers

numbers = [1, 2, 3, 4, 5, 6]

if __name__ == "__main__":
    print(filter_even_numbers(numbers))
