# Hoisting Overview

**Date**: 2024/10/25
**Topic**: Hoisting
**Tags**: #learning #hoisting #javascript

---

## 1. Key Concepts

- [x] Variable Hoisting: Declaration of variables are moved to the top of their scope.
- [x] Function Hoisting: Function declarations are hoisted completely.
- [x] Temporal Dead Zone (TDZ): The period between entering scope and being declared where let and const variables cannot be accessed.

> Summary: Hoisting is JavaScript's default behavior of moving declarations to the top of the current scope before code execution.

---

## 2. Detailed Notes

### 2.1. Introduction to Hoisting

- **Definition**: Hoisting is a JavaScript mechanism where variables and function declarations are moved to the top of their respective scopes during the compilation phase, before the code is executed.
- **Why it's important**: Understanding hoisting is crucial for avoiding unexpected behavior and bugs in JavaScript code.
- **Use cases**: While hoisting itself is not a feature to be used, understanding it helps in writing more predictable code and debugging issues related to variable and function declarations.

### 2.2. Examples

```javascript
console.log(x); // Outputs: undefined
var x = 5;

// The above is interpreted as:
// var x;
// console.log(x);
// x = 5;

// Function hoisting
sayHello(); // Outputs: "Hello!"

function sayHello() {
  console.log("Hello!");
}

// let and const
console.log(y); // Throws ReferenceError
let y = 10;
```

Explanation of the example:

- `var` declarations are hoisted and initialized with `undefined`.
- Function declarations are hoisted entirely.
- `let` and `const` declarations are hoisted but not initialized, resulting in a Temporal Dead Zone.

### 2.3. Challenges and Considerations

- Unexpected behavior: Hoisting can lead to confusion if not well understood.
- `let` and `const`: These introduce block scoping and are not initialized during hoisting, which can lead to TDZ errors.
- Best practices: It's generally recommended to declare variables at the top of their scope to mimic the effect of hoisting and improve code readability.

---

## 3. Useful Resources

- [MDN Web Docs - Hoisting](https://developer.mozilla.org/en-US/docs/Glossary/Hoisting)
- [JavaScript.info - Variable scope, closure](https://javascript.info/closure)
- [W3Schools - JavaScript Hoisting](https://www.w3schools.com/js/js_hoisting.asp)

---

## 4. Practice Problems

### Problem 1

- **Description**: Predict the output of the following code:

```javascript
console.log(foo);
var foo = "bar";
function foo() {
  return "baz";
}
console.log(foo);
```

- **Solution**:

```javascript
// Output:
// [Function: foo]
// "bar"

// Explanation:
// The function declaration is hoisted above the var declaration.
// The var assignment is not hoisted, so the second log shows the assigned string.
```

### Problem 2

- **Description**: Explain why the following code throws an error and how to fix it.
- **Solution**:

```javascript
// Original code (throws error)
console.log(x);
let x = 5;

// Fixed code
let x;
console.log(x); // Outputs: undefined
x = 5;

// Explanation: let declarations are hoisted but not initialized, creating a TDZ.
// To fix, declare the variable before using it.
```

---

## 5. Questions & Further Study

- Question 1: How does hoisting behave differently in strict mode?
- Question 2: Can you explain the concept of the Temporal Dead Zone in more detail?

> Additional Notes: Investigate how hoisting interacts with closures and the module pattern.

---

## 6. Reflection

- What did I learn from studying this topic? Hoisting is a fundamental concept that affects how JavaScript code is interpreted and executed.
- How confident do I feel about this topic now? Comfortable with the basics, but need more practice with complex scenarios involving function expressions and arrow functions.
- What should I review next? Explore how hoisting behaves in different environments (e.g., browsers vs. Node.js) and with different JavaScript versions.
