def two_sum(sorted_list, target):
    """
    - Goal: Find pair that sum to target
    Step 1: Create left and right pointers
    Step 2: Move pointers one at a time
        - Check if the sum of values at each pointer at intervals = target
        - if they are, return the index of both
        if they aren't, return None
    """
    left, right = 0, len(sorted_list) - 1
    while left < right:
        current_sum = sorted_list[left] + sorted_list[right]
        if current_sum == target:
            return [left, right]
        elif current_sum < target:
            left += 1
        else:
            right -= 1
    return None

if __name__ == "__main__":
    sorted_list = [1, 2, 3, 4, 5]
    print(two_sum(sorted_list, 9))
        
