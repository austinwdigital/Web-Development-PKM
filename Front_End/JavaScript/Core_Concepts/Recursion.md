# Recursion Overview

**Date**: 2024/10/25
**Topic**: Recursion
**Tags**: #learning #recursion #javascript

---

## 1. Key Concepts

- [x] Self-Referential Functions: A function that calls itself.
- [x] Base Case: The condition that stops the recursion.
- [x] Recursive Case: The part of the function that makes the recursive call.

> Summary: Recursion is a programming technique where a function calls itself to solve a problem by breaking it down into smaller, similar sub-problems.

---

## 2. Detailed Notes

### 2.1. Introduction to Recursion

- **Definition**: Recursion is a method of solving a problem where the solution depends on solutions to smaller instances of the same problem.
- **Why it's important**: Recursion can provide elegant solutions to complex problems, especially those with recursive structures like trees or graphs.
- **Use cases**: Tree traversal, searching algorithms, mathematical computations, and problems that can be divided into similar sub-problems.

### 2.2. Examples

```javascript
function factorial(n) {
  // Base case
  if (n === 0 || n === 1) {
    return 1;
  }
  // Recursive case
  return n * factorial(n - 1);
}

console.log(factorial(5)); // Outputs: 120
```

Explanation of the example:

- The base case is when `n` is 0 or 1, which returns 1.
- For other values, the function calls itself with `n - 1` and multiplies the result by `n`.
- This process continues until it reaches the base case.

### 2.3. Challenges and Considerations

- Stack overflow: Deep recursion can lead to stack overflow errors.
- Performance: Recursive solutions can be slower and more memory-intensive than iterative solutions for some problems.
- Readability: While often elegant, deeply nested recursive calls can be hard to follow.

---

## 3. Useful Resources

- [MDN Web Docs - Recursion](https://developer.mozilla.org/en-US/docs/Glossary/Recursion)
- [JavaScript.info - Recursion and stack](https://javascript.info/recursion)
- [FreeCodeCamp - Recursion in JavaScript](https://www.freecodecamp.org/news/recursion-in-javascript/)

---

## 4. Practice Problems

### Problem 1

- **Description**: Implement a recursive function to calculate the nth Fibonacci number.

```javascript
function fibonacci(n) {
  // Your code here
}

console.log(fibonacci(7)); // Should output: 13
```

- **Solution**:

```javascript
function fibonacci(n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}
```

### Problem 2

- **Description**: Write a recursive function to flatten a nested array.
- **Solution**:

```javascript
function flattenArray(arr) {
  return arr.reduce((flat, toFlatten) => {
    return flat.concat(Array.isArray(toFlatten) ? flattenArray(toFlatten) : toFlatten);
  }, []);
}

console.log(flattenArray([1, [2, [3, 4], 5], 6])); // [1, 2, 3, 4, 5, 6]
```

---

## 5. Questions & Further Study

- Question 1: How can you optimize recursive functions to avoid stack overflow?
- Question 2: In what scenarios would you choose recursion over iteration?

> Additional Notes: Look into tail call optimization and how it relates to recursion in JavaScript.

---

## 6. Reflection

- What did I learn from studying this topic? Recursion is a powerful technique but requires careful consideration of base cases and efficiency.
- How confident do I feel about this topic now? Comfortable with basic recursive problems, need more practice with complex scenarios.
- What should I review next? Explore advanced recursive patterns and their applications in real-world programming challenges.

