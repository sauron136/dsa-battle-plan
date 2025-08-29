## Space Complexity Notes

### Overall Space Requirements
| Data Structure | Space Complexity | Notes |
|----------------|------------------|--------|
| Arrays/Lists | O(n) | Contiguous memory |
| Linked Lists | O(n) | Extra pointer overhead |
| Hash Tables/Sets | O(n) | Load factor affects actual space |
| Stacks/Queues | O(n) | Depends on implementation |
| Binary Trees | O(n) | Extra pointer overhead |
| Graphs (Adj List) | O(V + E) | Efficient for sparse graphs |
| Graphs (Adj Matrix) | O(V²) | Efficient for dense graphs |
| Heaps | O(n) | Array-based implementation |

### Key Performance Considerations

**When to choose each structure:**

- **Arrays/Lists**: Random access, cache efficiency
- **Linked Lists**: Frequent insertions/deletions
- **Hash Tables**: Fast lookups, uniqueness
- **Sets**: Membership testing, set operations  
- **Stacks**: LIFO operations, recursion simulation
- **Queues**: FIFO operations, BFS, task scheduling
- **Trees**: Hierarchical data, sorted operations
- **Graphs**: Relationships, networks, dependencies
- **Heaps**: Priority queues, partial sorting

**Legend:**
- **n**: number of elements
- **V**: number of vertices (nodes)
- **E**: number of edges
- **h**: height of tree
- **w**: maximum width of tree level
- **k**: size of output/slice
- **d**: degree of d-ary heap
- **α(n)**: inverse Ackermann function (practically constant)
