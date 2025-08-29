# Strings

Strings are sequences of characters, treated as immutable arrays in Python. They support O(1) access but are immutable, so modifications create new strings (O(n) time). Common for text manipulation, pattern matching.

## Key Operations
- **Traversal/Concatenation**: Iterating or building new strings. Time: O(n), Space: O(n) for new string.
- **Search/Substring**: Finding patterns or substrings. Time: O(n) linear, O(n+m) KMP; Space: O(1).
- **Replacement/Modification**: Replacing characters or substrings. Time: O(n), Space: O(n).
- **Sorting/Counting**: Sorting characters or counting frequencies. Time: O(n log n) sort, O(n) count; Space: O(n).
- **Palindrome/Anagram Checks**: Checking symmetries or permutations. Time: O(n), Space: O(1) or O(26) for chars.

# String Operations in Python

This document provides comprehensive examples of fundamental string operations in Python, with time and space complexity analysis for each operation.

## 1. Traversal/Concatenation
**Time Complexity: O(n), Space Complexity: O(n) for new string**

```python
def traverse_string(s):
    """Visit each character in the string - like a teacher reading each letter in a student's name."""
    char_count = {}
    for char in s:
        print(f"Current character: '{char}'")
        char_count[char] = char_count.get(char, 0) + 1
    return char_count

def traverse_with_index(s):
    """Traverse string with index access - useful for position-dependent operations."""
    for i in range(len(s)):
        print(f"Index {i}: '{s[i]}'")

def string_concatenation_efficient(words):
    """Efficiently concatenate multiple strings using join() - O(n) total time."""
    # Using join() is more efficient than repeated += operations
    return ''.join(words)

def string_concatenation_inefficient(words):
    """Inefficient concatenation using += - O(n²) time due to string immutability."""
    result = ""
    for word in words:
        result += word  # Creates new string each time!
    return result

def build_string_with_separator(words, separator=" "):
    """Build string with custom separator - like creating a class roster."""
    return separator.join(words)

# Example usage
text = "Hello"
char_frequency = traverse_string(text)
print(f"Character frequencies: {char_frequency}")

student_names = ["Alice", "Bob", "Charlie", "Diana"]
roster = string_concatenation_efficient(student_names)
print(f"Class roster: {roster}")
print(f"Formatted roster: {build_string_with_separator(student_names, ', ')}")
```

## 2. Search/Substring Operations
**Linear Search: Time O(n), KMP Algorithm: Time O(n+m), Space O(1)**

```python
def find_substring(text, pattern):
    """Find first occurrence of pattern in text - like finding a word in an essay."""
    # Built-in method (uses optimized algorithm)
    index = text.find(pattern)
    return index if index != -1 else None

def find_all_occurrences(text, pattern):
    """Find all occurrences of pattern in text."""
    occurrences = []
    start = 0

    while True:
        index = text.find(pattern, start)
        if index == -1:
            break
        occurrences.append(index)
        start = index + 1  # Move past current match

    return occurrences

def naive_pattern_search(text, pattern):
    """Implement naive pattern matching algorithm."""
    matches = []
    n, m = len(text), len(pattern)

    for i in range(n - m + 1):
        # Check if pattern matches at current position
        if text[i:i + m] == pattern:
            matches.append(i)

    return matches

def contains_substring(text, pattern):
    """Check if text contains pattern - returns boolean."""
    return pattern in text

def starts_with_prefix(text, prefix):
    """Check if string starts with given prefix."""
    return text.startswith(prefix)

def ends_with_suffix(text, suffix):
    """Check if string ends with given suffix."""
    return text.endswith(suffix)

# Example usage
essay = "The quick brown fox jumps over the lazy dog. The fox is quick."
word = "fox"

print(f"First occurrence of '{word}': {find_substring(essay, word)}")
print(f"All occurrences of '{word}': {find_all_occurrences(essay, word)}")
print(f"Naive search results: {naive_pattern_search(essay, word)}")
print(f"Contains 'quick': {contains_substring(essay, 'quick')}")
print(f"Starts with 'The': {starts_with_prefix(essay, 'The')}")
print(f"Ends with 'quick.': {ends_with_suffix(essay, 'quick.')}")
```

## 3. Replacement/Modification Operations
**Time Complexity: O(n), Space Complexity: O(n)**

```python
def replace_character(text, old_char, new_char):
    """Replace all occurrences of a character - like correcting spelling mistakes."""
    return text.replace(old_char, new_char)

def replace_substring(text, old_substr, new_substr):
    """Replace all occurrences of a substring."""
    return text.replace(old_substr, new_substr)

def replace_first_n(text, old_substr, new_substr, count):
    """Replace only first n occurrences."""
    return text.replace(old_substr, new_substr, count)

def remove_spaces(text):
    """Remove all whitespace characters."""
    return text.replace(" ", "")

def normalize_whitespace(text):
    """Replace multiple spaces with single space and strip ends."""
    import re
    # Replace multiple whitespace with single space
    normalized = re.sub(r'\s+', ' ', text)
    return normalized.strip()

def custom_character_replacement(text, replacements):
    """Apply multiple character replacements using translation table."""
    # Create translation table for efficient replacement
    translation_table = str.maketrans(replacements)
    return text.translate(translation_table)

def reverse_string(text):
    """Reverse the entire string - like reading a name backwards."""
    return text[::-1]

def capitalize_words(text):
    """Capitalize first letter of each word - like formatting student names."""
    return text.title()

# Example usage
student_essay = "the quick  brown   fox jumps"
print(f"Original: '{student_essay}'")
print(f"Replace 'quick' with 'fast': '{replace_substring(student_essay, 'quick', 'fast')}'")
print(f"Remove spaces: '{remove_spaces(student_essay)}'")
print(f"Normalize whitespace: '{normalize_whitespace(student_essay)}'")
print(f"Reversed: '{reverse_string(student_essay)}'")
print(f"Title case: '{capitalize_words(student_essay)}'")

# Multiple character replacements
grade_text = "Student got A+ in Math and B- in Science"
grade_replacements = {'+': ' Plus', '-': ' Minus'}
formatted_grades = custom_character_replacement(grade_text, grade_replacements)
print(f"Formatted grades: '{formatted_grades}'")
```

## 4. Sorting/Counting Operations
**Sorting: Time O(n log n), Counting: Time O(n), Space O(n)**

```python
def sort_string_characters(text):
    """Sort all characters in string - like alphabetizing letters in a word."""
    return ''.join(sorted(text))

def sort_words_in_string(text):
    """Sort words in a sentence alphabetically."""
    words = text.split()
    sorted_words = sorted(words)
    return ' '.join(sorted_words)

def count_character_frequency(text):
    """Count frequency of each character - like grading letter distribution."""
    frequency = {}
    for char in text:
        frequency[char] = frequency.get(char, 0) + 1
    return frequency

def count_character_frequency_counter(text):
    """Count using Counter class for cleaner code."""
    from collections import Counter
    return Counter(text)

def count_words(text):
    """Count frequency of each word."""
    from collections import Counter
    words = text.lower().split()
    return Counter(words)

def count_vowels_consonants(text):
    """Count vowels and consonants separately."""
    text = text.lower()
    vowels = "aeiou"
    vowel_count = sum(1 for char in text if char in vowels)
    consonant_count = sum(1 for char in text if char.isalpha() and char not in vowels)
    return vowel_count, consonant_count

def most_frequent_character(text):
    """Find the most frequently occurring character."""
    from collections import Counter
    if not text:
        return None

    char_count = Counter(char for char in text if char.isalpha())
    if not char_count:
        return None

    return char_count.most_common(1)[0]

def sort_by_frequency(text):
    """Sort characters by their frequency (descending)."""
    from collections import Counter
    char_count = Counter(text)
    # Sort by frequency (descending), then alphabetically
    sorted_chars = sorted(char_count.items(), key=lambda x: (-x[1], x[0]))
    return sorted_chars

# Example usage
student_name = "Mississippi"
print(f"Original: '{student_name}'")
print(f"Sorted characters: '{sort_string_characters(student_name)}'")

sentence = "the quick brown fox jumps"
print(f"Original sentence: '{sentence}'")
print(f"Sorted words: '{sort_words_in_string(sentence)}'")

char_freq = count_character_frequency(student_name)
print(f"Character frequencies: {char_freq}")

vowel_count, consonant_count = count_vowels_consonants(student_name)
print(f"Vowels: {vowel_count}, Consonants: {consonant_count}")

most_freq = most_frequent_character(student_name)
print(f"Most frequent character: '{most_freq[0]}' appears {most_freq[1]} times")

freq_sorted = sort_by_frequency(student_name)
print(f"Characters by frequency: {freq_sorted}")
```

## 5. Palindrome/Anagram Checks
**Time Complexity: O(n), Space Complexity: O(1) or O(26) for character sets**

```python
def is_palindrome_simple(text):
    """Check if string is palindrome - reads same forwards and backwards."""
    # Simple comparison with reversed string
    cleaned = text.lower().replace(" ", "")
    return cleaned == cleaned[::-1]

def is_palindrome_two_pointers(text):
    """Check palindrome using two pointers - more space efficient."""
    # Clean the string: remove non-alphanumeric and convert to lowercase
    cleaned = ''.join(char.lower() for char in text if char.isalnum())

    left, right = 0, len(cleaned) - 1

    while left < right:
        if cleaned[left] != cleaned[right]:
            return False
        left += 1
        right -= 1

    return True

def is_anagram(str1, str2):
    """Check if two strings are anagrams - like checking if student names use same letters."""
    # Remove spaces and convert to lowercase
    clean1 = str1.replace(" ", "").lower()
    clean2 = str2.replace(" ", "").lower()

    # Quick length check
    if len(clean1) != len(clean2):
        return False

    # Sort characters and compare
    return sorted(clean1) == sorted(clean2)

def is_anagram_counting(str1, str2):
    """Check anagram using character counting - O(n) time, O(1) space for alphabet."""
    from collections import Counter

    # Clean and normalize
    clean1 = ''.join(char.lower() for char in str1 if char.isalpha())
    clean2 = ''.join(char.lower() for char in str2 if char.isalpha())

    return Counter(clean1) == Counter(clean2)

def find_anagrams_in_list(target, word_list):
    """Find all anagrams of target word in a list."""
    def normalize(word):
        return sorted(word.lower().replace(" ", ""))

    target_normalized = normalize(target)
    anagrams = []

    for word in word_list:
        if normalize(word) == target_normalized and word.lower() != target.lower():
            anagrams.append(word)

    return anagrams

def longest_palindromic_substring(text):
    """Find the longest palindromic substring."""
    if not text:
        return ""

    def expand_around_center(left, right):
        while left >= 0 and right < len(text) and text[left] == text[right]:
            left -= 1
            right += 1
        return text[left + 1:right]

    longest = ""

    for i in range(len(text)):
        # Check for odd-length palindromes (center at i)
        palindrome1 = expand_around_center(i, i)
        # Check for even-length palindromes (center between i and i+1)
        palindrome2 = expand_around_center(i, i + 1)

        # Keep track of the longest palindrome found
        for palindrome in [palindrome1, palindrome2]:
            if len(palindrome) > len(longest):
                longest = palindrome

    return longest

def group_anagrams(words):
    """Group words that are anagrams of each other."""
    from collections import defaultdict

    anagram_groups = defaultdict(list)

    for word in words:
        # Use sorted characters as key
        key = ''.join(sorted(word.lower()))
        anagram_groups[key].append(word)

    # Return only groups with more than one word
    return [group for group in anagram_groups.values() if len(group) > 1]

# Example usage
print("=== Palindrome Checks ===")
test_palindromes = ["racecar", "A man a plan a canal Panama", "hello", "Madam"]
for text in test_palindromes:
    result1 = is_palindrome_simple(text)
    result2 = is_palindrome_two_pointers(text)
    print(f"'{text}' - Simple: {result1}, Two-pointers: {result2}")

print("\n=== Anagram Checks ===")
anagram_pairs = [
    ("listen", "silent"),
    ("evil", "vile"),
    ("hello", "world"),
    ("The Eyes", "They See")
]

for str1, str2 in anagram_pairs:
    result1 = is_anagram(str1, str2)
    result2 = is_anagram_counting(str1, str2)
    print(f"'{str1}' & '{str2}' - Sorting: {result1}, Counting: {result2}")

print("\n=== Advanced Operations ===")
test_string = "babad"
longest_pal = longest_palindromic_substring(test_string)
print(f"Longest palindrome in '{test_string}': '{longest_pal}'")

word_list = ["eat", "tea", "tan", "ate", "nat", "bat"]
anagram_groups = group_anagrams(word_list)
print(f"Anagram groups: {anagram_groups}")

target_word = "listen"
candidates = ["silent", "hello", "enlist", "world", "tinsel"]
found_anagrams = find_anagrams_in_list(target_word, candidates)
print(f"Anagrams of '{target_word}': {found_anagrams}")
```

## Testing Examples

```python
def run_string_operations_demo():
    """Run comprehensive demo of all string operations."""
    print("=== String Operations Demo ===\n")

    # Test data
    sample_text = "The quick brown fox jumps over the lazy dog"

    print("1. Traversal/Concatenation:")
    words = sample_text.split()
    concatenated = string_concatenation_efficient(words[:3])
    print(f"First 3 words joined: '{concatenated}'")

    print("\n2. Search/Substring:")
    pattern = "quick"
    position = find_substring(sample_text, pattern)
    print(f"'{pattern}' found at position: {position}")

    print("\n3. Replacement/Modification:")
    modified = replace_substring(sample_text, "fox", "cat")
    print(f"After replacement: '{modified}'")

    print("\n4. Sorting/Counting:")
    word_count = count_words(sample_text)
    print(f"Word frequencies: {dict(word_count.most_common(5))}")

    print("\n5. Palindrome/Anagram:")
    palindrome_test = "A man a plan a canal Panama"
    is_pal = is_palindrome_two_pointers(palindrome_test)
    print(f"'{palindrome_test}' is palindrome: {is_pal}")

    anagram_test1, anagram_test2 = "listen", "silent"
    is_anag = is_anagram(anagram_test1, anagram_test2)
    print(f"'{anagram_test1}' and '{anagram_test2}' are anagrams: {is_anag}")

def performance_comparison_demo():
    """Demonstrate performance differences between string operations."""
    import time

    print("\n=== Performance Comparison ===")

    # String concatenation comparison
    words = ["word"] * 1000

    # Efficient concatenation
    start_time = time.time()
    result1 = string_concatenation_efficient(words)
    efficient_time = time.time() - start_time

    print(f"Efficient concatenation (join): {efficient_time:.6f} seconds")
    print("Note: Inefficient concatenation demo skipped (would be much slower)")

    # Search algorithm comparison
    text = "a" * 10000 + "pattern" + "b" * 1000
    pattern = "pattern"

    start_time = time.time()
    pos1 = find_substring(text, pattern)
    builtin_time = time.time() - start_time

    start_time = time.time()
    pos2 = naive_pattern_search(text, pattern)
    naive_time = time.time() - start_time

    print(f"Built-in find(): {builtin_time:.6f} seconds")
    print(f"Naive search: {naive_time:.6f} seconds")

if __name__ == "__main__":
    run_string_operations_demo()
    performance_comparison_demo()
```

## Common String Patterns for Coding Interviews

```python
def sliding_window_substring(s, pattern):
    """Find minimum window substring containing all characters of pattern."""
    from collections import Counter, defaultdict

    if len(pattern) > len(s):
        return ""

    pattern_count = Counter(pattern)
    window_count = defaultdict(int)

    left = 0
    min_len = float('inf')
    min_start = 0
    formed = 0
    required = len(pattern_count)

    for right in range(len(s)):
        char = s[right]
        window_count[char] += 1

        if char in pattern_count and window_count[char] == pattern_count[char]:
            formed += 1

        while left <= right and formed == required:
            if right - left + 1 < min_len:
                min_len = right - left + 1
                min_start = left

            char = s[left]
            window_count[char] -= 1
            if char in pattern_count and window_count[char] < pattern_count[char]:
                formed -= 1

            left += 1

    return s[min_start:min_start + min_len] if min_len != float('inf') else ""

def longest_substring_without_repeating(s):
    """Find length of longest substring without repeating characters."""
    char_index = {}
    left = 0
    max_length = 0

    for right in range(len(s)):
        if s[right] in char_index and char_index[s[right]] >= left:
            left = char_index[s[right]] + 1

        char_index[s[right]] = right
        max_length = max(max_length, right - left + 1)

    return max_length

# Example usage of interview patterns
print("\n=== Interview Pattern Examples ===")
text = "ADOBECODEBANC"
pattern = "ABC"
min_window = sliding_window_substring(text, pattern)
print(f"Minimum window substring: '{min_window}'")

test_string = "abcabcbb"
longest_unique = longest_substring_without_repeating(test_string)
print(f"Longest substring without repeating chars: {longest_unique}")
```

## Complexity Summary

| Operation | Time Complexity | Space Complexity | Use Case |
|-----------|----------------|------------------|----------|
| Traversal | O(n) | O(1) | Processing all characters |
| String Concatenation (join) | O(n) | O(n) | Efficient string building |
| String Concatenation (+=) | O(n²) | O(n²) | Inefficient - avoid in loops |
| Substring Search | O(n) | O(1) | Finding patterns |
| Character Replacement | O(n) | O(n) | String modifications |
| Sorting Characters | O(n log n) | O(n) | Anagram detection |
| Character Counting | O(n) | O(k) where k=alphabet size | Frequency analysis |
| Palindrome Check | O(n) | O(1) | Symmetry detection |
| Anagram Check | O(n) | O(k) where k=alphabet size | Permutation detection |

These examples cover the fundamental string operations essential for coding interviews and text processing applications. Each operation is implemented with optimal complexity and includes practical use cases.
