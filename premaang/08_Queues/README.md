# Queues

Queues are FIFO collections with O(1) enqueue/dequeue. In Python, use collections.deque. Useful for BFS, level order, sliding windows.

## Key Operations
- **Enqueue**: Add to rear. Time: O(1), Space: O(1).
- **Dequeue**: Remove from front. Time: O(1), Space: O(1).
- **Peek/Front**: Get front without remove. Time: O(1), Space: O(1).
- **IsEmpty**: Check empty. Time: O(1), Space: O(1).
- **Monotonic Queue**: Maintain order for max/min in window. Time: O(n) overall, Space: O(n).


## Queues

| Operation | Time Complexity | Space Complexity | Use Case |
|-----------|-----------------|------------------|----------|
| Enqueue (add to rear) | O(1) | O(1) | Adding element |
| Dequeue (remove from front) | O(1) | O(1) | Removing element |
| Front/Peek | O(1) | O(1) | View front element |
| Rear/Back | O(1) | O(1) | View rear element |
| Search | O(n) | O(1) | Finding element |
| Size/IsEmpty | O(1) | O(1) | Checking queue state |

**Key Notes:**
- FIFO (First In, First Out) principle
- In Python, use collections.deque for optimal performance
- Avoid using list.pop(0) - it's O(n) due to shifting elements
- Essential for BFS traversal, task scheduling, buffering, level-order processing
- Priority queues (heapq) for weighted/prioritized processing
- No random access - only front and rear elements are accessible
