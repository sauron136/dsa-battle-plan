# Strings

Strings are sequences of characters, treated as immutable arrays in Python. They support O(1) access but are immutable, so modifications create new strings (O(n) time). Common for text manipulation, pattern matching.

## Key Operations
- **Traversal/Concatenation**: Iterating or building new strings. Time: O(n), Space: O(n) for new string.
- **Search/Substring**: Finding patterns or substrings. Time: O(n) linear, O(n+m) KMP; Space: O(1).
- **Replacement/Modification**: Replacing characters or substrings. Time: O(n), Space: O(n).
- **Sorting/Counting**: Sorting characters or counting frequencies. Time: O(n log n) sort, O(n) count; Space: O(n).
- **Palindrome/Anagram Checks**: Checking symmetries or permutations. Time: O(n), Space: O(1) or O(26) for chars.


## Complexity Summary

| Operation | Time Complexity | Space Complexity | Use Case |
|-----------|----------------|------------------|----------|
| Traversal | O(n) | O(1) | Processing all characters |
| String Concatenation (join) | O(n) | O(n) | Efficient string building |
| String Concatenation (+=) | O(n²) | O(n²) | Inefficient - avoid in loops |
| Substring Search | O(n) | O(1) | Finding patterns |
| Character Replacement | O(n) | O(n) | String modifications |
| Sorting Characters | O(n log n) | O(n) | Anagram detection |
| Character Counting | O(n) | O(k) where k=alphabet size | Frequency analysis |
| Palindrome Check | O(n) | O(1) | Symmetry detection |
| Anagram Check | O(n) | O(k) where k=alphabet size | Permutation detection |
