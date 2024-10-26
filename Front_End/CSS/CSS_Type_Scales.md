# CSS Type Scales

**Date**: 2024/10/26
**Topic**: CSS Type Scales
**Tags**: #css #typography #type-scales #design-systems

---

## 1. Key Concepts

- [x] Type Scale: A predetermined set of font sizes that create hierarchy and consistency
- [x] Ratio: The multiplier used to calculate each step in the scale
- [x] Base Size: The foundation size from which other sizes are calculated
- [x] Modular Scale: A type scale based on a ratio derived from music or nature
- [x] Responsive Type Scales: Adjusting the scale for different screen sizes
- [x] CSS Custom Properties: Using variables to implement type scales

> Summary: Type scales provide a systematic approach to sizing typography, creating visual hierarchy and maintaining consistency across a design system.

---

## 2. Detailed Notes

### 2.1. Understanding Type Scales

A type scale is a progression of font sizes that follow a specific ratio. Common ratios include:

- Minor Second: 1.067
- Major Second: 1.125
- Minor Third: 1.2
- Major Third: 1.25
- Perfect Fourth: 1.333
- Augmented Fourth: 1.414
- Perfect Fifth: 1.5
- Golden Ratio: 1.618

### 2.2. Implementing a Type Scale in CSS

Using CSS custom properties:

```css
:root {
  --base-size: 1rem;
  --scale-ratio: 1.25;
  --h1: calc(var(--base-size) * var(--scale-ratio) * var(--scale-ratio) * var(--scale-ratio));
  --h2: calc(var(--base-size) * var(--scale-ratio) * var(--scale-ratio));
  --h3: calc(var(--base-size) * var(--scale-ratio));
  --small: calc(var(--base-size) / var(--scale-ratio));
}

body { font-size: var(--base-size); }
h1 { font-size: var(--h1); }
h2 { font-size: var(--h2); }
h3 { font-size: var(--h3); }
small { font-size: var(--small); }
```

### 2.3. Responsive Type Scales

Adjust the scale for different screen sizes:

```css
:root {
  --base-size: 1rem;
  --scale-ratio: 1.2;
}

@media (min-width: 640px) {
  :root {
    --base-size: 1.125rem;
    --scale-ratio: 1.25;
  }
}

@media (min-width: 1024px) {
  :root {
    --base-size: 1.25rem;
    --scale-ratio: 1.333;
  }
}
```

### 2.4. Modular Scale with calc()

Create a modular scale using `calc()`:

```css
:root {
  --base-size: 1rem;
  --ratio: 1.5;
}

.text-xs { font-size: calc(var(--base-size) / var(--ratio)); }
.text-sm { font-size: calc(var(--base-size) / sqrt(var(--ratio))); }
.text-base { font-size: var(--base-size); }
.text-lg { font-size: calc(var(--base-size) * sqrt(var(--ratio))); }
.text-xl { font-size: calc(var(--base-size) * var(--ratio)); }
.text-2xl { font-size: calc(var(--base-size) * var(--ratio) * sqrt(var(--ratio))); }
.text-3xl { font-size: calc(var(--base-size) * var(--ratio) * var(--ratio)); }
```

### 2.5. Using a Type Scale Generator

Tools like [Type Scale](https://type-scale.com/) can help generate a type scale based on a chosen ratio and base size.

---

## 3. Useful Resources

- [Type Scale - A Visual Calculator](https://type-scale.com/)
- [Modular Scale](https://www.modularscale.com/)
- [The Elements of Typographic Style Applied to the Web](http://webtypography.net/)
- [Responsive Modular Typography Scales in CSS](https://blog.envylabs.com/responsive-typographic-scales-in-css-b9f60431d1c4)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a type scale using the Perfect Fourth ratio (1.333) with a base size of 16px. Implement styles for h1, h2, h3, and body text.

- **Solution**:

```css
:root {
  --base-size: 16px;
  --ratio: 1.333;
}

body {
  font-size: var(--base-size);
}

h3 {
  font-size: calc(var(--base-size) * var(--ratio));
}

h2 {
  font-size: calc(var(--base-size) * var(--ratio) * var(--ratio));
}

h1 {
  font-size: calc(var(--base-size) * var(--ratio) * var(--ratio) * var(--ratio));
}
```

### Problem 2

- **Description**: Implement a responsive type scale that uses different ratios for mobile and desktop viewports.

- **Solution**:

```css
:root {
  --base-size: 16px;
  --ratio: 1.2; /* Minor Third for mobile */
}

body {
  font-size: var(--base-size);
}

h1 { font-size: calc(var(--base-size) * var(--ratio) * var(--ratio) * var(--ratio)); }
h2 { font-size: calc(var(--base-size) * var(--ratio) * var(--ratio)); }
h3 { font-size: calc(var(--base-size) * var(--ratio)); }

@media (min-width: 768px) {
  :root {
    --ratio: 1.333; /* Perfect Fourth for desktop */
  }
  
  --base-size: 18px;
}
```

---

## 5. Questions & Further Study

- Question 1: How does the choice of ratio in a type scale affect the overall feel and readability of a design?
- Question 2: In what ways can type scales be integrated with other aspects of a design system, such as spacing and layout grids?

> Additional Notes: Explore how variable fonts can be used in conjunction with type scales to create even more flexible and responsive typography systems.

---

## 6. Reflection

- What did I learn from studying this topic? Type scales provide a systematic and mathematical approach to typography that can greatly enhance the consistency and hierarchy in web design.
- How confident do I feel about this topic now? Comfortable with the basic concepts, but need more practice implementing complex, responsive type scales in real projects.
- What should I review next? Dive deeper into the relationship between type scales and vertical rhythm, and explore advanced techniques for maintaining proportion across different viewport sizes.

