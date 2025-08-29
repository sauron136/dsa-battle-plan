def three_sum_demo(nums, target):
    """
    Demonstrates the three sum algorithm step by step
    """
    results = []
    
    for i in range(len(nums) - 2):  # -2 because we need at least 2 more numbers
        fixed_num = nums[i]
        print(f"\n🎯 TRYING {fixed_num} as our fixed first number")
        print(f"Now we need two numbers that add up to: {target - fixed_num}")
        
        # Step 3: Use two pointers for the remaining numbers
        left = i + 1  # Start right after the fixed number
        right = len(nums) - 1  # Start at the end
        
        remaining_nums = nums[left:right+1]
        print(f"Looking in remaining numbers: {remaining_nums}")
        
        # Step 4: Move pointers to find the right pair
        while left < right:
            current_sum = nums[left] + nums[right]
            total_sum = fixed_num + current_sum
            
            print(f"  Trying: {fixed_num} + {nums[left]} + {nums[right]} = {total_sum}")
            
            if total_sum == target:
                print(f"  ✅ FOUND IT! [{fixed_num}, {nums[left]}, {nums[right]}]")
                results.append([fixed_num, nums[left], nums[right]])
                left += 1
                right -= 1
            elif total_sum < target:
                print(f"  ⬆️ Too small ({total_sum} < {target}), move left pointer right")
                left += 1
            else:
                print(f"  ⬇️ Too big ({total_sum} > {target}), move right pointer left")
                right -= 1
    
    print("\n" + "=" * 50)
    print(f"Final results: {results}")
    return results

if __name__ == "__main__":
    # Example 1: Simple case
    print("EXAMPLE 1:")
    three_sum_demo([1, 2, 3, 4, 6], 10)
    
