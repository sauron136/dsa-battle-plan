def is_palindrome(word):
    """
    - Goal: Check if a string is palindrome
    Step 1: Put a pointer at both left and right of the word
    Step 2: Move both pointers in opposite directions:
       - left go rightward and right go leftward
    Step 3: As you move them, compare the character found at every position:
        - if they are the same up till both get to the middle, palindrome
        - if they are not the same even from the first char, not palindrome
    Step 4: Return True if palindrome
    """
    left, right = 0, len(word) - 1
    while left < right:
        if word[left] == word[right]:
            left += 1
            right -= 1
        else:
            return False
    return True

if __name__ == "__main__":
    print(is_palindrome("racecar"))
    print(is_palindrome("levels"))

    print(is_palindrome("a"))
    print(is_palindrome(""))
