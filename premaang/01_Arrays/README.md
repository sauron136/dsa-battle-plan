# Arrays

Arrays are a fundamental data structure consisting of a fixed-size collection of elements of the same type, stored in contiguous memory locations. They provide O(1) time complexity for random access via indices but have O(n) time for insertions/deletions in the middle due to shifting elements. In Python, lists act as dynamic arrays, allowing resizing. Arrays are ideal for scenarios requiring fast lookups, iterations, or storing ordered data.

## Key Operations
- **Traversal/Iteration**: Visiting each element, often using loops (e.g., for summing or finding patterns). Time: O(n), Space: O(1).
- **Search**: Finding an element or subarray (e.g., linear search O(n), binary search O(log n) on sorted arrays). Time: O(n) worst, O(log n) sorted; Space: O(1).
- **Insertion/Deletion**: Adding or removing elements, which may require shifting (O(n) time). Time: O(n), Space: O(1).
- **Sorting/Merging**: Arranging elements or combining arrays (e.g., merge sort O(n log n)). Time: O(n log n), Space: O(n).
- **Subarray Operations**: Working with contiguous parts (e.g., finding max sum). Time: Varies (e.g., O(n) for Kadane), Space: O(1).

# Array Operations in Python

This document provides comprehensive examples of fundamental array operations in Python, with time and space complexity analysis for each operation.

## 1. Traversal/Iteration
**Time Complexity: O(n), Space Complexity: O(1)**

```python
def traverse_array(arr):
    """Visit each element in the array - like a teacher checking each student's homework."""
    total = 0
    for element in arr:
        total += element
        print(f"Current element: {element}, Running total: {total}")
    return total

def traverse_with_index(arr):
    """Traverse with index access - useful for position-dependent operations."""
    for i in range(len(arr)):
        print(f"Index {i}: {arr[i]}")

# Example usage
numbers = [1, 2, 3, 4, 5]
result = traverse_array(numbers)
print(f"Sum of all elements: {result}")
```

## 2. Search Operations
**Linear Search: Time O(n), Space O(1)**
**Binary Search: Time O(log n), Space O(1)**

```python
def linear_search(arr, target):
    """Find target element using linear search."""
    for i in range(len(arr)):
        if arr[i] == target:
            return i  # Return index of found element
    return -1  # Element not found

def binary_search(sorted_arr, target):
    """Find target in sorted array using binary search."""
    left, right = 0, len(sorted_arr) - 1

    while left <= right:
        mid = (left + right) // 2
        if sorted_arr[mid] == target:
            return mid
        elif sorted_arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1

    return -1  # Element not found

def find_subarray(arr, subarray):
    """Find if subarray exists within main array."""
    if len(subarray) > len(arr):
        return -1

    for i in range(len(arr) - len(subarray) + 1):
        if arr[i:i + len(subarray)] == subarray:
            return i
    return -1

# Example usage
numbers = [1, 3, 5, 7, 9, 11, 13]
print(f"Linear search for 7: {linear_search(numbers, 7)}")
print(f"Binary search for 7: {binary_search(numbers, 7)}")
print(f"Subarray [5, 7] found at: {find_subarray(numbers, [5, 7])}")
```

## 3. Insertion/Deletion Operations
**Time Complexity: O(n), Space Complexity: O(1)**

```python
def insert_at_position(arr, element, position):
    """Insert element at specific position (shifts elements to the right)."""
    if position < 0 or position > len(arr):
        raise IndexError("Position out of bounds")

    # Using list.insert() method
    arr.insert(position, element)
    return arr

def delete_at_position(arr, position):
    """Delete element at specific position (shifts elements to the left)."""
    if position < 0 or position >= len(arr):
        raise IndexError("Position out of bounds")

    deleted_element = arr.pop(position)
    return deleted_element, arr

def delete_by_value(arr, value):
    """Delete first occurrence of a value."""
    try:
        arr.remove(value)
        return True
    except ValueError:
        return False  # Value not found

# Example usage
grades = [85, 90, 78, 92]
print(f"Original: {grades}")

insert_at_position(grades, 88, 2)
print(f"After insertion: {grades}")

deleted_grade, updated_grades = delete_at_position(grades, 1)
print(f"Deleted {deleted_grade}, Updated: {updated_grades}")
```

## 4. Sorting/Merging Operations
**Time Complexity: O(n log n), Space Complexity: O(n)**

```python
def merge_sorted_arrays(arr1, arr2):
    """Merge two sorted arrays into one sorted array."""
    merged = []
    i = j = 0

    # Compare elements and merge in sorted order
    while i < len(arr1) and j < len(arr2):
        if arr1[i] <= arr2[j]:
            merged.append(arr1[i])
            i += 1
        else:
            merged.append(arr2[j])
            j += 1

    # Add remaining elements
    merged.extend(arr1[i:])
    merged.extend(arr2[j:])

    return merged

def quick_sort(arr):
    """Sort array using quicksort algorithm."""
    if len(arr) <= 1:
        return arr

    pivot = arr[len(arr) // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]

    return quick_sort(left) + middle + quick_sort(right)

def merge_sort(arr):
    """Sort array using merge sort algorithm."""
    if len(arr) <= 1:
        return arr

    mid = len(arr) // 2
    left = merge_sort(arr[:mid])
    right = merge_sort(arr[mid:])

    return merge_sorted_arrays(left, right)

# Example usage
list1 = [1, 3, 5, 7]
list2 = [2, 4, 6, 8]
merged = merge_sorted_arrays(list1, list2)
print(f"Merged arrays: {merged}")

unsorted = [64, 34, 25, 12, 22, 11, 90]
print(f"Original: {unsorted}")
print(f"Quick sorted: {quick_sort(unsorted.copy())}")
print(f"Merge sorted: {merge_sort(unsorted.copy())}")
```

## 5. Subarray Operations
**Time Complexity: Varies (O(n) for Kadane's algorithm), Space Complexity: O(1)**

```python
def max_subarray_sum(arr):
    """Find maximum sum of contiguous subarray using Kadane's algorithm."""
    if not arr:
        return 0

    max_sum = current_sum = arr[0]

    for i in range(1, len(arr)):
        # Either extend existing subarray or start new one
        current_sum = max(arr[i], current_sum + arr[i])
        max_sum = max(max_sum, current_sum)

    return max_sum

def find_max_subarray_with_indices(arr):
    """Find maximum subarray sum and return start/end indices."""
    if not arr:
        return 0, 0, 0

    max_sum = current_sum = arr[0]
    start = end = temp_start = 0

    for i in range(1, len(arr)):
        if current_sum < 0:
            current_sum = arr[i]
            temp_start = i
        else:
            current_sum += arr[i]

        if current_sum > max_sum:
            max_sum = current_sum
            start = temp_start
            end = i

    return max_sum, start, end

def sliding_window_max(arr, window_size):
    """Find maximum in each sliding window of given size."""
    if window_size > len(arr) or window_size <= 0:
        return []

    result = []
    for i in range(len(arr) - window_size + 1):
        window_max = max(arr[i:i + window_size])
        result.append(window_max)

    return result

def subarray_with_sum(arr, target_sum):
    """Find subarray with given sum (works for positive numbers)."""
    start = 0
    current_sum = 0

    for end in range(len(arr)):
        current_sum += arr[end]

        while current_sum > target_sum and start <= end:
            current_sum -= arr[start]
            start += 1

        if current_sum == target_sum:
            return start, end

    return -1, -1  # No subarray found

# Example usage
test_array = [-2, -3, 4, -1, -2, 1, 5, -3]
max_sum = max_subarray_sum(test_array)
print(f"Maximum subarray sum: {max_sum}")

max_sum, start_idx, end_idx = find_max_subarray_with_indices(test_array)
print(f"Max sum: {max_sum}, Subarray: {test_array[start_idx:end_idx+1]}")

# Sliding window example
numbers = [1, 3, -1, -3, 5, 3, 6, 7]
window_maxes = sliding_window_max(numbers, 3)
print(f"Sliding window maximums: {window_maxes}")

# Subarray with target sum
positive_nums = [1, 4, 20, 3, 10, 5]
start, end = subarray_with_sum(positive_nums, 33)
if start != -1:
    print(f"Subarray with sum 33: {positive_nums[start:end+1]} (indices {start}-{end})")
```

## Testing Examples

```python
def run_all_examples():
    """Run all array operation examples with test data."""
    print("=== Array Operations Demo ===\n")

    # Test data
    test_array = [3, 1, 4, 1, 5, 9, 2, 6]

    print("1. Traversal:")
    traverse_array(test_array[:5])

    print("\n2. Search:")
    print(f"Linear search for 4: {linear_search(test_array, 4)}")
    sorted_test = sorted(test_array)
    print(f"Binary search for 4 in sorted array: {binary_search(sorted_test, 4)}")

    print("\n3. Insertion/Deletion:")
    temp_array = test_array.copy()
    insert_at_position(temp_array, 99, 2)
    print(f"After inserting 99 at position 2: {temp_array}")

    print("\n4. Sorting:")
    print(f"Original: {test_array}")
    print(f"Sorted: {merge_sort(test_array.copy())}")

    print("\n5. Subarray Operations:")
    subarray_test = [-2, -3, 4, -1, -2, 1, 5, -3]
    max_sum = max_subarray_sum(subarray_test)
    print(f"Maximum subarray sum in {subarray_test}: {max_sum}")

if __name__ == "__main__":
    run_all_examples()
```

## Complexity Summary

| Operation | Time Complexity | Space Complexity | Use Case |
|-----------|----------------|------------------|----------|
| Traversal | O(n) | O(1) | Processing all elements |
| Linear Search | O(n) | O(1) | Finding element in unsorted array |
| Binary Search | O(log n) | O(1) | Finding element in sorted array |
| Insertion/Deletion | O(n) | O(1) | Dynamic array modifications |
| Sorting | O(n log n) | O(n) | Ordering elements |
| Kadane's Algorithm | O(n) | O(1) | Maximum subarray sum |

These examples demonstrate the fundamental array operations you'll encounter in coding interviews and real-world applications. Each operation is optimized for its specific use case while maintaining clean, readable code.
