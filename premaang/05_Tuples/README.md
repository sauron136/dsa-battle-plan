# Tuples

Tuples are immutable, ordered collections in Python, similar to lists but cannot be modified after creation. Useful for fixed data, return multiple values, or as keys in maps (since immutable). Operations are limited due to immutability.

## Key Operations
- **Creation/Access**: Creating and accessing elements. Time: O(1) access, O(n) creation; Space: O(n).
- **Iteration**: Looping through elements. Time: O(n), Space: O(1).
- **Packing/Unpacking**: Bundling/unbundling values. Time: O(n), Space: O(1).
- **Comparison/Sorting**: Comparing or sorting tuples. Time: O(n log n) for list of tuples, O(1) compare; Space: O(1).
- **Use as Keys**: In maps for composite keys. Time: O(1) average in hashmap, Space: O(1).
