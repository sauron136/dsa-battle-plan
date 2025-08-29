# Trees

Trees are hierarchical structures with nodes having children, often binary (0-2 children). Binary Search Trees (BST) maintain order for O(log n) search. Useful for hierarchies, searching. Height h = log n balanced, n worst.

## Key Operations
- **Traversal (Inorder, Preorder, Postorder, Level Order)**: Visiting nodes. Time: O(n), Space: O(h) recursion, O(n) iterative.
- **Insertion**: Adding nodes (balanced in AVL, red-black). Time: O(h), Space: O(1).
- **Deletion**: Removing nodes, rebalancing. Time: O(h), Space: O(1).
- **Search**: Finding nodes. Time: O(h), Space: O(1).
- **Height/Diameter/Balance**: Computing properties. Time: O(n), Space: O(h).
