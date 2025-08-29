# Hash Map (Dictionary in Python)

Hash maps are key-value pairs with average O(1) lookup, insertion, and deletion via hashing. In Python, dict is a hash map. Useful for frequency counting, mappings, caching. Worst-case O(n) due to collisions, but average O(1).

## Key Operations
- **Insertion**: Adding key-value pairs. Time: O(1) average, Space: O(1).
- **Lookup/Search**: Retrieving value by key. Time: O(1) average, Space: O(1).
- **Deletion**: Removing keys. Time: O(1) average, Space: O(1).
- **Iteration/Counting**: Traversing entries or counting frequencies. Time: O(n), Space: O(1).
- **Grouping/Mapping**: Grouping by key or mapping values. Time: O(n), Space: O(n).


## Complexity Summary

| Operation | Average Case | Worst Case | Space Complexity | Use Case |
|-----------|--------------|------------|------------------|----------|
| Insertion | O(1) | O(n) | O(1) | Adding key-value pairs |
| Lookup/Search | O(1) | O(n) | O(1) | Finding values by key |
| Deletion | O(1) | O(n) | O(1) | Removing key-value pairs |
| Iteration | O(n) | O(n) | O(1) | Processing all entries |
| Grouping | O(n) | O(n) | O(n) | Categorizing data |

## Key Takeaways

1. **Hash maps provide O(1) average time complexity** for basic operations, making them ideal for fast lookups
2. **Python dictionaries are hash maps** with additional features like ordered insertion (Python 3.7+)
3. **Keys must be immutable and hashable** - strings, numbers, tuples work; lists and dictionaries don't
4. **Excellent for frequency counting, caching, and grouping operations** - common interview patterns
5. **Memory overhead exists** but is usually worth it for the performance benefits
6. **Use get() method** to avoid KeyError exceptions in production code
7. **defaultdict is useful** when you need automatic default values for new keys
8. **Consider alternatives like sets** when you only need membership testing without values
