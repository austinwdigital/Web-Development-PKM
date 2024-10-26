# CSS Selectors and Specificity

**Date**: 2024/10/26
**Topic**: CSS Selectors and Specificity
**Tags**: #css #selectors #specificity

---

## 1. Key Concepts

- [x] Basic Selectors: Element, Class, ID
- [x] Combinators: Descendant, Child, Adjacent Sibling, General Sibling
- [x] Attribute Selectors: Matching attribute values
- [x] Pseudo-classes: Selecting elements based on state
- [x] Pseudo-elements: Styling part of an element
- [x] Specificity: Determining which styles are applied
- [x] Cascade: Order of CSS rule application

> Summary: CSS selectors target HTML elements for styling, while specificity determines which styles take precedence when multiple rules apply to the same element.

---

## 2. Detailed Notes

### 2.1. Types of Selectors

1. **Basic Selectors**:
   - Element: `p`, `div`, `span`
   - Class: `.classname`
   - ID: `#idname`

2. **Combinators**:
   - Descendant: `div p`
   - Child: `ul > li`
   - Adjacent Sibling: `h1 + p`
   - General Sibling: `h1 ~ p`

3. **Attribute Selectors**:
   - `[attribute]`
   - `[attribute="value"]`
   - `[attribute~="value"]`
   - `[attribute^="value"]`
   - `[attribute$="value"]`
   - `[attribute*="value"]`

4. **Pseudo-classes**:
   - `:hover`, `:focus`, `:first-child`, `:nth-child()`

5. **Pseudo-elements**:
   - `::before`, `::after`, `::first-line`, `::first-letter`

### 2.2. Specificity

Specificity is calculated as follows (from highest to lowest):

1. Inline styles
2. IDs
3. Classes, attributes, and pseudo-classes
4. Elements and pseudo-elements

### 2.3. Example

```css
/* Specificity: 0-0-1 */
p {
  color: black;
}

/* Specificity: 0-1-0 */
.text {
  color: blue;
}

/* Specificity: 1-0-0 */
#unique {
  color: red;
}

/* Specificity: 0-1-1 */
p.text {
  color: green;
}
```

### 2.4. Best Practices

1. Avoid using IDs for styling when possible.
2. Use classes for reusable styles.
3. Keep selectors as simple and shallow as possible.
4. Utilize the cascade to your advantage.
5. Be cautious with `!important` declarations.

---

## 3. Useful Resources

- [MDN Web Docs - CSS Selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors)
- [CSS-Tricks - Specifics on CSS Specificity](https://css-tricks.com/specifics-on-css-specificity/)
- [Specificity Calculator](https://specificity.keegan.st/)

---

## 4. Practice Problems

### Problem 1

- **Description**: Write a CSS selector that targets all `<a>` elements that are direct children of `<li>` elements within a `<nav>` element, but only when they are being hovered over.

- **Solution**:

```css
nav > li > a:hover {
  /* styles here */
}
```

### Problem 2

- **Description**: Create a selector that targets every odd paragraph within a div with the class "content", but only if it's not the first child.

- **Solution**:

```css
.content p:nth-child(odd):not(:first-child) {
  /* styles here */
}
```

---

## 5. Questions & Further Study

- Question 1: How does the usage of CSS custom properties (variables) affect specificity?
- Question 2: What are the performance implications of using highly specific selectors versus more general ones?

> Additional Notes: Explore the concept of the "Shadow DOM" and how it affects CSS scoping and specificity.

---

## 6. Reflection

- What did I learn from studying this topic? CSS selectors and specificity are crucial for creating maintainable and predictable stylesheets.
- How confident do I feel about this topic now? Comfortable with basic and intermediate concepts, but need more practice with complex selector combinations and specificity calculations.
- What should I review next? Dive deeper into advanced selector techniques and explore methodologies for managing specificity in large projects.

