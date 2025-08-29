# Sets

Sets are collections of unique elements with O(1) average lookup, insertion, deletion. In Python, set is hash-based. Useful for uniqueness, membership testing, intersections. Worst-case O(n), average O(1).

## Key Operations
- **Insertion**: Adding elements (ignores duplicates). Time: O(1) average, Space: O(1).
- **Lookup/Membership**: Checking if element exists. Time: O(1) average, Space: O(1).
- **Deletion**: Removing elements. Time: O(1) average, Space: O(1).
- **Union/Intersection/Difference**: Combining sets. Time: O(n + m), Space: O(n + m).
- **Iteration/Counting Uniques**: Traversing or counting unique items. Time: O(n), Space: O(1).


## Sets

| Operation | Average Case | Worst Case | Space Complexity | Use Case |
|-----------|--------------|------------|------------------|----------|
| Insertion (add) | O(1) | O(n) | O(1) | Adding unique elements |
| Lookup/Search (in) | O(1) | O(n) | O(1) | Membership testing |
| Deletion (remove) | O(1) | O(n) | O(1) | Removing elements |
| Iteration | O(n) | O(n) | O(1) | Processing all elements |
| Union/Intersection | O(len(s1) + len(s2)) | O(len(s1) + len(s2)) | O(len(s1) + len(s2)) | Set operations |

**Key Notes:**
- Python sets are hash-based, providing average O(1) performance for basic operations
- Worst-case O(n) occurs due to hash collisions (rare in practice)
- Excellent for membership testing, removing duplicates, and mathematical set operations
- Elements must be immutable and hashable (strings, numbers, tuples)
