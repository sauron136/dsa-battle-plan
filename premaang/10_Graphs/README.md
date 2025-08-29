# Graphs

Graphs are nodes connected by edges, can be directed/undirected, weighted. Useful for networks, paths. Operations use adjacency lists/matrices (space O(V+E) list, O(V^2) matrix).

## Key Operations
- **Traversal (BFS/DFS)**: Visiting nodes. Time: O(V + E), Space: O(V).
- **Insertion (Add Edge/Node)**: Adding connections. Time: O(1) list, O(1) matrix; Space: O(1).
- **Deletion (Remove Edge/Node)**: Removing connections. Time: O(E) list (search), O(1) matrix; Space: O(1).
- **Shortest Path**: Finding min path (Dijkstra, BFS). Time: O((V+E) log V) Dijkstra with heap, O(V+E) BFS; Space: O(V).
- **Cycle Detection**: Finding cycles. Time: O(V + E), Space: O(V).
