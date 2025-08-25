def sum_all_numbers_in_a_list(list_of_numbers):
    """
    Step 1: Start with total = 0
    Step 2: Pick the first number on the list
    Step 3: Add the first number to the total
    Step 4: Repeat steps 2 and 3 for all subsequent numbers
    Step 5: Return total once all numbers have been added
    """
    if not list_of_numbers:
        return "No item in the list"
    total = 0
    for number in list_of_numbers:
        total = total + number
    return total

numbers = [2, 3, 4, 5, 6]
if __name__ == "__main__":
    print(sum_all_numbers_in_a_list(numbers))
