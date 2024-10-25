# Template Literals Overview

**Date**: 2024/10/25
**Topic**: Template Literals
**Tags**: #learning #es6plus #template-literals #javascript

---

## 1. Key Concepts

- [x] String Interpolation: Embed expressions within string literals
- [x] Multi-line Strings: Create multi-line strings without escape characters
- [x] Tagged Templates: Customize string construction using a function

> Summary: Template literals provide a more powerful way to work with strings in JavaScript, allowing for easy interpolation, multi-line strings, and advanced string processing through tagged templates.

---

## 2. Detailed Notes

### 2.1. Introduction to Template Literals

- **Definition**: Template literals are string literals that allow embedded expressions and multi-line strings.
- **Why it's important**: They make it easier to create complex strings and can improve code readability.
- **Use cases**: Dynamic string creation, HTML templating, multi-line strings, and advanced string processing.

### 2.2. Examples

```javascript
// Basic string interpolation
const name = "Alice";
console.log(`Hello, ${name}!`); // Outputs: Hello, Alice!

// Multi-line strings
const multiLine = `
  This is a
  multi-line
  string.
`;
console.log(multiLine);

// Expression interpolation
const a = 5, b = 10;
console.log(`Fifteen is ${a + b} and not ${2 * a + b}.`);

// Tagged templates
function myTag(strings, ...values) {
  return strings.reduce((result, str, i) => 
    `${result}${str}${values[i] ? `(${values[i]})` : }`, );
}

const tagResult = myTag`Hello ${name}, you are ${age} years old.`;
console.log(tagResult); // Outputs: Hello (Alice), you are (30) years old.
```

Explanation of the examples:
- The first example shows basic string interpolation.
- The second demonstrates multi-line strings without escape characters.
- The third shows how expressions can be embedded and evaluated within the string.
- The last example demonstrates a tagged template, where a function processes the template literal.

### 2.3. Challenges and Considerations

- Browser support: Ensure compatibility with older browsers if not using a transpiler.
- Escaping backticks: Use backslash to escape backticks within template literals.
- Performance: Complex interpolations might have a slight performance overhead.

---

## 3. Useful Resources

- [MDN Web Docs - Template literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals)
- [JavaScript.info - Template literals](https://javascript.info/string#backticks)
- [Exploring JS - Template literals](https://exploringjs.com/es6/ch_template-literals.html)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a function that generates an HTML table row using template literals.

```javascript
function createTableRow(name, age, email) {
  // Your code here
}

console.log(createTableRow("John Doe", 30, "john@example.com"));
// Should output: <tr><td>John Doe</td><td>30</td><td>john@example.com</td></tr>
```

- **Solution**:

```javascript
function createTableRow(name, age, email) {
  return `<tr><td>${name}</td><td>${age}</td><td>${email}</td></tr>`;
}
```

### Problem 2

- **Description**: Implement a tagged template function that escapes HTML special characters in interpolated values.
- **Solution**:

```javascript
function escapeHTML(strings, ...values) {
  const escapeChars = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;\
  };
  return strings.reduce((result, str, i) => {
    const value = values[i] || '';
    const escaped = String(value).replace(/[&<>"']/g, char => escapeChars[char]);
    return `${result}${str}${escaped}`;
  }, '');
}

const userName = "John <script>alert(XSS)</script>";
console.log(escapeHTML`<h1>Hello, ${userName}!</h1>`);
// Outputs: <h1>Hello, John &lt;script&gt;alert(XSS)&lt;/script&gt;!</h1>
```

---

## 5. Questions & Further Study

- Question 1: How do template literals differ from string concatenation in terms of performance?
- Question 2: Can you use template literals for creating dynamic function names or property accessors?

> Additional Notes: Explore more advanced use cases of tagged templates, such as internationalization or SQL query builders.

---

## 6. Reflection

- What did I learn from studying this topic? Template literals provide a powerful and flexible way to work with strings in JavaScript, offering both simplicity for basic use cases and advanced functionality through tagged templates.
- How confident do I feel about this topic now? Comfortable with basic usage and string interpolation, but need more practice with advanced tagged template scenarios.
- What should I review next? Dive deeper into the use of tagged templates for domain-specific languages (DSLs) and explore how they can be used in real-world applications.

