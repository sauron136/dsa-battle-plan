# Linked Lists

Linked lists are linear collections where each node points to the next, allowing O(1) insertion/deletion but O(n) access. In Python, implement with classes. Good for dynamic size, frequent insertions.

## Key Operations
- **Traversal**: Following pointers to visit nodes. Time: O(n), Space: O(1).
- **Insertion**: Adding nodes by updating pointers. Time: O(1) if position known, O(n) search; Space: O(1).
- **Deletion**: Removing nodes by updating pointers. Time: O(1) if position known, O(n) search; Space: O(1).
- **Reversal**: Reversing links. Time: O(n), Space: O(1).
- **Merging**: Combining lists. Time: O(n + m), Space: O(1).

## Linked List

| Operation | Time Complexity | Space Complexity | Use Case |
|-----------|-----------------|------------------|----------|
| Access by Index | O(n) | O(1) | Retrieving nth element |
| Search | O(n) | O(1) | Finding element |
| Insertion (beginning) | O(1) | O(1) | Adding to front |
| Insertion (end) | O(n) singly, O(1) doubly | O(1) | Adding to back |
| Insertion (middle) | O(n) | O(1) | Adding at position |
| Deletion (beginning) | O(1) | O(1) | Removing from front |
| Deletion (end) | O(n) singly, O(1) doubly | O(1) | Removing from back |
| Deletion (middle) | O(n) | O(1) | Removing at position |

**Key Notes:**
- No built-in linked list in Python - typically implemented with classes
- Singly linked: each node points to next; Doubly linked: nodes point both ways
- Excellent for frequent insertions/deletions when position is known
- Poor cache performance compared to arrays due to non-contiguous memory
- Useful when size varies dramatically or insertion/deletion patterns are unpredictable
