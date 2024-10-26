# CSS Transforms

**Date**: 2024/10/26
**Topic**: CSS Transforms
**Tags**: #css #transforms #animation

---

## 1. Key Concepts

- [x] 2D Transforms: Manipulating elements in a two-dimensional space
- [x] 3D Transforms: Adding depth to transformations
- [x] Transform Origin: Changing the point of origin for transformations
- [x] Multiple Transforms: Applying several transforms to a single element
- [x] Performance: GPU acceleration for smooth animations

> Summary: CSS Transforms allow you to modify the position, size, and shape of elements without affecting the layout flow of the document.

---

## 2. Detailed Notes

### 2.1. 2D Transforms

1. `translate()`: Move an element
   ```css
   transform: translate(50px, 100px);
   ```

2. `rotate()`: Rotate an element
   ```css
   transform: rotate(45deg);
   ```

3. `scale()`: Change the size of an element
   ```css
   transform: scale(1.5);
   ```

4. `skew()`: Skew an element along the X and Y axes
   ```css
   transform: skew(10deg, 20deg);
   ```

### 2.2. 3D Transforms

1. `rotateX()`, `rotateY()`, `rotateZ()`: Rotate around specific axes
   ```css
   transform: rotateX(45deg) rotateY(30deg);
   ```

2. `translateZ()`: Move along the Z-axis
   ```css
   transform: translateZ(50px);
   ```

3. `perspective`: Add depth to 3D transforms
   ```css
   perspective: 1000px;
   ```

### 2.3. Transform Origin

Change the point of origin for transformations:
```css
transform-origin: top left;
```

### 2.4. Multiple Transforms

Apply multiple transforms in a single declaration:
```css
transform: translate(50px, 50px) rotate(45deg) scale(1.5);
```

### 2.5. Performance Considerations

- Use `transform` and `opacity` for animations to leverage GPU acceleration
- Avoid changing layout properties (like `width` or `top`) for smoother animations

---

## 3. Useful Resources

- [MDN Web Docs - CSS Transforms](https://developer.mozilla.org/en-US/docs/Web/CSS/transform)
- [CSS-Tricks - Transform](https://css-tricks.com/almanac/properties/t/transform/)
- [3D Transforms in CSS](https://3dtransforms.desandro.com/)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a card flip effect using CSS transforms.

- **Solution**:

```css
.card-container {
  width: 200px;
  height: 300px;
  perspective: 1000px;
}

.card {
  width: 100%;
  height: 100%;
  position: relative;
  transform-style: preserve-3d;
  transition: transform 0.6s;
}

.card:hover {
  transform: rotateY(180deg);
}

.card-front, .card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
}

.card-back {
  transform: rotateY(180deg);
}
```

### Problem 2

- **Description**: Create a 3D cube using CSS transforms.

- **Solution**:

```css
.cube {
  width: 200px;
  height: 200px;
  position: relative;
  transform-style: preserve-3d;
  animation: rotate 5s infinite linear;
}

.face {
  position: absolute;
  width: 200px;
  height: 200px;
  background: rgba(255, 255, 255, 0.6);
  border: 2px solid black;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 40px;
}

.front  { transform: rotateY(0deg) translateZ(100px); }
.right  { transform: rotateY(90deg) translateZ(100px); }
.back   { transform: rotateY(180deg) translateZ(100px); }
.left   { transform: rotateY(-90deg) translateZ(100px); }
.top    { transform: rotateX(90deg) translateZ(100px); }
.bottom { transform: rotateX(-90deg) translateZ(100px); }

@keyframes rotate {
  from { transform: rotateX(0deg) rotateY(0deg); }
  to { transform: rotateX(360deg) rotateY(360deg); }
}
```

---

## 5. Questions & Further Study

- Question 1: How do CSS transforms interact with other layout properties like `position` and `display`?
- Question 2: What are the accessibility considerations when using CSS transforms, especially for 3D transformations?

> Additional Notes: Explore the relationship between CSS transforms and SVG transformations.

---

## 6. Reflection

- What did I learn from studying this topic? CSS transforms provide powerful tools for creating complex visual effects and animations without affecting document flow.
- How confident do I feel about this topic now? Comfortable with basic 2D transforms, but need more practice with 3D transforms and complex animations.
- What should I review next? Dive deeper into performance optimization techniques for transform-based animations and explore advanced 3D transform use cases.

