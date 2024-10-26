# CSS Methodologies (BEM, OOCSS, SMACSS)

**Date**: 2024/10/26
**Topic**: CSS Methodologies (BEM, OOCSS, SMACSS)
**Tags**: #css #methodologies #bem #oocss #smacss

---

## 1. Key Concepts

- [x] BEM (Block Element Modifier): Naming convention for CSS classes
- [x] OOCSS (Object Oriented CSS): Separating structure from skin
- [x] SMACSS (Scalable and Modular Architecture for CSS): Categorizing CSS rules
- [x] Modularity: Creating reusable, independent components
- [x] Scalability: Structuring CSS for growth and maintainability

> Summary: CSS methodologies provide structured approaches to writing CSS, aiming to improve code organization, reusability, and maintainability in large projects.

---

## 2. Detailed Notes

### 2.1. BEM (Block Element Modifier)

- **Block**: Standalone entity that is meaningful on its own
- **Element**: A part of a block that has no standalone meaning
- **Modifier**: A flag on a block or element to change appearance or behavior

```css
/* Block component */
.btn {}

/* Element that depends upon the block */ 
.btn__price {}

/* Modifier that changes the style of the block */
.btn--orange {} 
.btn--big {}
```

### 2.2. OOCSS (Object Oriented CSS)

- Separate structure and skin
- Separate container and content

```css
/* Structure */
.header {
  width: 100%;
  padding: 20px;
}

/* Skin */
.header--dark {
  background: #000;
  color: #fff;
}

/* Content */
.header__title {
  font-size: 24px;
}
```

### 2.3. SMACSS (Scalable and Modular Architecture for CSS)

- Categorize CSS rules: Base, Layout, Module, State, Theme

```css
/* Base */
body, p, table, form, fieldset, legend, input, button {
  margin: 0;
  padding: 0;
}

/* Layout */
.l-header, .l-footer {
  width: 100%;
}

/* Module */
.btn {
  display: inline-block;
  padding: 10px 20px;
}

/* State */
.is-active {
  font-weight: bold;
}

/* Theme */
.theme-dark {
  background: #000;
  color: #fff;
}
```

---

## 3. Useful Resources

- [BEM - Block Element Modifier](http://getbem.com/)
- [An Introduction to Object Oriented CSS (OOCSS)](https://www.smashingmagazine.com/2011/12/an-introduction-to-object-oriented-css-oocss/)
- [SMACSS - Scalable and Modular Architecture for CSS](http://smacss.com/)

---

## 4. Practice Problems

### Problem 1

- **Description**: Refactor the following CSS using BEM methodology:

```css
.card {
  border: 1px solid #ccc;
  padding: 10px;
}

.card h2 {
  font-size: 18px;
}

.card .button {
  background: blue;
  color: white;
}

.card .button.large {
  padding: 10px 20px;
}
```

- **Solution**:

```css
.card {
  border: 1px solid #ccc;
  padding: 10px;
}

.card__title {
  font-size: 18px;
}

.card__button {
  background: blue;
  color: white;
}

.card__button--large {
  padding: 10px 20px;
}
```

### Problem 2

- **Description**: Apply OOCSS principles to create a reusable button component with different sizes and colors.

- **Solution**:

```css
/* Structure */
.btn {
  display: inline-block;
  padding: 10px 20px;
  border-radius: 5px;
}

/* Skin */
.btn--primary {
  background: blue;
  color: white;
}

.btn--secondary {
  background: gray;
  color: black;
}

/* Size modifiers */
.btn--small {
  font-size: 12px;
  padding: 5px 10px;
}

.btn--large {
  font-size: 18px;
  padding: 15px 30px;
}
```

---

## 5. Questions & Further Study

- Question 1: How do these CSS methodologies compare in terms of scalability for very large projects?
- Question 2: What are the potential drawbacks or challenges when implementing these methodologies in a team environment?

> Additional Notes: Explore how these methodologies can be combined or adapted for specific project needs.

---

## 6. Reflection

- What did I learn from studying this topic? CSS methodologies provide structured approaches to writing CSS that can significantly improve code organization and maintainability in large projects.
- How confident do I feel about this topic now? Familiar with the basic principles, but need more practice applying these methodologies in real-world scenarios.
- What should I review next? Dive deeper into each methodology and explore case studies of their application in large-scale projects.

