# CSS Pseudo-classes and Pseudo-elements

**Date**: 2024/10/26
**Topic**: CSS Pseudo-classes and Pseudo-elements
**Tags**: #css #pseudo-classes #pseudo-elements

---

## 1. Key Concepts

- [x] Pseudo-classes: Select elements based on a specific state
- [x] Pseudo-elements: Create and style a part of an element
- [x] Syntax: Single colon (:) for pseudo-classes, double colon (::) for pseudo-elements
- [x] Common pseudo-classes: :hover, :active, :focus, :nth-child()
- [x] Common pseudo-elements: ::before, ::after, ::first-letter, ::selection

> Summary: Pseudo-classes and pseudo-elements allow for more specific styling without additional markup, enhancing the power and flexibility of CSS.

---

## 2. Detailed Notes

### 2.1. Pseudo-classes

Pseudo-classes select elements based on a state or condition:

```css
/* Style links on hover */
a:hover {
  color: red;
}

/* Style the third child of a parent */
li:nth-child(3) {
  background-color: yellow;
}

/* Style an input when it's focused */
input:focus {
  border-color: blue;
}
```

### 2.2. Pseudo-elements

Pseudo-elements create or style a part of an element:

```css
/* Add content before an element */
.quote::before {
  content: "\201C"; /* Left double quotation mark */
}

/* Style the first letter of a paragraph */
p::first-letter {
  font-size: 2em;
  font-weight: bold;
}

/* Style selected text */
::selection {
  background-color: yellow;
  color: black;
}
```

### 2.3. Combining Pseudo-classes and Pseudo-elements

```css
/* Style the first line of a paragraph on hover */
p:hover::first-line {
  font-weight: bold;
}
```

---

## 3. Useful Resources

- [MDN Web Docs - Pseudo-classes](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes)
- [MDN Web Docs - Pseudo-elements](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements)
- [CSS-Tricks - A Whole Bunch of Amazing Stuff Pseudo Elements Can Do](https://css-tricks.com/pseudo-element-roundup/)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a custom checkbox using pseudo-elements.

- **Solution**:

```css
.custom-checkbox {
  position: relative;
  padding-left: 30px;
  cursor: pointer;
}

.custom-checkbox input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

.custom-checkbox::before {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 20px;
  height: 20px;
  border: 2px solid #333;
  background-color: #fff;
}

.custom-checkbox input:checked ~ ::before {
  background-color: #333;
}

.custom-checkbox input:checked ~ ::after {
  content: "\2713";
  position: absolute;
  left: 5px;
  top: 2px;
  color: #fff;
  font-size: 14px;
}
```

### Problem 2

- **Description**: Style every odd row of a table with a different background color using pseudo-classes.

- **Solution**:

```css
table {
  border-collapse: collapse;
}

tr:nth-child(odd) {
  background-color: #f2f2f2;
}

td, th {
  border: 1px solid #ddd;
  padding: 8px;
}
```

---

## 5. Questions & Further Study

- Question 1: How do browser support and performance considerations differ between pseudo-classes and pseudo-elements?
- Question 2: What are some creative uses of pseudo-elements for enhancing web design without adding extra markup?

> Additional Notes: Explore the newer pseudo-classes like :is(), :where(), and :has() and their implications for CSS specificity.

---

## 6. Reflection

- What did I learn from studying this topic? Pseudo-classes and pseudo-elements provide powerful tools for enhancing the styling and interactivity of web pages without cluttering the HTML.
- How confident do I feel about this topic now? Comfortable with common use cases, but need more practice with advanced selectors and creative applications.
- What should I review next? Dive deeper into complex combinations of pseudo-classes and pseudo-elements, and explore their use in responsive design.

