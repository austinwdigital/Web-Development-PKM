# Async/Await Overview

**Date**: 2024/10/25
**Topic**: Async/Await
**Tags**: #learning #es6plus #async-await #javascript

---

## 1. Key Concepts

- [x] Asynchronous Functions: Functions declared with the `async` keyword
- [x] Await Operator: Used to wait for a Promise to settle
- [x] Error Handling: Using try/catch blocks with async/await
- [x] Sequential vs Parallel Execution: Managing multiple asynchronous operations

> Summary: Async/await provides a more synchronous-looking way to write asynchronous code, making it easier to read and reason about.

---

## 2. Detailed Notes

### 2.1. Introduction to Async/Await

- **Definition**: Async/await is a syntax for handling Promises in a more synchronous fashion.
- **Why it's important**: It simplifies asynchronous programming, making code more readable and maintainable.
- **Use cases**: API calls, file operations, and any asynchronous operations that would benefit from a more linear code structure.

### 2.2. Examples

```javascript
// Basic async function
async function fetchData() {
  try {
    const response = await fetch('https://api.example.com/data');
    const data = await response.json();
    console.log(data);
  } catch (error) {
    console.error('Error fetching data:', error);
  }
}

// Parallel execution
async function fetchMultipleData() {
  try {
    const [user, posts] = await Promise.all([
      fetch('https://api.example.com/user').then(res => res.json()),
      fetch('https://api.example.com/posts').then(res => res.json())
    ]);
    console.log(user, posts);
  } catch (error) {
    console.error('Error fetching data:', error);
  }
}

// Async arrow function
const fetchUser = async (id) => {
  const response = await fetch(`https://api.example.com/user/${id}`);
  return response.json();
};
```

Explanation of the examples:
- The `fetchData` function shows basic usage of async/await with error handling.
- `fetchMultipleData` demonstrates how to run multiple asynchronous operations in parallel.
- `fetchUser` shows how to use async/await with arrow functions.

### 2.3. Challenges and Considerations

- Error propagation: Errors in async functions are turned into rejected Promises.
- Avoiding blocking: Be cautious of unnecessarily sequential operations.
- Browser support: Ensure compatibility with older browsers if not using a transpiler.

---

## 3. Useful Resources

- [MDN Web Docs - Async function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function)
- [JavaScript.info - Async/await](https://javascript.info/async-await)
- [Google Developers - Async functions](https://developers.google.com/web/fundamentals/primers/async-functions)

---

## 4. Practice Problems

### Problem 1

- **Description**: Refactor the following Promise-based code to use async/await:

```javascript
function fetchUserData(userId) {
  return fetch(`https://api.example.com/user/${userId}`)
    .then(response => response.json())
    .then(user => {
      return fetch(`https://api.example.com/posts?userId=${user.id}`);
    })
    .then(response => response.json())
    .then(posts => {
      console.log('User:', user);
      console.log('Posts:', posts);
    })
    .catch(error => console.error('Error:', error));
}
```

- **Solution**:

```javascript
async function fetchUserData(userId) {
  try {
    const userResponse = await fetch(`https://api.example.com/user/${userId}`);
    const user = await userResponse.json();
    const postsResponse = await fetch(`https://api.example.com/posts?userId=${user.id}`);
    const posts = await postsResponse.json();
    console.log('User:', user);
    console.log('Posts:', posts);
  } catch (error) {
    console.error('Error:', error);
  }
}
```

### Problem 2

- **Description**: Create an async function that fetches data from multiple APIs in parallel and combines the results.
- **Solution**:

```javascript
async function fetchCombinedData(userId) {
  try {
    const [user, posts, todos] = await Promise.all([
      fetch(`https://api.example.com/user/${userId}`).then(res => res.json()),
      fetch(`https://api.example.com/posts?userId=${userId}`).then(res => res.json()),
      fetch(`https://api.example.com/todos?userId=${userId}`).then(res => res.json())
    ]);

    return {
      user,
      posts,
      todos
    };
  } catch (error) {
    console.error('Error fetching data:', error);
    throw error;
  }
}

// Usage
fetchCombinedData(1)
  .then(data => console.log(data))
  .catch(error => console.error(error));
```

---

## 5. Questions & Further Study

- Question 1: How does async/await handle Promise rejection compared to `.catch()` with regular Promises?
- Question 2: What are the performance implications of using async/await versus Promises?

> Additional Notes: Explore how async/await works with loops and how to handle concurrent asynchronous operations efficiently.

---

## 6. Reflection

- What did I learn from studying this topic? Async/await provides a more intuitive way to write asynchronous code, making it easier to understand and maintain.
- How confident do I feel about this topic now? Comfortable with basic usage, but need more practice with complex scenarios and error handling.
- What should I review next? Dive deeper into advanced patterns with async/await, such as handling timeouts and cancellation of async operations.

