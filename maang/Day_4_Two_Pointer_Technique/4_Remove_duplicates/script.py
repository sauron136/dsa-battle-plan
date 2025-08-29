def remove_duplicates(products):
    """
    - Goal: Remove duplicates from sorted list
    Step 1: Create left and right pointer
    Step 2: Create an empty list to hold new list without duplicates
    Step 3: Compare values at both pointers:
    - if they are the same, add one to the new list
    - if they are different, check if it already exists in the new list
    - if it exists, move on
    Step 4: 
    """
    if len(products) <= 1:
        return products

    left = 0
    right = 1
    
    while right < len(products):
        if products[left] != products[right]:
            left += 1
            products[left] = products[right]
        right += 1
        
    return products[:left + 1]


if __name__ == "__main__":
    products = [1, 1, 2, 3, 3, 3, 4]
    products1 = [1, 2, 3]
    print(remove_duplicates(products))
    print((remove_duplicates(products1)))
