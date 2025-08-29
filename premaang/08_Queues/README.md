# Queues

Queues are FIFO collections with O(1) enqueue/dequeue. In Python, use collections.deque. Useful for BFS, level order, sliding windows.

## Key Operations
- **Enqueue**: Add to rear. Time: O(1), Space: O(1).
- **Dequeue**: Remove from front. Time: O(1), Space: O(1).
- **Peek/Front**: Get front without remove. Time: O(1), Space: O(1).
- **IsEmpty**: Check empty. Time: O(1), Space: O(1).
- **Monotonic Queue**: Maintain order for max/min in window. Time: O(n) overall, Space: O(n).
