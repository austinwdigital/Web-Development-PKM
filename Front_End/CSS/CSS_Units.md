# CSS Units

**Date**: 2024/10/26
**Topic**: CSS Units
**Tags**: #css #units #measurements

---

## 1. Key Concepts

- [x] Absolute Units: px, pt, cm, mm, in
- [x] Relative Units: em, rem, %, vh, vw
- [x] Viewport Units: vh, vw, vmin, vmax
- [x] Calc() Function: Perform calculations with different units
- [x] Unit Conversion: Understanding relationships between units

> Summary: CSS units provide various ways to specify sizes and distances, offering flexibility in design and responsiveness.

---

## 2. Detailed Notes

### 2.1. Absolute Units

- Fixed size, regardless of other factors
- Common absolute units:
  - `px` (pixels): 1px = 1/96th of 1in
  - `pt` (points): 1pt = 1/72nd of 1in
  - `cm` (centimeters)
  - `mm` (millimeters)
  - `in` (inches)

```css
.box {
  width: 200px;
  height: 100px;
  border: 1pt solid black;
}
```

### 2.2. Relative Units

- Size relative to another property
- Common relative units:
  - `em`: Relative to the font-size of the element
  - `rem`: Relative to the font-size of the root element
  - `%`: Relative to the parent element
  - `vw`: 1% of viewport width
  - `vh`: 1% of viewport height

```css
.container {
  font-size: 16px;
}

.child {
  font-size: 1.5em; /* 24px */
  width: 50%; /* 50% of parent's width */
  height: 50vh; /* 50% of viewport height */
}
```

### 2.3. Viewport Units

- Relative to the viewport size
- `vw`: 1% of viewport width
- `vh`: 1% of viewport height
- `vmin`: 1% of viewport's smaller dimension
- `vmax`: 1% of viewport's larger dimension

```css
.hero {
  height: 100vh;
  width: 100vw;
}

.square {
  width: 50vmin;
  height: 50vmin;
}
```

### 2.4. Calc() Function

- Perform calculations with different units

```css
.sidebar {
  width: calc(100% - 20px);
}

.responsive-font {
  font-size: calc(16px + 2vw);
}
```

---

## 3. Useful Resources

- [MDN Web Docs - CSS Values and Units](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units)
- [CSS-Tricks - A Complete Guide to CSS Units](https://css-tricks.com/the-lengths-of-css/)
- [W3Schools - CSS Units](https://www.w3schools.com/cssref/css_units.asp)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a responsive container that maintains a 16:9 aspect ratio using CSS units.

- **Solution**:

```css
.aspect-ratio-container {
  width: 100%;
  padding-top: 56.25%; /* 9 / 16 = 0.5625 */
  position: relative;
}

.content {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
}
```

### Problem 2

- **Description**: Implement a fluid typography system using CSS calc() and viewport units.

- **Solution**:

```css
:root {
  font-size: 16px;
}

body {
  font-size: calc(1rem + 0.5vw);
}

h1 {
  font-size: calc(1.5rem + 2vw);
}

h2 {
  font-size: calc(1.3rem + 1.5vw);
}
```

---

## 5. Questions & Further Study

- Question 1: How do different CSS units affect performance and rendering in browsers?
- Question 2: What are the accessibility implications of using relative units vs. absolute units?

> Additional Notes: Explore the use of CSS custom properties (variables) in combination with different units for more flexible layouts.

---

## 6. Reflection

- What did I learn from studying this topic? CSS units offer a wide range of options for creating flexible and responsive designs, each with its own use cases and considerations.
- How confident do I feel about this topic now? Comfortable with basic usage, but need more practice with complex calculations and responsive design scenarios.
- What should I review next? Dive deeper into the performance implications of different units and explore advanced responsive design techniques using a combination of units.

