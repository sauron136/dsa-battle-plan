# Tuples

Tuples are immutable, ordered collections in Python, similar to lists but cannot be modified after creation. Useful for fixed data, return multiple values, or as keys in maps (since immutable). Operations are limited due to immutability.

## Key Operations
- **Creation/Access**: Creating and accessing elements. Time: O(1) access, O(n) creation; Space: O(n).
- **Iteration**: Looping through elements. Time: O(n), Space: O(1).
- **Packing/Unpacking**: Bundling/unbundling values. Time: O(n), Space: O(1).
- **Comparison/Sorting**: Comparing or sorting tuples. Time: O(n log n) for list of tuples, O(1) compare; Space: O(1).
- **Use as Keys**: In maps for composite keys. Time: O(1) average in hashmap, Space: O(1).

## Tuples

| Operation | Time Complexity | Space Complexity | Use Case |
|-----------|-----------------|------------------|----------|
| Access by Index | O(1) | O(1) | Retrieving element at position |
| Search (in) | O(n) | O(1) | Finding element |
| Slicing | O(k) where k=slice length | O(k) | Creating sub-tuple |
| Concatenation (+) | O(n + m) | O(n + m) | Combining tuples |
| Iteration | O(n) | O(1) | Processing all elements |
| Count/Index | O(n) | O(1) | Finding occurrences/position |

**Key Notes:**
- Tuples are immutable sequences with O(1) random access
- No insertion/deletion operations (immutable)
- Memory efficient due to immutability - can be optimized by Python interpreter
- Ideal for fixed collections, coordinates, database records, function returns
- Can be used as dictionary keys (unlike lists)
