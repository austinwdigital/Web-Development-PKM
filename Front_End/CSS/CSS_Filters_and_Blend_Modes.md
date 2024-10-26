# CSS Filters and Blend Modes

**Date**: 2024/10/26
**Topic**: CSS Filters and Blend Modes
**Tags**: #css #filters #blend-modes #visual-effects

---

## 1. Key Concepts

- [x] CSS Filters: Apply graphical effects to elements
- [x] Filter Functions: Various filter effects like blur, grayscale, etc.
- [x] Blend Modes: Control how elements blend with their background
- [x] Background Blend Mode: Blend an element's background layers
- [x] Mix Blend Mode: Blend an element with its parent's background

> Summary: CSS Filters and Blend Modes allow for advanced visual effects and image manipulation directly in CSS, without the need for image editing software.

---

## 2. Detailed Notes

### 2.1. CSS Filters

Common filter functions:

1. `blur()`: Applies a Gaussian blur
   ```css
   filter: blur(5px);
   ```

2. `brightness()`: Adjusts the brightness
   ```css
   filter: brightness(150%);
   ```

3. `contrast()`: Adjusts the contrast
   ```css
   filter: contrast(200%);
   ```

4. `grayscale()`: Converts to grayscale
   ```css
   filter: grayscale(100%);
   ```

5. `hue-rotate()`: Applies a hue rotation
   ```css
   filter: hue-rotate(90deg);
   ```

6. `invert()`: Inverts the colors
   ```css
   filter: invert(100%);
   ```

7. `opacity()`: Adjusts the opacity
   ```css
   filter: opacity(50%);
   ```

8. `saturate()`: Adjusts the saturation
   ```css
   filter: saturate(200%);
   ```

9. `sepia()`: Converts to sepia
   ```css
   filter: sepia(100%);
   ```

Multiple filters can be combined:
```css
filter: contrast(175%) brightness(3%);
```

### 2.2. Blend Modes

1. Background Blend Mode:
   ```css
   background-image: url('image1.jpg'), url('image2.jpg');
   background-blend-mode: multiply;
   ```

2. Mix Blend Mode:
   ```css
   .overlay {
     mix-blend-mode: overlay;
   }
   ```

Common blend modes:
- `normal`
- `multiply`
- `screen`
- `overlay`
- `darken`
- `lighten`
- `color-dodge`
- `color-burn`
- `hard-light`
- `soft-light`
- `difference`
- `exclusion`
- `hue`
- `saturation`
- `color`
- `luminosity`

---

## 3. Useful Resources

- [MDN Web Docs - CSS Filters](https://developer.mozilla.org/en-US/docs/Web/CSS/filter)
- [MDN Web Docs - Blend Modes](https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode)
- [CSS-Tricks - CSS Filters](https://css-tricks.com/almanac/properties/f/filter/)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a grayscale hover effect for an image using CSS filters.

- **Solution**:

```css
.image-container img {
  transition: filter 0.3s ease;
}

.image-container img:hover {
  filter: grayscale(100%);
}
```

### Problem 2

- **Description**: Implement a "duotone" effect using blend modes.

- **Solution**:

```css
.duotone {
  position: relative;
  display: inline-block;
}

.duotone img {
  display: block;
}

.duotone::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #f00; /* Red */
  mix-blend-mode: darken;
}

.duotone::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #00f; /* Blue */
  mix-blend-mode: lighten;
}
```

---

## 5. Questions & Further Study

- Question 1: How do CSS filters and blend modes affect performance, especially on mobile devices?
- Question 2: What are the accessibility considerations when using filters and blend modes?

> Additional Notes: Explore how CSS filters and blend modes can be used in conjunction with SVG filters for more advanced effects.

---

## 6. Reflection

- What did I learn from studying this topic? CSS filters and blend modes provide powerful tools for creating visual effects directly in CSS, reducing the need for image editing software.
- How confident do I feel about this topic now? Comfortable with basic usage, but need more practice with complex combinations and real-world applications.
- What should I review next? Dive deeper into performance optimization techniques for filter and blend mode effects, and explore advanced use cases in web design.

