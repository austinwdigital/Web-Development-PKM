# CSS Preprocessors (SASS/SCSS)

**Date**: 2024/10/26
**Topic**: CSS Preprocessors (SASS/SCSS)
**Tags**: #css #sass #scss #preprocessors

---

## 1. Key Concepts

- [x] Variables: Store and reuse values throughout stylesheets
- [x] Nesting: Write nested selectors to mirror HTML structure
- [x] Mixins: Reusable blocks of CSS declarations
- [x] Functions: Perform calculations and manipulations
- [x] Partials: Split CSS into smaller, more manageable files
- [x] Extend/Inheritance: Share sets of CSS properties between selectors

> Summary: CSS preprocessors like SASS/SCSS enhance CSS with programming-like features, making stylesheets more maintainable and efficient to write.

---

## 2. Detailed Notes

### 2.1. Variables

```scss
$primary-color: #3498db;
$font-stack: Helvetica, sans-serif;

body {
  font: 100% $font-stack;
  color: $primary-color;
}
```

### 2.2. Nesting

```scss
nav {
  ul {
    margin: 0;
    padding: 0;
    list-style: none;
  }

  li { display: inline-block; }

  a {
    display: block;
    padding: 6px 12px;
    text-decoration: none;
  }
}
```

### 2.3. Mixins

```scss
@mixin border-radius($radius) {
  -webkit-border-radius: $radius;
     -moz-border-radius: $radius;
      -ms-border-radius: $radius;
          border-radius: $radius;
}

.box { @include border-radius(10px); }
```

### 2.4. Functions

```scss
@function calculate-width($col-span) {
  @return 100% / $col-span;
}

.col-4 {
  width: calculate-width(4);
}
```

### 2.5. Partials and Import

```scss
// _reset.scss
html, body, ul, ol {
  margin: 0;
  padding: 0;
}

// main.scss
@import 'reset';

body {
  font: 100% Helvetica, sans-serif;
  background-color: #efefef;
}
```

### 2.6. Extend/Inheritance

```scss
%message-shared {
  border: 1px solid #ccc;
  padding: 10px;
  color: #333;
}

.success {
  @extend %message-shared;
  border-color: green;
}

.error {
  @extend %message-shared;
  border-color: red;
}
```

---

## 3. Useful Resources

- [Sass Documentation](https://sass-lang.com/documentation)
- [CSS-Tricks - Sass Style Guide](https://css-tricks.com/sass-style-guide/)
- [Scotch.io - Getting Started with Sass](https://scotch.io/tutorials/getting-started-with-sass)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a mixin for flexbox container with customizable direction and alignment.

- **Solution**:

```scss
@mixin flex-container($direction: row, $justify: flex-start, $align: stretch) {
  display: flex;
  flex-direction: $direction;
  justify-content: $justify;
  align-items: $align;
}

.container {
  @include flex-container(column, center, center);
}
```

### Problem 2

- **Description**: Implement a simple grid system using SASS functions and mixins.

- **Solution**:

```scss
$grid-columns: 12;

@function column-width($columns) {
  @return percentage($columns / $grid-columns);
}

@mixin make-column($columns) {
  width: column-width($columns);
  float: left;
}

.col-4 {
  @include make-column(4);
}

.col-8 {
  @include make-column(8);
}
```

---

## 5. Questions & Further Study

- Question 1: How do CSS preprocessors affect the debugging process of stylesheets?
- Question 2: What are the performance implications of using heavily nested selectors in SASS?

> Additional Notes: Explore the differences between SASS and other CSS preprocessors like Less or Stylus.

---

## 6. Reflection

- What did I learn from studying this topic? CSS preprocessors like SASS provide powerful tools for writing more maintainable and efficient CSS, with features that address common pain points in large stylesheets.
- How confident do I feel about this topic now? Comfortable with basic concepts, but need more practice with advanced features and large-scale project organization.
- What should I review next? Dive deeper into SASS architecture patterns and best practices for managing large-scale stylesheets.

