# CSS Grid

**Date**: 2024/10/26
**Topic**: CSS Grid
**Tags**: #css #grid #layout

---

## 1. Key Concepts

- [x] Grid Container: The element with `display: grid`
- [x] Grid Items: Direct children of the grid container
- [x] Grid Lines: The dividing lines that make up the structure of the grid
- [x] Grid Tracks: The space between two adjacent grid lines (rows and columns)
- [x] Grid Cell: The space between four intersecting grid lines
- [x] Grid Area: The total space surrounded by four grid lines

> Summary: CSS Grid is a two-dimensional layout system that allows for complex alignments and distributions of space in web layouts.

---

## 2. Detailed Notes

### 2.1. Grid Container Properties

1. `display: grid;` - Creates a grid container
2. `grid-template-columns` and `grid-template-rows` - Define the columns and rows of the grid
3. `grid-template-areas` - Defines a grid template using named grid areas
4. `grid-gap` (or `column-gap` and `row-gap`) - Sets the gaps between grid items
5. `justify-items` and `align-items` - Align grid items inside their cells
6. `justify-content` and `align-content` - Align the grid within the container

### 2.2. Grid Item Properties

1. `grid-column` and `grid-row` - Specify a grid item's location
2. `grid-area` - Specifies a grid item's size and location
3. `justify-self` and `align-self` - Align a grid item inside its cell

### 2.3. Example

```css
.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: auto;
  gap: 20px;
}

.item {
  grid-column: span 2;
}
```

This creates a 3-column grid with equal width columns and 20px gaps. One item spans two columns.

### 2.4. Best Practices

1. Use `fr` units for flexible track sizes.
2. Utilize `minmax()` for responsive designs.
3. Name grid lines and areas for more readable code.
4. Combine `auto-fill` and `minmax()` for responsive layouts without media queries.

---

## 3. Useful Resources

- [MDN Web Docs - CSS Grid Layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout)
- [CSS-Tricks - A Complete Guide to Grid](https://css-tricks.com/snippets/css/complete-guide-grid/)
- [Grid by Example](https://gridbyexample.com/) - Examples and patterns for Grid layouts

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a basic 3x3 grid layout with a header spanning the full width, a main content area, a sidebar, and a footer spanning the full width.

- **Solution**:

```html
<div class="grid-container">
  <header>Header</header>
  <main>Main Content</main>
  <aside>Sidebar</aside>
  <footer>Footer</footer>
</div>
```

```css
.grid-container {
  display: grid;
  grid-template-columns: 3fr 1fr;
  grid-template-rows: auto 1fr auto;
  gap: 20px;
  height: 100vh;
}

header {
  grid-column: 1 / -1;
}

main {
  grid-column: 1 / 2;
}

aside {
  grid-column: 2 / 3;
}

footer {
  grid-column: 1 / -1;
}
```

### Problem 2

- **Description**: Create a responsive image gallery using CSS Grid that displays 4 images per row on desktop, 2 per row on tablet, and 1 per row on mobile.

- **Solution**:

```html
<div class="gallery">
  <img src="image1.jpg" alt="Image 1">
  <img src="image2.jpg" alt="Image 2">
  <img src="image3.jpg" alt="Image 3">
  <img src="image4.jpg" alt="Image 4">
  <img src="image5.jpg" alt="Image 5">
  <img src="image6.jpg" alt="Image 6">
  <img src="image7.jpg" alt="Image 7">
  <img src="image8.jpg" alt="Image 8">
</div>
```

```css
.gallery {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 20px;
}

.gallery img {
  width: 100%;
  height: auto;
  object-fit: cover;
}

@media (max-width: 800px) {
  .gallery {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 500px) {
  .gallery {
    grid-template-columns: 1fr;
  }
}
```

---

## 5. Questions & Further Study

- Question 1: How does CSS Grid handle content overflow in fixed-size grid cells?
- Question 2: What are the accessibility considerations when using CSS Grid for layout?

> Additional Notes: Explore advanced Grid techniques like subgrids and how they can be used to create complex, nested layouts.

---

## 6. Reflection

- What did I learn from studying this topic? CSS Grid provides a powerful system for creating complex, two-dimensional layouts with relatively simple CSS.
- How confident do I feel about this topic now? Comfortable with basic and intermediate usage, but need more practice with advanced techniques and responsive designs.
- What should I review next? Dive deeper into the interplay between Grid and Flexbox, and explore more complex Grid layouts in real-world scenarios.

