# CSS Variables (Custom Properties)

**Date**: 2024/10/26
**Topic**: CSS Variables (Custom Properties)
**Tags**: #css #variables #custom-properties

---

## 1. Key Concepts

- [x] Declaration: Using `--` prefix to declare a custom property
- [x] Usage: Accessing custom properties with `var()` function
- [x] Scope: Custom properties are scoped to the element they are declared on
- [x] Inheritance: Custom properties can be inherited by child elements
- [x] Fallback Values: Providing fallback values in case the custom property is not set

> Summary: CSS Variables, also known as Custom Properties, allow for reusable values throughout a stylesheet, enhancing maintainability and flexibility of CSS.

---

## 2. Detailed Notes

### 2.1. Declaring CSS Variables

```css
:root {
  --main-color: #3498db;
  --secondary-color: #2ecc71;
  --font-size: 16px;
}
```

### 2.2. Using CSS Variables

```css
.button {
  background-color: var(--main-color);
  font-size: var(--font-size);
}
```

### 2.3. Scoping

Variables can be scoped to specific elements:

```css
.dark-theme {
  --text-color: white;
  --background-color: black;
}

.light-theme {
  --text-color: black;
  --background-color: white;
}
```

### 2.4. Fallback Values

Provide a fallback value in case the variable is not defined:

```css
.element {
  color: var(--text-color, #333);
}
```

### 2.5. Updating Variables with JavaScript

```javascript
document.documentElement.style.setProperty('--main-color', '#ff0000');
```

---

## 3. Useful Resources

- [MDN Web Docs - Using CSS custom properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties)
- [CSS-Tricks - A Complete Guide to Custom Properties](https://css-tricks.com/a-complete-guide-to-custom-properties/)
- [Smashing Magazine - It's Time To Start Using CSS Custom Properties](https://www.smashingmagazine.com/2017/04/start-using-css-custom-properties/)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a theme switcher using CSS variables for colors and JavaScript to toggle between light and dark themes.

- **Solution**:

```css
:root {
  --bg-color: white;
  --text-color: black;
}

.dark-theme {
  --bg-color: #333;
  --text-color: white;
}

body {
  background-color: var(--bg-color);
  color: var(--text-color);
}
```

```javascript
const toggleTheme = () => {
  document.body.classList.toggle('dark-theme');
}
```

### Problem 2

- **Description**: Implement a dynamic spacing system using CSS variables.

- **Solution**:

```css
:root {
  --spacing-unit: 8px;
}

.margin-small {
  margin: var(--spacing-unit);
}

.margin-medium {
  margin: calc(var(--spacing-unit) * 2);
}

.margin-large {
  margin: calc(var(--spacing-unit) * 3);
}
```

---

## 5. Questions & Further Study

- Question 1: How do CSS Variables compare to preprocessor variables (e.g., in SASS) in terms of functionality and performance?
- Question 2: What are some strategies for organizing and naming CSS Variables in large projects?

> Additional Notes: Explore how CSS Variables can be used in conjunction with CSS calc() for more complex calculations and layouts.

---

## 6. Reflection

- What did I learn from studying this topic? CSS Variables provide a powerful way to create more maintainable and flexible stylesheets, with the added benefit of being able to update them dynamically with JavaScript.
- How confident do I feel about this topic now? Comfortable with basic usage, but need more practice with complex scenarios and large-scale implementations.
- What should I review next? Dive deeper into advanced use cases for CSS Variables, such as creating responsive typography systems or complex theming solutions.

