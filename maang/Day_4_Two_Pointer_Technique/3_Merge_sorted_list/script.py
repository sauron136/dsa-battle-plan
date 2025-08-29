def merge_lists(list1, list2):
    """
    - Goal: Merge two sorted lists
    Step 1: Create pointer for each list
    Step 2: Create an empty list to hold final result
    Step 3: As long as there are items in each list:
        - Compare item of each list
        - if item in first list is smaller than second list, append to empty list
    Step 4: Do this for all items
    Step 5: After the loop, append any remaining items from the first list
    Step 6: Append any remaining item from the second list
    """
    list1_pointer = 0
    list2_pointer = 0
    sorted_list = []
    while list1_pointer < len(list1) and list2_pointer < len(list2):
        if list1[list1_pointer] < list2[list2_pointer]:
            sorted_list.append(list1[list1_pointer])
            list1_pointer += 1
        else:
            sorted_list.append(list2[list2_pointer])
            list2_pointer += 1
    sorted_list.extend(list1[list1_pointer:])
    sorted_list.extend(list2[list2_pointer:])

    return sorted_list

if __name__ == "__main__":
    list1 = [1, 3, 5]
    list2 = [2, 4, 6]
    print(merge_lists(list1, list2))

