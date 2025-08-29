# Stacks

Stacks are LIFO collections with O(1) push/pop/top. In Python, use list with append/pop. Useful for undoing, parentheses matching, monotonic patterns.

## Key Operations
- **Push**: Add to top. Time: O(1), Space: O(1).
- **Pop**: Remove from top. Time: O(1), Space: O(1).
- **Peek/Top**: Get top without remove. Time: O(1), Space: O(1).
- **IsEmpty**: Check if empty. Time: O(1), Space: O(1).
- **Monotonic Stack**: Maintain increasing/decreasing order. Time: O(n) overall, Space: O(n).


## Stacks

| Operation | Time Complexity | Space Complexity | Use Case |
|-----------|-----------------|------------------|----------|
| Push (add to top) | O(1) | O(1) | Adding element |
| Pop (remove from top) | O(1) | O(1) | Removing element |
| Peek/Top | O(1) | O(1) | View top element |
| Search | O(n) | O(1) | Finding element |
| Size/IsEmpty | O(1) | O(1) | Checking stack state |

**Key Notes:**
- LIFO (Last In, First Out) principle
- In Python, typically implemented using list with append()/pop() methods
- Can also use collections.deque for consistent O(1) performance
- Essential for function calls, expression evaluation, undo operations, backtracking
- Perfect for problems requiring "most recent first" processing
- No random access - only top element is accessible
