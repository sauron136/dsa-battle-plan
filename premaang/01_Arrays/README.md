# Arrays

Arrays are a fundamental data structure consisting of a fixed-size collection of elements of the same type, stored in contiguous memory locations. They provide O(1) time complexity for random access via indices but have O(n) time for insertions/deletions in the middle due to shifting elements. In Python, lists act as dynamic arrays, allowing resizing. Arrays are ideal for scenarios requiring fast lookups, iterations, or storing ordered data.

## Key Operations
- **Traversal/Iteration**: Visiting each element, often using loops (e.g., for summing or finding patterns). Time: O(n), Space: O(1).
- **Search**: Finding an element or subarray (e.g., linear search O(n), binary search O(log n) on sorted arrays). Time: O(n) worst, O(log n) sorted; Space: O(1).
- **Insertion/Deletion**: Adding or removing elements, which may require shifting (O(n) time). Time: O(n), Space: O(1).
- **Sorting/Merging**: Arranging elements or combining arrays (e.g., merge sort O(n log n)). Time: O(n log n), Space: O(n).
- **Subarray Operations**: Working with contiguous parts (e.g., finding max sum). Time: Varies (e.g., O(n) for Kadane), Space: O(1).


## Complexity Summary

| Operation | Time Complexity | Space Complexity | Use Case |
|-----------|----------------|------------------|----------|
| Traversal | O(n) | O(1) | Processing all elements |
| Linear Search | O(n) | O(1) | Finding element in unsorted array |
| Binary Search | O(log n) | O(1) | Finding element in sorted array |
| Insertion/Deletion | O(n) | O(1) | Dynamic array modifications |
| Sorting | O(n log n) | O(n) | Ordering elements |
| Kadane's Algorithm | O(n) | O(1) | Maximum subarray sum |
