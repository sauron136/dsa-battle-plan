# Heaps

Heaps are complete binary trees for priority queues, min or max. In Python, heapq for min-heap. O(log n) insert/pop, O(1) peek.

## Key Operations
- **Heapify**: Build heap O(n). Time: O(n), Space: O(1).
- **Push/Insert**: Add element. Time: O(log n), Space: O(1).
- **Pop/Extract**: Remove root. Time: O(log n), Space: O(1).
- **Peek**: Get root. Time: O(1), Space: O(1).
- **Merge**: Combine heaps. Time: O(n + m), Space: O(n + m).


## Heaps (Binary Heap)

| Operation | Time Complexity | Space Complexity | Use Case |
|-----------|-----------------|------------------|----------|
| Insert (Push) | O(log n) | O(1) | Adding element |
| Extract Min/Max (Pop) | O(log n) | O(1) | Removing root |
| Peek (Min/Max) | O(1) | O(1) | View root element |
| Delete Arbitrary | O(log n) | O(1) | Removing specific element |
| Build Heap (Heapify) | O(n) | O(1) | Creating heap from array |
| Decrease/Increase Key | O(log n) | O(1) | Priority updates |
| Search | O(n) | O(1) | Finding element |

### Heap Variants
| Heap Type | Insert | Extract-Min | Decrease-Key | Use Case |
|-----------|---------|-------------|--------------|----------|
| Binary Heap | O(log n) | O(log n) | O(log n) | Priority queues, heapsort |
| Fibonacci Heap | O(1) | O(log n) | O(1) amortized | Dijkstra, Prim's algorithm |
| Binomial Heap | O(log n) | O(log n) | O(log n) | Mergeable priority queues |
| d-ary Heap | O(log_d n) | O(d × log_d n) | O(log_d n) | When insertions > extractions |

**Key Notes:**
- Python's `heapq` module implements min-heap using lists
- Complete binary tree stored as array for space efficiency
- Parent at index i, children at 2i+1 and 2i+2
- Perfect for priority queues, top-K problems, heap sort
- Not suitable for searching arbitrary elements (use balanced BST instead)
- Build heap from array is surprisingly O(n), not O(n log n)
