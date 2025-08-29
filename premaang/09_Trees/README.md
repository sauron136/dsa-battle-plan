# Trees

Trees are hierarchical structures with nodes having children, often binary (0-2 children). Binary Search Trees (BST) maintain order for O(log n) search. Useful for hierarchies, searching. Height h = log n balanced, n worst.

## Key Operations
- **Traversal (Inorder, Preorder, Postorder, Level Order)**: Visiting nodes. Time: O(n), Space: O(h) recursion, O(n) iterative.
- **Insertion**: Adding nodes (balanced in AVL, red-black). Time: O(h), Space: O(1).
- **Deletion**: Removing nodes, rebalancing. Time: O(h), Space: O(1).
- **Search**: Finding nodes. Time: O(h), Space: O(1).
- **Height/Diameter/Balance**: Computing properties. Time: O(n), Space: O(h).


## Trees (Binary Search Tree)

| Operation | Average Case | Worst Case | Space Complexity | Use Case |
|-----------|--------------|------------|------------------|----------|
| Search | O(log n) | O(n) | O(1) | Finding element |
| Insertion | O(log n) | O(n) | O(1) | Adding element |
| Deletion | O(log n) | O(n) | O(1) | Removing element |
| Traversal (DFS/BFS) | O(n) | O(n) | O(h) where h=height | Processing all nodes |
| Find Min/Max | O(log n) | O(n) | O(1) | Finding extremes |
| Height Calculation | O(n) | O(n) | O(h) | Tree analysis |

### Tree Traversal Variants
| Traversal Type | Time Complexity | Space Complexity | Use Case |
|----------------|-----------------|------------------|----------|
| Inorder (DFS) | O(n) | O(h) | Sorted order in BST |
| Preorder (DFS) | O(n) | O(h) | Tree serialization |
| Postorder (DFS) | O(n) | O(h) | Tree deletion, expression evaluation |
| Level-order (BFS) | O(n) | O(w) where w=max width | Level-by-level processing |

**Key Notes:**
- Best case assumes balanced tree; worst case is skewed/degenerate tree (like linked list)
- Self-balancing trees (AVL, Red-Black) guarantee O(log n) operations
- Space complexity for traversals depends on recursion depth (h) or queue width (w)
- Perfect for maintaining sorted data with fast insertions/deletions
- BST property: left subtree < node < right subtree
