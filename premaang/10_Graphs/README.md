# Graphs

Graphs are nodes connected by edges, can be directed/undirected, weighted. Useful for networks, paths. Operations use adjacency lists/matrices (space O(V+E) list, O(V^2) matrix).

## Key Operations
- **Traversal (BFS/DFS)**: Visiting nodes. Time: O(V + E), Space: O(V).
- **Insertion (Add Edge/Node)**: Adding connections. Time: O(1) list, O(1) matrix; Space: O(1).
- **Deletion (Remove Edge/Node)**: Removing connections. Time: O(E) list (search), O(1) matrix; Space: O(1).
- **Shortest Path**: Finding min path (Dijkstra, BFS). Time: O((V+E) log V) Dijkstra with heap, O(V+E) BFS; Space: O(V).
- **Cycle Detection**: Finding cycles. Time: O(V + E), Space: O(V).


## Graphs

| Operation | Adjacency List | Adjacency Matrix | Space Complexity | Use Case |
|-----------|----------------|------------------|------------------|----------|
| Add Vertex | O(1) | O(V²) | O(1) vs O(V²) | Adding node |
| Add Edge | O(1) | O(1) | O(1) | Connecting nodes |
| Remove Vertex | O(V + E) | O(V²) | - | Removing node |
| Remove Edge | O(E) | O(1) | - | Disconnecting nodes |
| Check Adjacent | O(V) | O(1) | O(1) | Testing connection |
| Find All Neighbors | O(V) | O(V) | O(V) | Getting connections |

### Graph Algorithms
| Algorithm | Time Complexity | Space Complexity | Use Case |
|-----------|-----------------|------------------|----------|
| DFS (Depth-First Search) | O(V + E) | O(V) | Path finding, cycle detection |
| BFS (Breadth-First Search) | O(V + E) | O(V) | Shortest path (unweighted) |
| Dijkstra's Algorithm | O((V + E) log V) | O(V) | Shortest path (weighted) |
| Bellman-Ford | O(V × E) | O(V) | Shortest path (negative weights) |
| Floyd-Warshall | O(V³) | O(V²) | All-pairs shortest path |
| Topological Sort | O(V + E) | O(V) | Dependency resolution |
| Union-Find | O(α(n)) amortized | O(V) | Cycle detection, MST |

**Key Notes:**
- **Adjacency List**: Better for sparse graphs (fewer edges), O(V + E) space
- **Adjacency Matrix**: Better for dense graphs (many edges), O(V²) space
- **V** = vertices (nodes), **E** = edges (connections)
- Choose representation based on graph density and operation frequency
- α(n) is inverse Ackermann function (practically constant)
