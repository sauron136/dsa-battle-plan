def sum_only_positive_numbers(numbers):
    """
    Goal - Sum only Positive Numbers From Mixed List
    Step 1: Start with a total = 0
    Step 2: Take each number and check if it is a positive number
    Step 3: If it is positive, add it to the total
    Step 4: Repeat step 2 and 3 for subsequent numbers
    Step 5: Return total
    """
    total = 0
    for number in numbers:
        if number > 0:
            total = total + number
    return total

numbers = [1, -2, 3, -4, 5, 6]

if __name__ == "__main__":
    print(sum_only_positive_numbers(numbers))
