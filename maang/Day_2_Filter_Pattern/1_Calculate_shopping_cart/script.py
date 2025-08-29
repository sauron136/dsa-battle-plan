def calculate_shopping_cart(item_prices):
    """
    - Goal: Calculate the shopping cart total with tax
    Step 1: Start with an empty shopping cart total = 0
    Step 2: Add the first item to the total
    Step 3: Repeat step 2 for all items
    Step 4: Get the 8% on the total in step 3
    Step 5: Add result in step 4 to result in step 3
    Step 6: Return the result of step 5
    """
    total = 0
    for item in item_prices:
        total = total + item
    tax_percentage = total * 0.08
    total_cost = total + tax_percentage
    return total_cost

item_prices = [1.50, 0.75]

if __name__ == "__main__":
    print(calculate_shopping_cart(item_prices))
