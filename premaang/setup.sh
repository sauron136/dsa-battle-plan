#!/bin/bash

# Script to create directory structure for data structures, operations, and problems
# with populated README.md files for problems and main topic folders

# Function to create problem folder with README.md and script.py
create_problem_folder() {
    local problem_dir="$1"
    local problem_name="$2"
    local problem_desc="$3"
    mkdir -p "$problem_dir"
    # Create README.md with problem name and description
    echo "# $problem_name" > "$problem_dir/README.md"
    echo -e "\n$problem_desc" >> "$problem_dir/README.md"
    touch "$problem_dir/script.py"
}

# Notes for each main topic
read -r -d '' ARRAYS_NOTES << 'EOF'
# Arrays

Arrays are a fundamental data structure consisting of a fixed-size collection of elements of the same type, stored in contiguous memory locations. They provide O(1) time complexity for random access via indices but have O(n) time for insertions/deletions in the middle due to shifting elements. In Python, lists act as dynamic arrays, allowing resizing. Arrays are ideal for scenarios requiring fast lookups, iterations, or storing ordered data.

## Key Operations
- **Traversal/Iteration**: Visiting each element, often using loops (e.g., for summing or finding patterns). Time: O(n), Space: O(1).
- **Search**: Finding an element or subarray (e.g., linear search O(n), binary search O(log n) on sorted arrays). Time: O(n) worst, O(log n) sorted; Space: O(1).
- **Insertion/Deletion**: Adding or removing elements, which may require shifting (O(n) time). Time: O(n), Space: O(1).
- **Sorting/Merging**: Arranging elements or combining arrays (e.g., merge sort O(n log n)). Time: O(n log n), Space: O(n).
- **Subarray Operations**: Working with contiguous parts (e.g., finding max sum). Time: Varies (e.g., O(n) for Kadane), Space: O(1).
EOF

read -r -d '' STRINGS_NOTES << 'EOF'
# Strings

Strings are sequences of characters, treated as immutable arrays in Python. They support O(1) access but are immutable, so modifications create new strings (O(n) time). Common for text manipulation, pattern matching.

## Key Operations
- **Traversal/Concatenation**: Iterating or building new strings. Time: O(n), Space: O(n) for new string.
- **Search/Substring**: Finding patterns or substrings. Time: O(n) linear, O(n+m) KMP; Space: O(1).
- **Replacement/Modification**: Replacing characters or substrings. Time: O(n), Space: O(n).
- **Sorting/Counting**: Sorting characters or counting frequencies. Time: O(n log n) sort, O(n) count; Space: O(n).
- **Palindrome/Anagram Checks**: Checking symmetries or permutations. Time: O(n), Space: O(1) or O(26) for chars.
EOF

read -r -d '' HASH_MAP_NOTES << 'EOF'
# Hash Map (Dictionary in Python)

Hash maps are key-value pairs with average O(1) lookup, insertion, and deletion via hashing. In Python, dict is a hash map. Useful for frequency counting, mappings, caching. Worst-case O(n) due to collisions, but average O(1).

## Key Operations
- **Insertion**: Adding key-value pairs. Time: O(1) average, Space: O(1).
- **Lookup/Search**: Retrieving value by key. Time: O(1) average, Space: O(1).
- **Deletion**: Removing keys. Time: O(1) average, Space: O(1).
- **Iteration/Counting**: Traversing entries or counting frequencies. Time: O(n), Space: O(1).
- **Grouping/Mapping**: Grouping by key or mapping values. Time: O(n), Space: O(n).
EOF

read -r -d '' SETS_NOTES << 'EOF'
# Sets

Sets are collections of unique elements with O(1) average lookup, insertion, deletion. In Python, set is hash-based. Useful for uniqueness, membership testing, intersections. Worst-case O(n), average O(1).

## Key Operations
- **Insertion**: Adding elements (ignores duplicates). Time: O(1) average, Space: O(1).
- **Lookup/Membership**: Checking if element exists. Time: O(1) average, Space: O(1).
- **Deletion**: Removing elements. Time: O(1) average, Space: O(1).
- **Union/Intersection/Difference**: Combining sets. Time: O(n + m), Space: O(n + m).
- **Iteration/Counting Uniques**: Traversing or counting unique items. Time: O(n), Space: O(1).
EOF

read -r -d '' TUPLES_NOTES << 'EOF'
# Tuples

Tuples are immutable, ordered collections in Python, similar to lists but cannot be modified after creation. Useful for fixed data, return multiple values, or as keys in maps (since immutable). Operations are limited due to immutability.

## Key Operations
- **Creation/Access**: Creating and accessing elements. Time: O(1) access, O(n) creation; Space: O(n).
- **Iteration**: Looping through elements. Time: O(n), Space: O(1).
- **Packing/Unpacking**: Bundling/unbundling values. Time: O(n), Space: O(1).
- **Comparison/Sorting**: Comparing or sorting tuples. Time: O(n log n) for list of tuples, O(1) compare; Space: O(1).
- **Use as Keys**: In maps for composite keys. Time: O(1) average in hashmap, Space: O(1).
EOF

read -r -d '' LINKED_LISTS_NOTES << 'EOF'
# Linked Lists

Linked lists are linear collections where each node points to the next, allowing O(1) insertion/deletion but O(n) access. In Python, implement with classes. Good for dynamic size, frequent insertions.

## Key Operations
- **Traversal**: Following pointers to visit nodes. Time: O(n), Space: O(1).
- **Insertion**: Adding nodes by updating pointers. Time: O(1) if position known, O(n) search; Space: O(1).
- **Deletion**: Removing nodes by updating pointers. Time: O(1) if position known, O(n) search; Space: O(1).
- **Reversal**: Reversing links. Time: O(n), Space: O(1).
- **Merging**: Combining lists. Time: O(n + m), Space: O(1).
EOF

read -r -d '' STACKS_NOTES << 'EOF'
# Stacks

Stacks are LIFO collections with O(1) push/pop/top. In Python, use list with append/pop. Useful for undoing, parentheses matching, monotonic patterns.

## Key Operations
- **Push**: Add to top. Time: O(1), Space: O(1).
- **Pop**: Remove from top. Time: O(1), Space: O(1).
- **Peek/Top**: Get top without remove. Time: O(1), Space: O(1).
- **IsEmpty**: Check if empty. Time: O(1), Space: O(1).
- **Monotonic Stack**: Maintain increasing/decreasing order. Time: O(n) overall, Space: O(n).
EOF

read -r -d '' QUEUES_NOTES << 'EOF'
# Queues

Queues are FIFO collections with O(1) enqueue/dequeue. In Python, use collections.deque. Useful for BFS, level order, sliding windows.

## Key Operations
- **Enqueue**: Add to rear. Time: O(1), Space: O(1).
- **Dequeue**: Remove from front. Time: O(1), Space: O(1).
- **Peek/Front**: Get front without remove. Time: O(1), Space: O(1).
- **IsEmpty**: Check empty. Time: O(1), Space: O(1).
- **Monotonic Queue**: Maintain order for max/min in window. Time: O(n) overall, Space: O(n).
EOF

read -r -d '' TREES_NOTES << 'EOF'
# Trees

Trees are hierarchical structures with nodes having children, often binary (0-2 children). Binary Search Trees (BST) maintain order for O(log n) search. Useful for hierarchies, searching. Height h = log n balanced, n worst.

## Key Operations
- **Traversal (Inorder, Preorder, Postorder, Level Order)**: Visiting nodes. Time: O(n), Space: O(h) recursion, O(n) iterative.
- **Insertion**: Adding nodes (balanced in AVL, red-black). Time: O(h), Space: O(1).
- **Deletion**: Removing nodes, rebalancing. Time: O(h), Space: O(1).
- **Search**: Finding nodes. Time: O(h), Space: O(1).
- **Height/Diameter/Balance**: Computing properties. Time: O(n), Space: O(h).
EOF

read -r -d '' GRAPHS_NOTES << 'EOF'
# Graphs

Graphs are nodes connected by edges, can be directed/undirected, weighted. Useful for networks, paths. Operations use adjacency lists/matrices (space O(V+E) list, O(V^2) matrix).

## Key Operations
- **Traversal (BFS/DFS)**: Visiting nodes. Time: O(V + E), Space: O(V).
- **Insertion (Add Edge/Node)**: Adding connections. Time: O(1) list, O(1) matrix; Space: O(1).
- **Deletion (Remove Edge/Node)**: Removing connections. Time: O(E) list (search), O(1) matrix; Space: O(1).
- **Shortest Path**: Finding min path (Dijkstra, BFS). Time: O((V+E) log V) Dijkstra with heap, O(V+E) BFS; Space: O(V).
- **Cycle Detection**: Finding cycles. Time: O(V + E), Space: O(V).
EOF

read -r -d '' HEAPS_NOTES << 'EOF'
# Heaps

Heaps are complete binary trees for priority queues, min or max. In Python, heapq for min-heap. O(log n) insert/pop, O(1) peek.

## Key Operations
- **Heapify**: Build heap O(n). Time: O(n), Space: O(1).
- **Push/Insert**: Add element. Time: O(log n), Space: O(1).
- **Pop/Extract**: Remove root. Time: O(log n), Space: O(1).
- **Peek**: Get root. Time: O(1), Space: O(1).
- **Merge**: Combine heaps. Time: O(n + m), Space: O(n + m).
EOF

# Arrays
mkdir -p Arrays
echo "$ARRAYS_NOTES" > Arrays/README.md
mkdir -p Arrays/Traversal_Iteration
declare -A problems=(
    ["Two_Sum"]="Two Sum (LeetCode #1) - Find indices of two numbers that add to a target."
    ["Maximum_Subarray"]="Maximum Subarray (LeetCode #53) - Find contiguous subarray with largest sum."
    ["Product_of_Array_Except_Self"]="Product of Array Except Self (LeetCode #238) - Compute product of all elements except current."
    ["Best_Time_to_Buy_and_Sell_Stock"]="Best Time to Buy and Sell Stock (LeetCode #121) - Find max profit from single buy/sell."
    ["Running_Sum_of_1d_Array"]="Running Sum of 1d Array (LeetCode #1480) - Compute prefix sums."
    ["Find_the_Highest_Altitude"]="Find the Highest Altitude (LeetCode #1732) - Track cumulative sums for max value."
    ["Kids_With_the_Greatest_Number_of_Candies"]="Kids With the Greatest Number of Candies (LeetCode #1431) - Iterate to check max after addition."
    ["Richest_Customer_Wealth"]="Richest Customer Wealth (LeetCode #1672) - Sum rows and find max."
    ["Majority_Element"]="Majority Element (LeetCode #169) - Find element appearing more than n/2 times."
    ["Number_of_Good_Pairs"]="Number of Good Pairs (LeetCode #1512) - Count pairs of equal elements."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Arrays/Traversal_Iteration/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Arrays/Search
problems=(
    ["Contains_Duplicate"]="Contains Duplicate (LeetCode #217) - Check for repeated elements."
    ["Single_Number"]="Single Number (LeetCode #136) - Find non-duplicated element in array of duplicates."
    ["Intersection_of_Two_Arrays_II"]="Intersection of Two Arrays II (LeetCode #350) - Find common elements with multiplicity."
    ["Binary_Search"]="Binary Search (LeetCode #704) - Search in sorted array."
    ["Find_Minimum_in_Rotated_Sorted_Array"]="Find Minimum in Rotated Sorted Array (LeetCode #153) - Search in rotated sorted array."
    ["Search_in_Rotated_Sorted_Array"]="Search in Rotated Sorted Array (LeetCode #33) - Find target in rotated array."
    ["Palindrome_Number"]="Palindrome Number (LeetCode #9) - Check if number is palindrome (treat as array of digits)."
    ["How_Many_Numbers_Are_Smaller_Than_the_Current_Number"]="How Many Numbers Are Smaller Than the Current Number (LeetCode #1365) - Count smaller for each."
    ["Find_the_Duplicate_Number"]="Find the Duplicate Number (LeetCode #287) - Find duplicate in array with constraints."
    ["Missing_Number"]="Missing Number (LeetCode #268) - Find missing number in 0 to n range."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Arrays/Search/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Arrays/Insertion_Deletion
problems=(
    ["Remove_Duplicates_from_Sorted_Array"]="Remove Duplicates from Sorted Array (LeetCode #26) - Remove duplicates in-place."
    ["Remove_Element"]="Remove Element (LeetCode #27) - Remove all occurrences of a value in-place."
    ["Move_Zeroes"]="Move Zeroes (LeetCode #283) - Move zeros to end while maintaining order."
    ["Insert_Delete_GetRandom_O1"]="Insert Delete GetRandom O(1) (LeetCode #380) - Design set with random access."
    ["Plus_One"]="Plus One (LeetCode #66) - Increment array as number."
    ["Remove_Duplicates_from_Sorted_Array_II"]="Remove Duplicates from Sorted Array II (LeetCode #80) - Allow up to two duplicates."
    ["Shuffle_the_Array"]="Shuffle the Array (LeetCode #1470) - Interleave two halves."
    ["Insert_Interval"]="Insert Interval (LeetCode #57) - Insert and merge interval."
    ["Merge_Intervals"]="Merge Intervals (LeetCode #56) - Merge overlapping intervals (involves sorting then insertion logic)."
    ["Rotate_Array"]="Rotate Array (LeetCode #189) - Rotate elements by k steps."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Arrays/Insertion_Deletion/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Arrays/Sorting_Merging
problems=(
    ["Sort_Colors"]="Sort Colors (LeetCode #75) - Sort 0s, 1s, 2s in-place."
    ["Merge_Sorted_Array"]="Merge Sorted Array (LeetCode #88) - Merge two sorted arrays."
    ["K_Closest_Points_to_Origin"]="K Closest Points to Origin (LeetCode #973) - Sort by distance."
    ["Heap_Sort"]="Heap Sort (implement via problems like Kth Largest Element in an Array #215)."
    ["Sort_an_Array"]="Sort an Array (LeetCode #912) - Implement sorting."
    ["Largest_Number"]="Largest Number (LeetCode #179) - Sort to form largest number from array."
    ["Merge_k_Sorted_Lists"]="Merge k Sorted Lists (LeetCode #23) - Merge multiple sorted arrays/lists."
    ["Sort_Characters_By_Frequency"]="Sort Characters By Frequency (LeetCode #451) - Sort by count."
    ["Kth_Smallest_Element_in_a_Sorted_Matrix"]="Kth Smallest Element in a Sorted Matrix (LeetCode #378) - Use sorting or heap."
    ["Find_K_Pairs_with_Smallest_Sums"]="Find K Pairs with Smallest Sums (LeetCode #373) - Sorted pairs using heap/sort."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Arrays/Sorting_Merging/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Arrays/Subarray_Operations
problems=(
    ["Subarray_Sum_Equals_K"]="Subarray Sum Equals K (LeetCode #560) - Find subarrays summing to k."
    ["Longest_Consecutive_Sequence"]="Longest Consecutive Sequence (LeetCode #128) - Find longest consecutive subarray."
    ["Maximum_Product_Subarray"]="Maximum Product Subarray (LeetCode #152) - Max product contiguous subarray."
    ["Find_All_Anagrams_in_a_String"]="Find All Anagrams in a String (LeetCode #438) - Sliding window for subarrays."
    ["Minimum_Window_Substring"]="Minimum Window Substring (LeetCode #76) - Smallest subarray containing characters."
    ["Sliding_Window_Maximum"]="Sliding Window Maximum (LeetCode #239) - Max in k-sized windows."
    ["Subarray_Product_Less_Than_K"]="Subarray Product Less Than K (LeetCode #713) - Count subarrays with product < k."
    ["Longest_Substring_Without_Repeating_Characters"]="Longest Substring Without Repeating Characters (LeetCode #3) - Longest unique subarray."
    ["Contiguous_Array"]="Contiguous Array (LeetCode #525) - Max length subarray with equal 0s/1s."
    ["Maximum_Sum_Circular_Subarray"]="Maximum Sum Circular Subarray (LeetCode #918) - Max sum in circular array."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Arrays/Subarray_Operations/$problem" "${problem//_/ }" "${problems[$problem]}"
done

# Strings
mkdir -p Strings
echo "$STRINGS_NOTES" > Strings/README.md
mkdir -p Strings/Traversal_Concatenation
problems=(
    ["Reverse_String"]="Reverse String (LeetCode #344) - Reverse characters in-place."
    ["Longest_Common_Prefix"]="Longest Common Prefix (LeetCode #14) - Find common prefix in array of strings."
    ["Goal_Parser_Interpretation"]="Goal Parser Interpretation (LeetCode #1678) - Interpret string patterns."
    ["Defanging_an_IP_Address"]="Defanging an IP Address (LeetCode #1108) - Replace periods with [.] ."
    ["Shuffle_String"]="Shuffle String (LeetCode #1528) - Rearrange based on indices."
    ["Jewels_and_Stones"]="Jewels and Stones (LeetCode #771) - Count jewels in stones."
    ["Merge_Strings_Alternately"]="Merge Strings Alternately (LeetCode #1768) - Alternate characters from two strings."
    ["Reverse_Vowels_of_a_String"]="Reverse Vowels of a String (LeetCode #345) - Reverse only vowels."
    ["Make_The_String_Great"]="Make The String Great (LeetCode #1544) - Remove bad adjacent pairs."
    ["Score_of_Parentheses"]="Score of Parentheses (LeetCode #856) - Compute score based on nesting."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Strings/Traversal_Concatenation/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Strings/Search_Substring
problems=(
    ["Implement_strStr"]="Implement strStr (LeetCode #28) - Find index of substring."
    ["Longest_Substring_Without_Repeating_Characters"]="Longest Substring Without Repeating Characters (LeetCode #3) - Find longest unique substring."
    ["Minimum_Window_Substring"]="Minimum Window Substring (LeetCode #76) - Smallest window containing characters."
    ["Find_All_Anagrams_in_a_String"]="Find All Anagrams in a String (LeetCode #438) - Find all anagram starting indices."
    ["String_to_Integer_atoi"]="String to Integer (atoi) (LeetCode #8) - Convert string to int, handling edges."
    ["Valid_Anagram"]="Valid Anagram (LeetCode #242) - Check if two strings are anagrams."
    ["Group_Anagrams"]="Group Anagrams (LeetCode #49) - Group strings by anagram."
    ["Longest_Palindromic_Substring"]="Longest Palindromic Substring (LeetCode #5) - Find longest palindrome substring."
    ["Split_a_String_in_Balanced_Strings"]="Split a String in Balanced Strings (LeetCode #1221) - Count balanced substrings."
    ["First_Unique_Character_in_a_String"]="First Unique Character in a String (LeetCode #387) - Find index of first non-repeating char."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Strings/Search_Substring/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Strings/Replacement_Modification
problems=(
    ["Remove_All_Adjacent_Duplicates_In_String"]="Remove All Adjacent Duplicates In String (LeetCode #1047) - Remove duplicate pairs."
    ["Replace_Words"]="Replace Words (LeetCode #648) - Replace with prefixes from dictionary."
    ["Remove_All_Adjacent_Duplicates_in_String_II"]="Remove All Adjacent Duplicates in String II (LeetCode #1209) - Remove k duplicates."
    ["Simplify_Path"]="Simplify Path (LeetCode #71) - Simplify Unix path string."
    ["Reverse_Words_in_a_String"]="Reverse Words in a String (LeetCode #151) - Reverse word order."
    ["Basic_Calculator_II"]="Basic Calculator II (LeetCode #227) - Evaluate string expression."
    ["Decode_String"]="Decode String (LeetCode #394) - Decode encoded string with repeats."
    ["Valid_Parentheses"]="Valid Parentheses (LeetCode #20) - Check balanced parentheses (modification via stack)."
    ["Longest_Palindromic_Subsequence"]="Longest Palindromic Subsequence (LeetCode #516) - Find longest palindrome subsequence."
    ["Generate_Parentheses"]="Generate Parentheses (LeetCode #22) - Generate valid parenthesis combinations."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Strings/Replacement_Modification/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Strings/Sorting_Counting
problems=(
    ["Sort_Characters_By_Frequency"]="Sort Characters By Frequency (LeetCode #451) - Sort by frequency."
    ["Reorganize_String"]="Reorganize String (LeetCode #767) - Rearrange so no two same characters adjacent."
    ["Custom_Sort_String"]="Custom Sort String (LeetCode #791) - Sort based on custom order."
    ["Top_K_Frequent_Words"]="Top K Frequent Words (LeetCode #692) - Find top k frequent words."
    ["Sort_the_People"]="Sort the People (LeetCode #2418) - Sort names by heights."
    ["Frequency_of_the_Most_Frequent_Element"]="Frequency of the Most Frequent Element (LeetCode #1838) - Max frequency after k operations."
    ["Sort_Array_By_Parity"]="Sort Array By Parity (LeetCode #905) - Sort even/odd."
    ["Longest_String_Chain"]="Longest String Chain (LeetCode #1048) - Find longest chain by deleting chars."
    ["Count_Sorted_Vowel_Strings"]="Count Sorted Vowel Strings (LeetCode #1641) - Count strings with sorted vowels."
    ["Sort_the_Matrix_Diagonally"]="Sort the Matrix Diagonally (LeetCode #1329) - Sort diagonals."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Strings/Sorting_Counting/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Strings/Palindrome_Anagram_Checks
problems=(
    ["Valid_Palindrome"]="Valid Palindrome (LeetCode #125) - Check if palindrome ignoring non-alphanum."
    ["Palindrome_Linked_List"]="Palindrome Linked List (LeetCode #234) - Check if linked list is palindrome (string-like)."
    ["Palindromic_Substrings"]="Palindromic Substrings (LeetCode #647) - Count palindromic substrings."
    ["Longest_Palindromic_Substring"]="Longest Palindromic Substring (LeetCode #5) - Find longest."
    ["Palindrome_Pairs"]="Palindrome Pairs (LeetCode #336) - Find pairs forming palindrome."
    ["Valid_Anagram"]="Valid Anagram (LeetCode #242) - Check anagram."
    ["Group_Anagrams"]="Group Anagrams (LeetCode #49) - Group by anagram."
    ["Find_All_Anagrams_in_a_String"]="Find All Anagrams in a String (LeetCode #438) - Find anagram positions."
    ["Palindrome_Number"]="Palindrome Number (LeetCode #9) - Check number palindrome."
    ["Break_a_Palindrome"]="Break a Palindrome (LeetCode #1328) - Make smallest non-palindrome by changing one char."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Strings/Palindrome_Anagram_Checks/$problem" "${problem//_/ }" "${problems[$problem]}"
done

# Hash Map
mkdir -p Hash_Map
echo "$HASH_MAP_NOTES" > Hash_Map/README.md
mkdir -p Hash_Map/Insertion
problems=(
    ["Design_HashMap"]="Design HashMap (LeetCode #706) - Implement hash map operations."
    ["Insert_Delete_GetRandom_O1"]="Insert Delete GetRandom O(1) (LeetCode #380) - Set with random get."
    ["LRU_Cache"]="LRU Cache (LeetCode #146) - Implement cache with insertion order."
    ["All_Oone_Inc_Dec_GetMaxKey_GetMinKey"]="All O\`one Inc/Dec/GetMaxKey/GetMinKey (LeetCode #432) - Key frequency map."
    ["LFU_Cache"]="LFU Cache (LeetCode #460) - Least frequently used cache."
    ["Insert_into_a_Sorted_Circular_Linked_List"]="Insert into a Sorted Circular Linked List (LeetCode #708) - Insert into sorted list (map for tracking)."
    ["Design_Underground_System"]="Design Underground System (LeetCode #1396) - Track check-in/out with maps."
    ["Design_Twitter"]="Design Twitter (LeetCode #355) - Post and feed with maps."
    ["Design_In_Memory_File_System"]="Design In-Memory File System (LeetCode #588) - File tree with maps."
    ["Design_Skiplist"]="Design Skiplist (LeetCode #1206) - Skip list with map-like access."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Hash_Map/Insertion/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Hash_Map/Lookup_Search
problems=(
    ["Two_Sum"]="Two Sum (LeetCode #1) - Find pair summing to target using map."
    ["Contains_Duplicate"]="Contains Duplicate (LeetCode #217) - Check duplicates with map."
    ["First_Unique_Character_in_a_String"]="First Unique Character in a String (LeetCode #387) - Find with frequency map."
    ["Intersection_of_Two_Arrays"]="Intersection of Two Arrays (LeetCode #349) - Find common using map."
    ["Happy_Number"]="Happy Number (LeetCode #202) - Detect cycle with seen map."
    ["Isomorphic_Strings"]="Isomorphic Strings (LeetCode #205) - Check mapping with two maps."
    ["Word_Pattern"]="Word Pattern (LeetCode #290) - Pattern mapping with map."
    ["Valid_Sudoku"]="Valid Sudoku (LeetCode #36) - Check uniqueness with maps."
    ["Find_the_Difference"]="Find the Difference (LeetCode #389) - Find added char with map."
    ["Unique_Occurrences"]="Unique Occurrences (LeetCode #1207) - Check unique frequencies with map."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Hash_Map/Lookup_Search/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Hash_Map/Deletion
problems=(
    ["Remove_Duplicates_from_Sorted_List"]="Remove Duplicates from Sorted List (LeetCode #83) - Delete duplicates (map for seen)."
    ["Delete_Node_in_a_Linked_List"]="Delete Node in a Linked List (LeetCode #237) - Delete given node (map-like tracking)."
    ["Remove_All_Adjacent_Duplicates_in_String"]="Remove All Adjacent Duplicates in String (LeetCode #1047) - Delete duplicates (map for count)."
    ["Design_HashSet"]="Design HashSet (LeetCode #705) - Implement set with delete."
    ["Delete_the_Middle_Node_of_a_Linked_List"]="Delete the Middle Node of a Linked List (LeetCode #2095) - Delete middle."
    ["Delete_Nodes_From_Linked_List_Present_in_Array"]="Delete Nodes From Linked List Present in Array (LeetCode #3217) - Delete based on array (map for check)."
    ["Delete_Operation_for_Two_Strings"]="Delete Operation for Two Strings (LeetCode #583) - Min deletes to make equal."
    ["Delete_Characters_to_Make_Fancy_String"]="Delete Characters to Make Fancy String (LeetCode #1958) - Delete to avoid three consecutive."
    ["Delete_and_Earn"]="Delete and Earn (LeetCode #740) - Max points by deleting numbers."
    ["Delete_Leaves_With_a_Given_Value"]="Delete Leaves With a Given Value (LeetCode #1325) - Delete tree leaves with value."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Hash_Map/Deletion/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Hash_Map/Iteration_Counting
problems=(
    ["Top_K_Frequent_Elements"]="Top K Frequent Elements (LeetCode #347) - Find top k frequent."
    ["Majority_Element"]="Majority Element (LeetCode #169) - Find majority."
    ["Valid_Anagram"]="Valid Anagram (LeetCode #242) - Count frequencies to check anagram."
    ["Group_Anagrams"]="Group Anagrams (LeetCode #49) - Group by frequency signature."
    ["Jewels_and_Stones"]="Jewels and Stones (LeetCode #771) - Count occurrences."
    ["Unique_Number_of_Occurrences"]="Unique Number of Occurrences (LeetCode #1207) - Check unique counts."
    ["Ransom_Note"]="Ransom Note (LeetCode #383) - Check if can construct from magazine."
    ["Sort_Characters_By_Frequency"]="Sort Characters By Frequency (LeetCode #451) - Sort by count."
    ["Task_Scheduler"]="Task Scheduler (LeetCode #621) - Schedule tasks with cooldown."
    ["Determine_if_Two_Strings_Are_Close"]="Determine if Two Strings Are Close (LeetCode #1657) - Check if can transform by swap/sort."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Hash_Map/Iteration_Counting/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Hash_Map/Grouping_Mapping
problems=(
    ["Group_Anagrams"]="Group Anagrams (LeetCode #49) - Group strings by sorted key."
    ["Sort_the_People"]="Sort the People (LeetCode #2418) - Group and sort by height."
    ["Find_Players_With_Zero_or_One_Losses"]="Find Players With Zero or One Losses (LeetCode #2225) - Group by loss count."
    ["Brick_Wall"]="Brick Wall (LeetCode #554) - Group edge positions."
    ["Group_Sold_Products_By_The_Date"]="Group Sold Products By The Date (SQL LeetCode #1484) - Group by date (map-like)."
    ["Group_Shifted_Strings"]="Group Shifted Strings (LeetCode #249) - Group by shift pattern."
    ["Find_Duplicate_File_in_System"]="Find Duplicate File in System (LeetCode #609) - Group by content."
    ["Subdomain_Visit_Count"]="Subdomain Visit Count (LeetCode #811) - Group subdomain visits."
    ["Accounts_Merge"]="Accounts Merge (LeetCode #721) - Merge accounts by emails."
    ["Group_the_People_Given_the_Group_Size_They_Belong_To"]="Group the People Given the Group Size They Belong To (LeetCode #1282) - Group by size."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Hash_Map/Grouping_Mapping/$problem" "${problem//_/ }" "${problems[$problem]}"
done

# Sets
mkdir -p Sets
echo "$SETS_NOTES" > Sets/README.md
mkdir -p Sets/Insertion
problems=(
    ["Design_HashSet"]="Design HashSet (LeetCode #705) - Implement set operations."
    ["Insert_Delete_GetRandom_O1"]="Insert Delete GetRandom O(1) (LeetCode #380) - Set with random."
    ["My_HashSet"]="My HashSet (implement via problems like Contains Duplicate)."
    ["Add_and_Search_Word"]="Add and Search Word (LeetCode #211) - Trie with set-like insertion."
    ["Design_Phone_Directory"]="Design Phone Directory (LeetCode #379) - Set for available numbers."
    ["Insert_into_a_Sorted_Circular_Linked_List"]="Insert into a Sorted Circular Linked List (LeetCode #708) - Use set for uniqueness."
    ["Logger_Rate_Limiter"]="Logger Rate Limiter (LeetCode #359) - Set for timestamps."
    ["Design_a_Set_for_Tweets"]="Design a Set for Tweets (like Twitter, use set for users)."
    ["Add_Bold_Tag_in_String"]="Add Bold Tag in String (LeetCode #616) - Set for words to bold."
    ["Set_Mismatch"]="Set Mismatch (LeetCode #645) - Find error numbers using set."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Sets/Insertion/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Sets/Lookup_Membership
problems=(
    ["Contains_Duplicate"]="Contains Duplicate (LeetCode #217) - Check if duplicates using set."
    ["Jewels_and_Stones"]="Jewels and Stones (LeetCode #771) - Check membership in jewels set."
    ["Happy_Number"]="Happy Number (LeetCode #202) - Detect cycle with seen set."
    ["Single_Number"]="Single Number (LeetCode #136) - Find unique using set or XOR."
    ["Word_Break"]="Word Break (LeetCode #139) - Check substrings in word set."
    ["Longest_Consecutive_Sequence"]="Longest Consecutive Sequence (LeetCode #128) - Check consecutive in set."
    ["Valid_Sudoku"]="Valid Sudoku (LeetCode #36) - Use sets for uniqueness in rows/columns."
    ["Check_if_N_and_Its_Double_Exist"]="Check if N and Its Double Exist (LeetCode #1346) - Check double in set."
    ["Check_If_a_String_Contains_All_Binary_Codes_of_Size_K"]="Check If a String Contains All Binary Codes of Size K (LeetCode #1461) - Set of substrings."
    ["Contains_Duplicate_II"]="Contains Duplicate II (LeetCode #219) - Check duplicate within k distance."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Sets/Lookup_Membership/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Sets/Deletion
problems=(
    ["Remove_Duplicate_Letters"]="Remove Duplicate Letters (LeetCode #316) - Remove to make smallest lexicographical."
    ["Remove_Invalid_Parentheses"]="Remove Invalid Parentheses (LeetCode #301) - Remove to make valid."
    ["Remove_All_Adjacent_Duplicates_in_String_II"]="Remove All Adjacent Duplicates in String II (LeetCode #1209) - Remove k duplicates."
    ["Delete_Operation_for_Two_Strings"]="Delete Operation for Two Strings (LeetCode #583) - Min deletes for equality."
    ["Delete_and_Earn"]="Delete and Earn (LeetCode #740) - Delete numbers for max points."
    ["Delete_Columns_to_Make_Sorted"]="Delete Columns to Make Sorted (LeetCode #944) - Delete non-sorted columns."
    ["Delete_Greatest_Value_in_Each_Row"]="Delete Greatest Value in Each Row (LeetCode #2500) - Delete max per row."
    ["Delete_Leaves_With_a_Given_Value"]="Delete Leaves With a Given Value (LeetCode #1325) - Delete tree leaves."
    ["Delete_Characters_to_Make_Fancy_String"]="Delete Characters to Make Fancy String (LeetCode #1958) - Delete to avoid three same."
    ["Delete_Duplicate_Folders_in_System"]="Delete Duplicate Folders in System (LeetCode #1948) - Delete duplicate subtrees."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Sets/Deletion/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Sets/Union_Intersection_Difference
problems=(
    ["Intersection_of_Two_Arrays"]="Intersection of Two Arrays (LeetCode #349) - Find intersection."
    ["Intersection_of_Two_Arrays_II"]="Intersection of Two Arrays II (LeetCode #350) - With multiplicity."
    ["Union_of_Two_Arrays"]="Union of Two Arrays - Find union (from GFG, similar to LeetCode)."
    ["Find_the_Difference_of_Two_Arrays"]="Find the Difference of Two Arrays (LeetCode #2215) - Symmetric difference."
    ["Set_Intersection_Size_At_Least_Two"]="Set Intersection Size At Least Two (LeetCode #757) - Interval intersection."
    ["Unique_Email_Addresses"]="Unique Email Addresses (LeetCode #929) - Union of normalized emails."
    ["Intersection_of_Multiple_Arrays"]="Intersection of Multiple Arrays (LeetCode #2248) - Common in all."
    ["Find_Common_Characters"]="Find Common Characters (LeetCode #1002) - Intersection of chars in strings."
    ["Set_Mismatch"]="Set Mismatch (LeetCode #645) - Find difference in expected set."
    ["Find_the_Difference"]="Find the Difference (LeetCode #389) - Find added char (difference)."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Sets/Union_Intersection_Difference/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Sets/Iteration_Counting_Uniques
problems=(
    ["Longest_Consecutive_Sequence"]="Longest Consecutive Sequence (LeetCode #128) - Count consecutive uniques."
    ["Unique_Number_of_Occurrences"]="Unique Number of Occurrences (LeetCode #1207) - Check unique frequencies."
    ["First_Unique_Character_in_a_String"]="First Unique Character in a String (LeetCode #387) - Find first unique."
    ["Single_Number"]="Single Number (LeetCode #136) - Find unique in duplicates."
    ["Single_Number_II"]="Single Number II (LeetCode #137) - Unique with triples."
    ["Unique_Paths"]="Unique Paths (LeetCode #62) - Count unique paths (set for visited in variants)."
    ["Unique_Binary_Search_Trees"]="Unique Binary Search Trees (LeetCode #96) - Count unique BSTs."
    ["Number_of_Unique_Good_Subsequences"]="Number of Unique Good Subsequences (LeetCode #1987) - Count unique subsequences."
    ["Number_of_Unique_Flavors_After_Sharing"]="Number of Unique Flavors After Sharing (LeetCode #2424) - Unique after range."
    ["Unique_Length_3_Palindromic_Subsequences"]="Unique Length-3 Palindromic Subsequences (LeetCode #1930) - Count unique palindromic."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Sets/Iteration_Counting_Uniques/$problem" "${problem//_/ }" "${problems[$problem]}"
done

# Tuples
mkdir -p Tuples
echo "$TUPLES_NOTES" > Tuples/README.md
mkdir -p Tuples/Creation_Access
problems=(
    ["Tuple_with_Same_Product"]="Tuple with Same Product (LeetCode #1726) - Count tuples with same product."
    ["Combination_Sum"]="Combination Sum (LeetCode #39) - Find combinations summing to target (return as tuples)."
    ["K_Closest_Points_to_Origin"]="K Closest Points to Origin (LeetCode #973) - Return k closest (tuples of coordinates)."
    ["Kth_Smallest_Element_in_a_Sorted_Matrix"]="Kth Smallest Element in a Sorted Matrix (LeetCode #378) - Use tuples for positions."
    ["Find_K_Pairs_with_Smallest_Sums"]="Find K Pairs with Smallest Sums (LeetCode #373) - Return pairs as tuples."
    ["Accounts_Merge"]="Accounts Merge (LeetCode #721) - Merge with email tuples."
    ["Expressive_Words"]="Expressive Words (LeetCode #809) - Use tuples for grouped characters."
    ["Python_Tuples_HackerRank"]="Python Tuples HackerRank - Create tuple from input."
    ["Majority_Element_II"]="Majority Element II (LeetCode #229) - Find elements > n/3 (tuples in counts)."
    ["Find_Original_Array_From_Doubled_Array"]="Find Original Array From Doubled Array (LeetCode #2007) - Reconstruct using pairs (tuple-like)."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Tuples/Creation_Access/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Tuples/Iteration
problems=(
    ["Tuple_with_Same_Product"]="Tuple with Same Product (LeetCode #1726) - Iterate to find pairs."
    ["3Sum"]="3Sum (LeetCode #15) - Find unique triplets summing to 0 (return as tuples)."
    ["4Sum"]="4Sum (LeetCode #18) - Find quadruplets summing to target."
    ["K_Sum_Pairs"]="K Sum Pairs - Generalize to k tuples."
    ["Number_of_Arithmetic_Triplets"]="Number of Arithmetic Triplets (LeetCode #2367) - Count triplets with difference."
    ["Number_of_Good_Paths"]="Number of Good Paths (LeetCode #2421) - Count paths in tree (tuple edges)."
    ["Tuple_unpacking_in_Python"]="Tuple unpacking in Python for LeetCode problems like Combination Sum."
    ["Palindrome_Pairs"]="Palindrome Pairs (LeetCode #336) - Pairs forming palindrome."
    ["Number_of_Pairs_of_Interchangeable_Rectangles"]="Number of Pairs of Interchangeable Rectangles (LeetCode #2001) - Count tuple ratios."
    ["Equal_Row_and_Column_Pairs"]="Equal Row and Column Pairs (LeetCode #2352) - Count equal row/column tuples."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Tuples/Iteration/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Tuples/Packing_Unpacking
problems=(
    ["Python_Tuples_HackerRank"]="Python Tuples HackerRank - Pack integers into tuple."
    ["Return_multiple_values_from_function"]="Return multiple values from function (common in LeetCode like Min Stack getMin)."
    ["Combination_Sum"]="Combination Sum (LeetCode #39) - Unpack in recursion."
    ["Tuple_unpacking_in_loops"]="Tuple unpacking in loops for problems like Two Sum return (index1, index2)."
    ["Zip_function_with_tuples"]="Zip function with tuples in problems like Transpose Matrix (LeetCode #867)."
    ["Namedtuple_in_collections"]="Namedtuple in collections for structured data in problems like Employee Importance (LeetCode #690)."
    ["Unpacking_in_DFS_BFS"]="Unpacking in DFS/BFS for graph nodes (x, y) coordinates."
    ["Return_tuple_in_functions"]="Return tuple in functions for problems like Find Center of Star Graph (LeetCode #1791)."
    ["Use_tuples_in_sorted"]="Use tuples in sorted for custom sort key."
    ["Tuple_in_heap"]="Tuple in heap for priority (priority, value)."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Tuples/Packing_Unpacking/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Tuples/Comparison_Sorting
problems=(
    ["Sort_List_of_Tuples"]="Sort List of Tuples - Common in problems like Merge Intervals (sort by start)."
    ["K_Closest_Points_to_Origin"]="K Closest Points to Origin (LeetCode #973) - Sort tuples by distance."
    ["Top_K_Frequent_Elements"]="Top K Frequent Elements (LeetCode #347) - Sort frequency tuples."
    ["Sort_Characters_By_Frequency"]="Sort Characters By Frequency (LeetCode #451) - Sort (char, count) tuples."
    ["Reorganize_String"]="Reorganize String (LeetCode #767) - Sort by count tuples."
    ["Custom_Sort_String"]="Custom Sort String (LeetCode #791) - Sort using order map, tuples for index."
    ["Largest_Number"]="Largest Number (LeetCode #179) - Sort strings with custom comparator (tuple-like)."
    ["Sort_the_Matrix_Diagonally"]="Sort the Matrix Diagonally (LeetCode #1329) - Sort diagonal tuples."
    ["Sort_Items_by_Groups_Respecting_Dependencies"]="Sort Items by Groups Respecting Dependencies (LeetCode #1203) - Topo sort with groups."
    ["Sort_Array_by_Increasing_Frequency"]="Sort Array by Increasing Frequency (LeetCode #1636) - Sort by frequency tuples."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Tuples/Comparison_Sorting/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Tuples/Use_as_Keys
problems=(
    ["Tuple_with_Same_Product"]="Tuple with Same Product (LeetCode #1726) - Use (a, b) as key for count."
    ["Group_Anagrams"]="Group Anagrams (LeetCode #49) - Use sorted tuple as key."
    ["Number_of_Boomerangs"]="Number of Boomerangs (LeetCode #447) - Use distance tuples as key."
    ["Equal_Row_and_Column_Pairs"]="Equal Row and Column Pairs (LeetCode #2352) - Use row tuples as keys."
    ["Number_of_Pairs_of_Interchangeable_Rectangles"]="Number of Pairs of Interchangeable Rectangles (LeetCode #2001) - Ratio tuples as keys."
    ["Max_Points_on_a_Line"]="Max Points on a Line (LeetCode #149) - Slope tuples as keys."
    ["Group_Shifted_Strings"]="Group Shifted Strings (LeetCode #249) - Shift tuple as key."
    ["Delete_Duplicate_Folders_in_System"]="Delete Duplicate Folders in System (LeetCode #1948) - Subtree tuples as keys."
    ["Find_Duplicate_Subtrees"]="Find Duplicate Subtrees (LeetCode #652) - Serialize to tuple keys."
    ["Tuple_unpacking_and_keys_in_dict"]="Tuple unpacking and keys in dict for problems like Number of Arithmetic Triplets."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Tuples/Use_as_Keys/$problem" "${problem//_/ }" "${problems[$problem]}"
done

# Linked Lists
mkdir -p Linked_Lists
echo "$LINKED_LISTS_NOTES" > Linked_Lists/README.md
mkdir -p Linked_Lists/Traversal
problems=(
    ["Middle_of_the_Linked_List"]="Middle of the Linked List (LeetCode #876) - Find middle node."
    ["Linked_List_Cycle"]="Linked List Cycle (LeetCode #141) - Detect cycle."
    ["Palindrome_Linked_List"]="Palindrome Linked List (LeetCode #234) - Check if palindrome."
    ["Maximum_Twin_Sum_of_a_Linked_List"]="Maximum Twin Sum of a Linked List (LeetCode #2130) - Max sum of twin nodes."
    ["Odd_Even_Linked_List"]="Odd Even Linked List (LeetCode #328) - Group odd/even indices."
    ["Find_the_Minimum_and_Maximum_Number_of_Nodes_Between_Critical_Points"]="Find the Minimum and Maximum Number of Nodes Between Critical Points (LeetCode #2058) - Find distances."
    ["Design_Linked_List"]="Design Linked List (LeetCode #707) - Implement with traversal."
    ["Intersection_of_Two_Linked_Lists"]="Intersection of Two Linked Lists (LeetCode #160) - Find intersection node."
    ["Linked_List_Random_Node"]="Linked List Random Node (LeetCode #382) - Get random node."
    ["Swapping_Nodes_in_a_Linked_List"]="Swapping Nodes in a Linked List (LeetCode #1721) - Swap kth from ends."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Linked_Lists/Traversal/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Linked_Lists/Insertion
problems=(
    ["Merge_Two_Sorted_Lists"]="Merge Two Sorted Lists (LeetCode #21) - Insert while merging."
    ["Add_Two_Numbers"]="Add Two Numbers (LeetCode #2) - Insert sum digits."
    ["Insert_Greatest_Common_Divisors_in_Linked_List"]="Insert Greatest Common Divisors in Linked List (LeetCode #2807) - Insert GCD between nodes."
    ["Swap_Nodes_in_Pairs"]="Swap Nodes in Pairs (LeetCode #24) - Insert/swaps pairs."
    ["Sort_List"]="Sort List (LeetCode #148) - Sort with insertion/merge."
    ["Reorder_List"]="Reorder List (LeetCode #143) - Reorder by inserting."
    ["Insert_into_a_Sorted_Circular_Linked_List"]="Insert into a Sorted Circular Linked List (LeetCode #708) - Insert in sorted circular."
    ["Merge_K_Sorted_Lists"]="Merge K Sorted Lists (LeetCode #23) - Insert while merging k lists."
    ["Rotate_List"]="Rotate List (LeetCode #61) - Rotate by k (insert-like shift)."
    ["Partition_List"]="Partition List (LeetCode #86) - Partition around value (insert into two lists)."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Linked_Lists/Insertion/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Linked_Lists/Deletion
problems=(
    ["Remove_Nth_Node_From_End_of_List"]="Remove Nth Node From End of List (LeetCode #19) - Delete nth from end."
    ["Remove_Linked_List_Elements"]="Remove Linked List Elements (LeetCode #203) - Delete nodes with value."
    ["Delete_Node_in_a_Linked_List"]="Delete Node in a Linked List (LeetCode #237) - Delete given node."
    ["Remove_Duplicates_from_Sorted_List"]="Remove Duplicates from Sorted List (LeetCode #83) - Delete duplicates."
    ["Remove_Duplicates_from_Sorted_List_II"]="Remove Duplicates from Sorted List II (LeetCode #82) - Delete all duplicates."
    ["Delete_the_Middle_Node_of_a_Linked_List"]="Delete the Middle Node of a Linked List (LeetCode #2095) - Delete middle."
    ["Delete_Nodes_From_Linked_List_Present_in_Array"]="Delete Nodes From Linked List Present in Array (LeetCode #3217) - Delete matching array."
    ["Remove_Zero_Sum_Consecutive_Nodes_from_Linked_List"]="Remove Zero Sum Consecutive Nodes from Linked List (LeetCode #1171) - Delete zero sum sublists."
    ["Remove_Nodes_From_Linked_List"]="Remove Nodes From Linked List (LeetCode #2487) - Delete non-increasing."
    ["Delete_N_Nodes_After_M_Nodes_of_a_Linked_List"]="Delete N Nodes After M Nodes of a Linked List (LeetCode #1474) - Delete n after m."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Linked_Lists/Deletion/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Linked_Lists/Reversal
problems=(
    ["Reverse_Linked_List"]="Reverse Linked List (LeetCode #206) - Reverse entire list."
    ["Reverse_Linked_List_II"]="Reverse Linked List II (LeetCode #92) - Reverse from m to n."
    ["Reverse_Nodes_in_k_Group"]="Reverse Nodes in k-Group (LeetCode #25) - Reverse every k nodes."
    ["Palindrome_Linked_List"]="Palindrome Linked List (LeetCode #234) - Use reversal to check."
    ["Reorder_List"]="Reorder List (LeetCode #143) - Reorder using reversal."
    ["Rotate_List"]="Rotate List (LeetCode #61) - Rotate (reverse-like)."
    ["Swap_Nodes_in_Pairs"]="Swap Nodes in Pairs (LeetCode #24) - Reverse pairs."
    ["Odd_Even_Linked_List"]="Odd Even Linked List (LeetCode #328) - Group then reverse if needed."
    ["Reverse_Even_Length_Groups"]="Reverse Even Length Groups (LeetCode #2074) - Reverse even groups."
    ["Swapping_Nodes_in_a_Linked_List"]="Swapping Nodes in a Linked List (LeetCode #1721) - Swap with reversal aid."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Linked_Lists/Reversal/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Linked_Lists/Merging
problems=(
    ["Merge_Two_Sorted_Lists"]="Merge Two Sorted Lists (LeetCode #21) - Merge two."
    ["Merge_K_Sorted_Lists"]="Merge K Sorted Lists (LeetCode #23) - Merge k lists."
    ["Sort_List"]="Sort List (LeetCode #148) - Merge sort on list."
    ["Partition_List"]="Partition List (LeetCode #86) - Merge two partitions."
    ["Reorder_List"]="Reorder List (LeetCode #143) - Merge with reversal."
    ["Add_Two_Numbers"]="Add Two Numbers (LeetCode #2) - Merge sums."
    ["Add_Two_Numbers_II"]="Add Two Numbers II (LeetCode #445) - Merge from end."
    ["Find_the_Duplicate_Number"]="Find the Duplicate Number (LeetCode #287) - Cycle detection (graph-like merge)."
    ["Intersection_of_Two_Linked_Lists"]="Intersection of Two Linked Lists (LeetCode #160) - Find merge point."
    ["Flatten_a_Multilevel_Doubly_Linked_List"]="Flatten a Multilevel Doubly Linked List (LeetCode #430) - Merge levels."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Linked_Lists/Merging/$problem" "${problem//_/ }" "${problems[$problem]}"
done

# Stacks
mkdir -p Stacks
echo "$STACKS_NOTES" > Stacks/README.md
mkdir -p Stacks/Push
problems=(
    ["Min_Stack"]="Min Stack (LeetCode #155) - Push with min tracking."
    ["Evaluate_Reverse_Polish_Notation"]="Evaluate Reverse Polish Notation (LeetCode #150) - Push operands."
    ["Daily_Temperatures"]="Daily Temperatures (LeetCode #739) - Push indices for monotonic."
    ["Online_Stock_Span"]="Online Stock Span (LeetCode #901) - Push prices for span."
    ["Basic_Calculator"]="Basic Calculator (LeetCode #224) - Push numbers/signs."
    ["Remove_All_Adjacent_Duplicates_In_String"]="Remove All Adjacent Duplicates In String (LeetCode #1047) - Push chars."
    ["Backspace_String_Compare"]="Backspace String Compare (LeetCode #844) - Push non-backspace."
    ["Simplify_Path"]="Simplify Path (LeetCode #71) - Push path segments."
    ["Asteroid_Collision"]="Asteroid Collision (LeetCode #735) - Push asteroids for collision."
    ["Car_Fleet"]="Car Fleet (LeetCode #853) - Push fleets for monotonic."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Stacks/Push/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Stacks/Pop
problems=(
    ["Valid_Parentheses"]="Valid Parentheses (LeetCode #20) - Pop to match brackets."
    ["Remove_Outermost_Parentheses"]="Remove Outermost Parentheses (LeetCode #1021) - Pop for nesting."
    ["Make_The_String_Great"]="Make The String Great (LeetCode #1544) - Pop adjacent bad pairs."
    ["Remove_Duplicate_Letters"]="Remove Duplicate Letters (LeetCode #316) - Pop for lexicographical."
    ["Decode_String"]="Decode String (LeetCode #394) - Pop for repeats."
    ["Trapping_Rain_Water"]="Trapping Rain Water (LeetCode #42) - Pop for water levels."
    ["Largest_Rectangle_in_Histogram"]="Largest Rectangle in Histogram (LeetCode #84) - Pop for area."
    ["Maximal_Rectangle"]="Maximal Rectangle (LeetCode #85) - Pop for matrix rectangle."
    ["Next_Greater_Element_I"]="Next Greater Element I (LeetCode #496) - Pop for greater."
    ["Next_Greater_Element_II"]="Next Greater Element II (LeetCode #503) - Circular pop for greater."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Stacks/Pop/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Stacks/Peek_Top
problems=(
    ["Min_Stack"]="Min Stack (LeetCode #155) - Get min with peek."
    ["Implement_Queue_using_Stacks"]="Implement Queue using Stacks (LeetCode #232) - Peek with stack top."
    ["Basic_Calculator_II"]="Basic Calculator II (LeetCode #227) - Peek for operations."
    ["Next_Greater_Element_III"]="Next Greater Element III (LeetCode #556) - Peek for swap."
    ["Stock_Spanner"]="Stock Spanner (LeetCode #901) - Peek for span."
    ["Validate_Stack_Sequences"]="Validate Stack Sequences (LeetCode #946) - Peek to validate."
    ["Score_of_Parentheses"]="Score of Parentheses (LeetCode #856) - Peek for scores."
    ["Remove_K_Digits"]="Remove K Digits (LeetCode #402) - Peek to remove for smallest."
    ["Sum_of_Subarray_Minimums"]="Sum of Subarray Minimums (LeetCode #907) - Peek for subarray mins."
    ["Exclusive_Time_of_Functions"]="Exclusive Time of Functions (LeetCode #636) - Peek for time calculation."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Stacks/Peek_Top/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Stacks/IsEmpty
problems=(
    ["Valid_Parentheses"]="Valid Parentheses (LeetCode #20) - Empty at end for balance."
    ["Simplify_Path"]="Simplify Path (LeetCode #71) - Check empty for root."
    ["Decode_String"]="Decode String (LeetCode #394) - Empty after processing."
    ["Basic_Calculator"]="Basic Calculator (LeetCode #224) - Empty after eval."
    ["Remove_Invalid_Parentheses"]="Remove Invalid Parentheses (LeetCode #301) - Check empty for valid."
    ["Validate_Stack_Sequences"]="Validate Stack Sequences (LeetCode #946) - Empty at end."
    ["Next_Greater_Element_II"]="Next Greater Element II (LeetCode #503) - Handle empty for -1."
    ["Daily_Temperatures"]="Daily Temperatures (LeetCode #739) - Empty for 0."
    ["Backspace_String_Compare"]="Backspace String Compare (LeetCode #844) - Empty stacks for empty string."
    ["Make_The_String_Great"]="Make The String Great (LeetCode #1544) - Empty after pops for good."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Stacks/IsEmpty/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Stacks/Monotonic_Stack
problems=(
    ["Daily_Temperatures"]="Daily Temperatures (LeetCode #739) - Next warmer day."
    ["Next_Greater_Element_I"]="Next Greater Element I (LeetCode #496) - Next greater to right."
    ["Next_Greater_Element_II"]="Next Greater Element II (LeetCode #503) - Circular next greater."
    ["Online_Stock_Span"]="Online Stock Span (LeetCode #901) - Stock span."
    ["Asteroid_Collision"]="Asteroid Collision (LeetCode #735) - Colliding asteroids."
    ["Largest_Rectangle_in_Histogram"]="Largest Rectangle in Histogram (LeetCode #84) - Largest rectangle."
    ["Maximal_Rectangle"]="Maximal Rectangle (LeetCode #85) - Max rectangle in matrix."
    ["Sum_of_Subarray_Minimums"]="Sum of Subarray Minimums (LeetCode #907) - Sum mins."
    ["Trapping_Rain_Water"]="Trapping Rain Water (LeetCode #42) - Trapped water."
    ["Car_Fleet"]="Car Fleet (LeetCode #853) - Number of fleets."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Stacks/Monotonic_Stack/$problem" "${problem//_/ }" "${problems[$problem]}"
done

# Queues
mkdir -p Queues
echo "$QUEUES_NOTES" > Queues/README.md
mkdir -p Queues/Enqueue
problems=(
    ["Implement_Queue_using_Stacks"]="Implement Queue using Stacks (LeetCode #232) - Enqueue with stacks."
    ["Design_Circular_Queue"]="Design Circular Queue (LeetCode #622) - Enqueue in circular."
    ["Number_of_Recent_Calls"]="Number of Recent Calls (LeetCode #933) - Enqueue timestamps."
    ["Moving_Average_from_Data_Stream"]="Moving Average from Data Stream (LeetCode #346) - Enqueue for average."
    ["Kth_Largest_Element_in_a_Stream"]="Kth Largest Element in a Stream (LeetCode #703) - Enqueue for k largest."
    ["Design_Front_Middle_Back_Queue"]="Design Front Middle Back Queue (LeetCode #1670) - Enqueue at positions."
    ["Queue_Reconstruction_by_Height"]="Queue Reconstruction by Height (LeetCode #406) - Enqueue by height."
    ["Task_Scheduler"]="Task Scheduler (LeetCode #621) - Enqueue tasks with cooldown."
    ["Reveal_Cards_In_Increasing_Order"]="Reveal Cards In Increasing Order (LeetCode #950) - Enqueue for simulation."
    ["Number_of_Students_Unable_to_Eat_Lunch"]="Number of Students Unable to Eat Lunch (LeetCode #1700) - Enqueue students/sandwiches."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Queues/Enqueue/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Queues/Dequeue
problems=(
    ["Sliding_Window_Maximum"]="Sliding Window Maximum (LeetCode #239) - Dequeue out of window."
    ["Implement_Stack_using_Queues"]="Implement Stack using Queues (LeetCode #225) - Dequeue to simulate pop."
    ["Number_of_Recent_Calls"]="Number of Recent Calls (LeetCode #933) - Dequeue old calls."
    ["Moving_Average_from_Data_Stream"]="Moving Average from Data Stream (LeetCode #346) - Dequeue for fixed size."
    ["Dota2_Senate"]="Dota2 Senate (LeetCode #649) - Dequeue senators in simulation."
    ["Jump_Game_VI"]="Jump Game VI (LeetCode #1696) - Dequeue for max score."
    ["Shortest_Path_in_a_Grid_with_Obstacles_Elimination"]="Shortest Path in a Grid with Obstacles Elimination (LeetCode #1293) - Dequeue in BFS."
    ["Open_the_Lock"]="Open the Lock (LeetCode #752) - Dequeue states in BFS."
    ["Find_the_Shortest_Path_with_Alternating_Colors"]="Find the Shortest Path with Alternating Colors (LeetCode #1129) - Dequeue in BFS."
    ["Number_of_Visible_People_in_a_Queue"]="Number of Visible People in a Queue (LeetCode #1944) - Monotonic dequeue."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Queues/Dequeue/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Queues/Peek_Front
problems=(
    ["Implement_Stack_using_Queues"]="Implement Stack using Queues (LeetCode #225) - Peek with front."
    ["Sliding_Window_Maximum"]="Sliding Window Maximum (LeetCode #239) - Front is max."
    ["Design_Front_Middle_Back_Queue"]="Design Front Middle Back Queue (LeetCode #1670) - Peek front/middle/back."
    ["Kth_Largest_Element_in_a_Stream"]="Kth Largest Element in a Stream (LeetCode #703) - Peek min in heap (queue-like)."
    ["Dota2_Senate"]="Dota2 Senate (LeetCode #649) - Peek front senator."
    ["Number_of_Students_Unable_to_Eat_Lunch"]="Number of Students Unable to Eat Lunch (LeetCode #1700) - Peek front student."
    ["Time_Needed_to_Buy_Tickets"]="Time Needed to Buy Tickets (LeetCode #2073) - Peek front time."
    ["Reveal_Cards_In_Increasing_Order"]="Reveal Cards In Increasing Order (LeetCode #950) - Peek for order."
    ["Implement_Queue_using_Stacks"]="Implement Queue using Stacks (LeetCode #232) - Peek with front."
    ["Jump_Game_VI"]="Jump Game VI (LeetCode #1696) - Front for max."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Queues/Peek_Front/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Queues/IsEmpty
problems=(
    ["Implement_Stack_using_Queues"]="Implement Stack using Queues (LeetCode #225) - Check empty."
    ["Design_Circular_Queue"]="Design Circular Queue (LeetCode #622) - Check empty/full."
    ["Number_of_Students_Unable_to_Eat_Lunch"]="Number of Students Unable to Eat Lunch (LeetCode #1700) - Empty queues end simulation."
    ["Dota2_Senate"]="Dota2 Senate (LeetCode #649) - Empty queue ends."
    ["Open_the_Lock"]="Open the Lock (LeetCode #752) - Empty queue no path."
    ["Shortest_Path_in_Binary_Matrix"]="Shortest Path in Binary Matrix (LeetCode #1091) - Empty no path."
    ["Rotten_Oranges"]="Rotten Oranges (LeetCode #994) - Empty after BFS."
    ["Number_of_Islands"]="Number of Islands (LeetCode #200) - Empty after traversing island."
    ["Walls_and_Gates"]="Walls and Gates (LeetCode #286) - Empty after multi-source BFS."
    ["Pacific_Atlantic_Water_Flow"]="Pacific Atlantic Water Flow (LeetCode #417) - Empty after BFS from edges."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Queues/IsEmpty/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Queues/Monotonic_Queue
problems=(
    ["Sliding_Window_Maximum"]="Sliding Window Maximum (LeetCode #239) - Max in window."
    ["Jump_Game_VI"]="Jump Game VI (LeetCode #1696) - Max score with window."
    ["Number_of_Visible_People_in_a_Queue"]="Number of Visible People in a Queue (LeetCode #1944) - Visible people."
    ["Constrained_Subsequence_Sum"]="Constrained Subsequence Sum (LeetCode #1425) - Max sum with constraint."
    ["Shortest_Subarray_with_Sum_at_Least_K"]="Shortest Subarray with Sum at Least K (LeetCode #862) - Min subarray."
    ["Sliding_Window_Median"]="Sliding Window Median (LeetCode #480) - Median in window (dual queues)."
    ["Find_the_Most_Competitive_Subsequence"]="Find the Most Competitive Subsequence (LeetCode #1673) - Competitive subsequence."
    ["Longest_Continuous_Subarray_With_Absolute_Diff_Less_Than_or_Equal_to_Limit"]="Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit (LeetCode #1438) - Longest with diff limit."
    ["Sliding_Subarray_Beauty"]="Sliding Subarray Beauty (LeetCode #2653) - Beauty in subarrays."
    ["Maximum_Number_of_Tasks_You_Can_Assign"]="Maximum Number of Tasks You Can Assign (LeetCode #2071) - Assign tasks with strength."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Queues/Monotonic_Queue/$problem" "${problem//_/ }" "${problems[$problem]}"
done

# Trees
mkdir -p Trees
echo "$TREES_NOTES" > Trees/README.md
mkdir -p Trees/Traversal
problems=(
    ["Binary_Tree_Level_Order_Traversal"]="Binary Tree Level Order Traversal (LeetCode #102) - Level order."
    ["Binary_Tree_Inorder_Traversal"]="Binary Tree Inorder Traversal (LeetCode #94) - Inorder."
    ["Binary_Tree_Preorder_Traversal"]="Binary Tree Preorder Traversal (LeetCode #144) - Preorder."
    ["Binary_Tree_Postorder_Traversal"]="Binary Tree Postorder Traversal (LeetCode #145) - Postorder."
    ["Binary_Tree_Right_Side_View"]="Binary Tree Right Side View (LeetCode #199) - Right view traversal."
    ["Vertical_Order_Traversal_of_a_Binary_Tree"]="Vertical Order Traversal of a Binary Tree (LeetCode #987) - Vertical order."
    ["Average_of_Levels_in_Binary_Tree"]="Average of Levels in Binary Tree (LeetCode #637) - Level averages."
    ["Binary_Tree_Zigzag_Level_Order_Traversal"]="Binary Tree Zigzag Level Order Traversal (LeetCode #103) - Zigzag levels."
    ["Binary_Tree_Maximum_Path_Sum"]="Binary Tree Maximum Path Sum (LeetCode #124) - Max path during traversal."
    ["Path_Sum"]="Path Sum (LeetCode #112) - Check root to leaf sum."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Trees/Traversal/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Trees/Insertion
problems=(
    ["Insert_into_a_Binary_Search_Tree"]="Insert into a Binary Search Tree (LeetCode #701) - Insert in BST."
    ["Convert_Sorted_Array_to_Binary_Search_Tree"]="Convert Sorted Array to Binary Search Tree (LeetCode #108) - Insert balanced."
    ["Convert_Sorted_List_to_Binary_Search_Tree"]="Convert Sorted List to Binary Search Tree (LeetCode #109) - Insert from list."
    ["All_Possible_Full_Binary_Trees"]="All Possible Full Binary Trees (LeetCode #894) - Generate by inserting."
    ["Add_One_Row_to_Tree"]="Add One Row to Tree (LeetCode #623) - Insert row at depth."
    ["Construct_Binary_Tree_from_Preorder_and_Inorder_Traversal"]="Construct Binary Tree from Preorder and Inorder Traversal (LeetCode #105) - Insert from traversals."
    ["Construct_Binary_Tree_from_Inorder_and_Postorder_Traversal"]="Construct Binary Tree from Inorder and Postorder Traversal (LeetCode #106) - Insert from traversals."
    ["Construct_Binary_Search_Tree_from_Preorder_Traversal"]="Construct Binary Search Tree from Preorder Traversal (LeetCode #1008) - Insert from preorder."
    ["Unique_Binary_Search_Trees"]="Unique Binary Search Trees (LeetCode #96) - Count ways to insert."
    ["Unique_Binary_Search_Trees_II"]="Unique Binary Search Trees II (LeetCode #95) - Generate all by insertion."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Trees/Insertion/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Trees/Deletion
problems=(
    ["Delete_Node_in_a_BST"]="Delete Node in a BST (LeetCode #450) - Delete from BST."
    ["Delete_Leaves_With_a_Given_Value"]="Delete Leaves With a Given Value (LeetCode #1325) - Delete leaves."
    ["Delete_Nodes_and_Return_Forest"]="Delete Nodes and Return Forest (LeetCode #1110) - Delete and return trees."
    ["Count_Nodes_Equal_to_Average_of_Subtree"]="Count Nodes Equal to Average of Subtree (LeetCode #2265) - Delete-like traversal."
    ["Prune_Tree"]="Prune Tree (LeetCode #814) - Prune subtrees with no 1s."
    ["Remove_Leaf_Nodes_with_Specific_Value"]="Remove Leaf Nodes with Specific Value - Similar to LeetCode #1325."
    ["Delete_Duplicate_Folders_in_System"]="Delete Duplicate Folders in System (LeetCode #1948) - Delete duplicate subtrees."
    ["Find_Duplicate_Subtrees"]="Find Duplicate Subtrees (LeetCode #652) - Identify then delete-like."
    ["Binary_Tree_Pruning"]="Binary Tree Pruning (LeetCode #814) - Prune subtrees without 1s."
    ["Remove_Sub_Folders_from_the_Filesystem"]="Remove Sub-Folders from the Filesystem (LeetCode #1233) - Delete subfolders."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Trees/Deletion/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Trees/Search
problems=(
    ["Search_in_a_Binary_Search_Tree"]="Search in a Binary Search Tree (LeetCode #700) - Find node in BST."
    ["Lowest_Common_Ancestor_of_a_Binary_Search_Tree"]="Lowest Common Ancestor of a Binary Search Tree (LeetCode #235) - Find LCA."
    ["Lowest_Common_Ancestor_of_a_Binary_Tree"]="Lowest Common Ancestor of a Binary Tree (LeetCode #236) - LCA in general tree."
    ["Validate_Binary_Search_Tree"]="Validate Binary Search Tree (LeetCode #98) - Verify BST property."
    ["Kth_Smallest_Element_in_a_BST"]="Kth Smallest Element in a BST (LeetCode #230) - Find kth smallest."
    ["Find_Mode_in_Binary_Search_Tree"]="Find Mode in Binary Search Tree (LeetCode #501) - Find most frequent."
    ["Two_Sum_IV_Input_is_a_BST"]="Two Sum IV - Input is a BST (LeetCode #653) - Find pair summing to target."
    ["Closest_Binary_Search_Tree_Value"]="Closest Binary Search Tree Value (LeetCode #270) - Find closest to target."
    ["Recover_Binary_Search_Tree"]="Recover Binary Search Tree (LeetCode #99) - Find and swap misplaced nodes."
    ["Find_Closest_Value_in_BST"]="Find Closest Value in BST - Similar to LeetCode #270."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Trees/Search/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Trees/Height_Diameter_Balance
problems=(
    ["Balanced_Binary_Tree"]="Balanced Binary Tree (LeetCode #110) - Check height balance."
    ["Diameter_of_Binary_Tree"]="Diameter of Binary Tree (LeetCode #543) - Longest path between nodes."
    ["Maximum_Depth_of_Binary_Tree"]="Maximum Depth of Binary Tree (LeetCode #104) - Find max depth."
    ["Minimum_Depth_of_Binary_Tree"]="Minimum Depth of Binary Tree (LeetCode #111) - Find min depth."
    ["Binary_Tree_Maximum_Path_Sum"]="Binary Tree Maximum Path Sum (LeetCode #124) - Max path sum."
    ["Check_Completeness_of_a_Binary_Tree"]="Check Completeness of a Binary Tree (LeetCode #958) - Check complete binary tree."
    ["Height_of_Binary_Tree_After_Subtree_Removal_Queries"]="Height of Binary Tree After Subtree Removal Queries (LeetCode #2458) - Height after removal."
    ["Count_Nodes_Equal_to_Average_of_Subtree"]="Count Nodes Equal to Average of Subtree (LeetCode #2265) - Height-like traversal."
    ["Same_Tree"]="Same Tree (LeetCode #100) - Compare trees for equality."
    ["Symmetric_Tree"]="Symmetric Tree (LeetCode #101) - Check mirror symmetry."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Trees/Height_Diameter_Balance/$problem" "${problem//_/ }" "${problems[$problem]}"
done

# Graphs
mkdir -p Graphs
echo "$GRAPHS_NOTES" > Graphs/README.md
mkdir -p Graphs/Traversal_BFS_DFS
problems=(
    ["Number_of_Islands"]="Number of Islands (LeetCode #200) - Count islands using DFS/BFS."
    ["Rotten_Oranges"]="Rotten Oranges (LeetCode #994) - Spread rot using BFS."
    ["Course_Schedule"]="Course Schedule (LeetCode #207) - Detect cycle with DFS."
    ["Clone_Graph"]="Clone Graph (LeetCode #133) - DFS/BFS to copy graph."
    ["Pacific_Atlantic_Water_Flow"]="Pacific Atlantic Water Flow (LeetCode #417) - BFS from edges."
    ["Walls_and_Gates"]="Walls and Gates (LeetCode #286) - Multi-source BFS."
    ["Shortest_Path_in_Binary_Matrix"]="Shortest Path in Binary Matrix (LeetCode #1091) - BFS for shortest path."
    ["Word_Ladder"]="Word Ladder (LeetCode #127) - BFS for word transformation."
    ["Snakes_and_Ladders"]="Snakes and Ladders (LeetCode #909) - BFS with jumps."
    ["Find_Closest_Node_to_Given_Two_Nodes"]="Find Closest Node to Given Two Nodes (LeetCode #2359) - BFS from two nodes."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Graphs/Traversal_BFS_DFS/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Graphs/Insertion
problems=(
    ["Add_Edge_to_Make_Strongly_Connected"]="Add Edge to Make Strongly Connected - Add edge for SCC."
    ["Insert_into_a_Sorted_Circular_Linked_List"]="Insert into a Sorted Circular Linked List (LeetCode #708) - Graph-like insertion."
    ["Add_Edges_to_Make_Degrees_of_All_Nodes_Even"]="Add Edges to Make Degrees of All Nodes Even (LeetCode #2508) - Add edges."
    ["Graph_Connectivity_With_Threshold"]="Graph Connectivity With Threshold (LeetCode #1627) - Add edges based on divisibility."
    ["Add_Edge_to_Tree"]="Add Edge to Tree - Insert edge to maintain tree."
    ["Build_a_Matrix_With_Conditions"]="Build a Matrix With Conditions (LeetCode #2392) - Insert edges for topo sort."
    ["Minimum_Score_of_a_Path_Between_Two_Cities"]="Minimum Score of a Path Between Two Cities (LeetCode #2492) - Insert edges."
    ["Number_of_Provinces"]="Number of Provinces (LeetCode #547) - Insert for components."
    ["Accounts_Merge"]="Accounts Merge (LeetCode #721) - Insert edges for emails."
    ["Find_Center_of_Star_Graph"]="Find Center of Star Graph (LeetCode #1791) - Insert star edges."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Graphs/Insertion/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Graphs/Deletion
problems=(
    ["Remove_Max_Number_of_Edges_to_Keep_Graph_Fully_Traversable"]="Remove Max Number of Edges to Keep Graph Fully Traversable (LeetCode #1579) - Delete edges."
    ["Remove_Edge_to_Make_Tree"]="Remove Edge to Make Tree - Remove edge to form tree."
    ["Delete_Edges_to_Make_Directed_Acyclic_Graph"]="Delete Edges to Make Directed Acyclic Graph - Remove for DAG."
    ["Remove_Edges_to_Restrict_Path"]="Remove Edges to Restrict Path - Limit paths."
    ["Delete_Duplicate_Folders_in_System"]="Delete Duplicate Folders in System (LeetCode #1948) - Delete duplicate subgraphs."
    ["Remove_Critical_Edges"]="Remove Critical Edges - Remove edges affecting connectivity."
    ["Remove_Edges_to_Avoid_Cycles"]="Remove Edges to Avoid Cycles - Ensure acyclic."
    ["Remove_Nodes_From_Linked_List"]="Remove Nodes From Linked List (LeetCode #2487) - Delete in graph-like list."
    ["Remove_Edge_to_Minimize_Diameter"]="Remove Edge to Minimize Diameter - Minimize graph diameter."
    ["Delete_Nodes_and_Return_Forest"]="Delete Nodes and Return Forest (LeetCode #1110) - Delete nodes."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Graphs/Deletion/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Graphs/Shortest_Path
problems=(
    ["Shortest_Path_in_Binary_Matrix"]="Shortest Path in Binary Matrix (LeetCode #1091) - BFS for shortest."
    ["Network_Delay_Time"]="Network Delay Time (LeetCode #743) - Dijkstra for delay."
    ["Cheapest_Flights_Within_K_Stops"]="Cheapest Flights Within K Stops (LeetCode #787) - Dijkstra/Bellman-Ford."
    ["Path_With_Minimum_Effort"]="Path With Minimum Effort (LeetCode #1631) - Dijkstra for min effort."
    ["Shortest_Path_with_Alternating_Colors"]="Shortest Path with Alternating Colors (LeetCode #1129) - BFS with colors."
    ["Word_Ladder"]="Word Ladder (LeetCode #127) - BFS for shortest transformation."
    ["Open_the_Lock"]="Open the Lock (LeetCode #752) - BFS for min turns."
    ["Shortest_Path_in_a_Grid_with_Obstacles_Elimination"]="Shortest Path in a Grid with Obstacles Elimination (LeetCode #1293) - BFS with k obstacles."
    ["Minimum_Path_Sum"]="Minimum Path Sum (LeetCode #64) - DP for grid path."
    ["Find_the_Shortest_Superstring"]="Find the Shortest Superstring (LeetCode #943) - Shortest string containing all."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Graphs/Shortest_Path/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Graphs/Cycle_Detection
problems=(
    ["Course_Schedule"]="Course Schedule (LeetCode #207) - Detect cycle in course prerequisites."
    ["Course_Schedule_II"]="Course Schedule II (LeetCode #210) - Topological sort with cycle check."
    ["Redundant_Connection"]="Redundant Connection (LeetCode #684) - Find edge causing cycle."
    ["Find_Eventual_Safe_States"]="Find Eventual Safe States (LeetCode #802) - Find nodes with no cycle paths."
    ["Cycle_Detection_in_Undirected_Graph"]="Cycle Detection in Undirected Graph - Use DFS or Union-Find."
    ["Longest_Cycle_in_a_Graph"]="Longest Cycle in a Graph (LeetCode #2360) - Find longest cycle."
    ["Graph_Valid_Tree"]="Graph Valid Tree (LeetCode #261) - Check no cycles and connected."
    ["All_Paths_From_Source_Lead_to_Destination"]="All Paths From Source Lead to Destination (LeetCode #1059) - Check no cycles to non-destination."
    ["Is_Graph_Bipartite"]="Is Graph Bipartite (LeetCode #785) - Detect odd-length cycles."
    ["Possible_Bipartition"]="Possible Bipartition (LeetCode #886) - Bipartite with groups."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Graphs/Cycle_Detection/$problem" "${problem//_/ }" "${problems[$problem]}"
done

# Heaps
mkdir -p Heaps
echo "$HEAPS_NOTES" > Heaps/README.md
mkdir -p Heaps/Heapify
problems=(
    ["Kth_Largest_Element_in_an_Array"]="Kth Largest Element in an Array (LeetCode #215) - Heapify for kth largest."
    ["Sort_an_Array"]="Sort an Array (LeetCode #912) - Heap sort implementation."
    ["Convert_Max_Heap_to_Min_Heap"]="Convert Max Heap to Min Heap - Transform heap."
    ["Heap_Sort_for_Decreasing_Order"]="Heap Sort for Decreasing Order - Sort in descending order."
    ["K_Smallest_Elements"]="K Smallest Elements - Find k smallest using heap."
    ["K_Sorted_Array"]="K Sorted Array - Nearly sorted array with heap."
    ["Top_K_Frequent_Elements"]="Top K Frequent Elements (LeetCode #347) - Heapify frequency map."
    ["Kth_Smallest_Element"]="Kth Smallest Element - General kth smallest."
    ["Reorganize_String"]="Reorganize String (LeetCode #767) - Heapify for char rearrangement."
    ["Task_Scheduler"]="Task Scheduler (LeetCode #621) - Heapify for task scheduling."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Heaps/Heapify/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Heaps/Push_Insert
problems=(
    ["Kth_Largest_Element_in_a_Stream"]="Kth Largest Element in a Stream (LeetCode #703) - Push to min heap."
    ["Last_Stone_Weight"]="Last Stone Weight (LeetCode #1046) - Push stones to heap."
    ["K_Closest_Points_to_Origin"]="K Closest Points to Origin (LeetCode #973) - Push points to heap."
    ["Merge_K_Sorted_Lists"]="Merge K Sorted Lists (LeetCode #23) - Push list nodes to heap."
    ["Top_K_Frequent_Words"]="Top K Frequent Words (LeetCode #692) - Push words to heap."
    ["Find_Median_from_Data_Stream"]="Find Median from Data Stream (LeetCode #295) - Push to two heaps."
    ["Ugly_Number_II"]="Ugly Number II (LeetCode #264) - Push multiples to heap."
    ["Furthest_Building_You_Can_Reach"]="Furthest Building You Can Reach (LeetCode #1642) - Push ladder heights."
    ["Seat_Reservation_Manager"]="Seat Reservation Manager (LeetCode #1845) - Push available seats."
    ["Maximum_Number_of_Tasks_You_Can_Assign"]="Maximum Number of Tasks You Can Assign (LeetCode #2071) - Push tasks/workers."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Heaps/Push_Insert/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Heaps/Pop_Extract
problems=(
    ["Top_K_Frequent_Elements"]="Top K Frequent Elements (LeetCode #347) - Pop k elements."
    ["Kth_Largest_Element_in_an_Array"]="Kth Largest Element in an Array (LeetCode #215) - Pop for kth."
    ["Merge_K_Sorted_Lists"]="Merge K Sorted Lists (LeetCode #23) - Pop smallest."
    ["Find_K_Pairs_with_Smallest_Sums"]="Find K Pairs with Smallest Sums (LeetCode #373) - Pop k pairs."
    ["Reorganize_String"]="Reorganize String (LeetCode #767) - Pop max frequency."
    ["Task_Scheduler"]="Task Scheduler (LeetCode #621) - Pop tasks."
    ["Last_Stone_Weight"]="Last Stone Weight (LeetCode #1046) - Pop two stones."
    ["K_Closest_Points_to_Origin"]="K Closest Points to Origin (LeetCode #973) - Pop k closest."
    ["Find_Median_from_Data_Stream"]="Find Median from Data Stream (LeetCode #295) - Pop for balance."
    ["Furthest_Building_You_Can_Reach"]="Furthest Building You Can Reach (LeetCode #1642) - Pop ladders."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Heaps/Pop_Extract/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Heaps/Peek
problems=(
    ["Kth_Largest_Element_in_a_Stream"]="Kth Largest Element in a Stream (LeetCode #703) - Peek min."
    ["Find_Median_from_Data_Stream"]="Find Median from Data Stream (LeetCode #295) - Peek medians."
    ["Seat_Reservation_Manager"]="Seat Reservation Manager (LeetCode #1845) - Peek smallest seat."
    ["Reorganize_String"]="Reorganize String (LeetCode #767) - Peek max frequency."
    ["Task_Scheduler"]="Task Scheduler (LeetCode #621) - Peek next task."
    ["Last_Stone_Weight"]="Last Stone Weight (LeetCode #1046) - Peek largest stones."
    ["Sliding_Window_Maximum"]="Sliding Window Maximum (LeetCode #239) - Peek max."
    ["Maximum_Number_of_Tasks_You_Can_Assign"]="Maximum Number of Tasks You Can Assign (LeetCode #2071) - Peek tasks."
    ["Process_Tasks_Using_Servers"]="Process Tasks Using Servers (LeetCode #1882) - Peek available servers."
    ["Maximum_Invitations"]="Maximum Invitations (LeetCode #1820) - Peek for max invites."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Heaps/Peek/$problem" "${problem//_/ }" "${problems[$problem]}"
done

mkdir -p Heaps/Merge
problems=(
    ["Merge_K_Sorted_Lists"]="Merge K Sorted Lists (LeetCode #23) - Merge using heap."
    ["Smallest_Number_in_Infinite_Set"]="Smallest Number in Infinite Set (LeetCode #2336) - Heap for smallest."
    ["Find_K_Pairs_with_Smallest_Sums"]="Find K Pairs with Smallest Sums (LeetCode #373) - Merge pairs."
    ["Merge_Similar_Items"]="Merge Similar Items (LeetCode #2363) - Merge value sums."
    ["Find_the_Kth_Largest_Integer_in_the_Array"]="Find the Kth Largest Integer in the Array (LeetCode #1985) - Heap for strings."
    ["K_Smallest_Pairs"]="K Smallest Pairs - Similar to LeetCode #373."
    ["Merge_Nodes_in_Between_Zeros"]="Merge Nodes in Between Zeros (LeetCode #2181) - Merge non-zero segments."
    ["Task_Scheduler_II"]="Task Scheduler II (LeetCode #2365) - Schedule with heap."
    ["Design_Graph_With_Shortest_Path_Calculator"]="Design Graph With Shortest Path Calculator (LeetCode #2642) - Dijkstra with heap."
    ["Network_Delay_Time"]="Network Delay Time (LeetCode #743) - Merge paths with heap."
)
for problem in "${!problems[@]}"; do
    create_problem_folder "Heaps/Merge/$problem" "${problem//_/ }" "${problems[$problem]}"
done

echo "Directory structure with populated README.md files created successfully in $(pwd)."
