# Flexbox

**Date**: 2024/10/26
**Topic**: Flexbox
**Tags**: #css #flexbox #layout

---

## 1. Key Concepts

- [x] Flex Container: The parent element with `display: flex`
- [x] Flex Items: The child elements of a flex container
- [x] Main Axis: Primary axis of the flex container (horizontal by default)
- [x] Cross Axis: Perpendicular to the main axis
- [x] Flex Direction: Defines the direction of the main axis
- [x] Justify Content: Aligns items along the main axis
- [x] Align Items: Aligns items along the cross axis

> Summary: Flexbox is a one-dimensional layout method for arranging items in rows or columns, providing space distribution and alignment capabilities.

---

## 2. Detailed Notes

### 2.1. Flex Container Properties

1. `display: flex;` - Creates a flex container
2. `flex-direction: row | row-reverse | column | column-reverse;` - Defines main axis
3. `flex-wrap: nowrap | wrap | wrap-reverse;` - Controls wrapping of flex items
4. `justify-content: flex-start | flex-end | center | space-between | space-around | space-evenly;` - Aligns along main axis
5. `align-items: stretch | flex-start | flex-end | center | baseline;` - Aligns along cross axis
6. `align-content: flex-start | flex-end | center | space-between | space-around | stretch;` - Aligns multiple lines

### 2.2. Flex Item Properties

1. `order: <integer>;` - Controls the order of flex items
2. `flex-grow: <number>;` - Defines ability to grow
3. `flex-shrink: <number>;` - Defines ability to shrink
4. `flex-basis: <length> | auto;` - Defines default size of an element
5. `flex: none | [ <'\flex-grow'\> <'\flex-shrink'\> || <'\flex-basis'\> ];` - Shorthand for grow, shrink, and basis
6. `align-self: auto | flex-start | flex-end | center | baseline | stretch;` - Overrides align-items for individual flex item

### 2.3. Example

```css
.container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.item {
  flex: 1 1 auto;
}
```

This creates a flex container with items distributed evenly and centered vertically. Each item can grow and shrink, with an initial auto basis.

### 2.4. Best Practices

1. Use `flex: 1;` for equal width/height flex items.
2. Combine `flex-direction: column;` with a height on the container for vertical layouts.
3. Use `align-self` to override alignment for specific items.
4. Consider using `flex-wrap: wrap;` for responsive designs.

---

## 3. Useful Resources

- [MDN Web Docs - Flexbox](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Flexbox)
- [CSS-Tricks - A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [Flexbox Froggy](https://flexboxfroggy.com/) - A game for learning Flexbox

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a navigation bar with logo on the left, menu items in the center, and a search bar on the right using Flexbox.

- **Solution**:

```html
<nav class="navbar">
  <div class="logo">Logo</div>
  <ul class="menu">
    <li>Home</li>
    <li>About</li>
    <li>Services</li>
    <li>Contact</li>
  </ul>
  <div class="search">
    <input type="text" placeholder="Search...">
  </div>
</nav>
```

```css
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px;
  background-color: #f0f0f0;
}

.menu {
  display: flex;
  list-style-type: none;
  gap: 20px;
}

.search input {
  padding: 5px;
}
```

### Problem 2

- **Description**: Create a responsive card layout that displays 3 cards per row on desktop and 1 card per row on mobile using Flexbox.

- **Solution**:

```html
<div class="card-container">
  <div class="card">Card 1</div>
  <div class="card">Card 2</div>
  <div class="card">Card 3</div>
  <div class="card">Card 4</div>
  <div class="card">Card 5</div>
  <div class="card">Card 6</div>
</div>
```

```css
.card-container {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}

.card {
  flex: 1 1 calc(33.333% - 20px);
  min-width: 200px;
  background-color: #f0f0f0;
  padding: 20px;
  box-sizing: border-box;
}

@media (max-width: 768px) {
  .card {
    flex: 1 1 100%;
  }
}
```

---

## 5. Questions & Further Study

- Question 1: How does Flexbox handle overflow when `flex-wrap` is set to `nowrap`?
- Question 2: What are the performance implications of using Flexbox for large layouts compared to traditional float-based layouts?

> Additional Notes: Explore how Flexbox can be used in combination with CSS Grid for complex layouts.

---

## 6. Reflection

- What did I learn from studying this topic? Flexbox provides a powerful and intuitive way to create both simple and complex layouts with minimal CSS.
- How confident do I feel about this topic now? Comfortable with basic and intermediate usage, but need more practice with complex responsive layouts.
- What should I review next? Dive deeper into advanced Flexbox techniques and explore its limitations compared to CSS Grid.

