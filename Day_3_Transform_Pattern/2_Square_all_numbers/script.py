def square_of_numbers(numbers):
    """
    - Goal: Square all numbers
    Step 1: Start with an empty square of numbers
    Step 2: Go through each number in the list
    Step 3: For each number, multiply the number by itself
    Step 4: Add the squared number to the list
    Step 5: Return the new list
    """
    squared_numbers = []
    for number in numbers:
        squared_numbers.append(number ** 2)

    return squared_numbers

numbers = [1, 2, 3, 4]

if __name__ == "__main__":
    print(square_of_numbers(numbers))
