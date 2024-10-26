# Advanced HTML Topics Overview

**Date**: 2024/10/26
**Topic**: Advanced HTML Topics
**Tags**: #html #advanced #web-development

---

## 1. Key Concepts

- [x] Custom Data Attributes: Using data-* attributes for custom metadata
- [x] Microdata and Schema.org: Enhancing HTML with structured data
- [x] Web Components: Creating reusable custom elements
- [x] SVG in HTML: Inline SVG and its benefits
- [x] HTML Templates: Using <template> for reusable HTML structures
- [x] Responsive Images: Using srcset and sizes attributes
- [x] Lazy Loading: Native lazy loading for images and iframes

> Summary: Advanced HTML topics cover modern techniques and features that enhance the functionality, performance, and semantics of web pages.

---

## 2. Detailed Notes

### 2.1. Custom Data Attributes

- **Definition**: Custom data attributes allow storing extra information on standard HTML elements.
- **Usage**: `data-*` where * can be any lowercase string.
- **Accessing in JS**: Use `dataset` property.

```html
<article id="electric-cars" data-columns="3" data-index-number="12314" data-parent="cars">
  ...
</article>
```

```javascript
const article = document.querySelector('#electric-cars');
article.dataset.columns // "3"
article.dataset.indexNumber // "12314"
```

### 2.2. Microdata and Schema.org

- **Purpose**: Add structured data to HTML elements to provide additional semantic meaning.
- **Benefits**: Improves SEO and enables rich snippets in search results.

```html
<div itemscope itemtype="http://schema.org/Movie">
  <h1 itemprop="name">Avatar</h1>
  <span>Director: <span itemprop="director">James Cameron</span></span>
  <span itemprop="genre">Science fiction</span>
  <a href="../movies/avatar-theatrical-trailer.html" itemprop="trailer">Trailer</a>
</div>
```

### 2.3. Web Components

- **Definition**: A set of web platform APIs that allow creating reusable custom elements.
- **Key Technologies**: Custom Elements, Shadow DOM, HTML Templates.

```html
<template id="my-paragraph">
  <style>
    p { color: white; background-color: #666; padding: 5px; }
  </style>
  <p><slot name="my-text"></slot></p>
</template>

<script>
  class MyParagraph extends HTMLElement {
    constructor() {
      super();
      const template = document.querySelector('#my-paragraph').content;
      const shadowRoot = this.attachShadow({mode: 'open'});
      shadowRoot.appendChild(template.cloneNode(true));
    }
  }
  customElements.define('my-paragraph', MyParagraph);
</script>

<my-paragraph>
  <span slot="my-text">This is my custom paragraph element</span>
</my-paragraph>
```

### 2.4. SVG in HTML

- **Benefits**: Scalable, small file size, styleable with CSS.
- **Usage**: Can be inline or linked.

```html
<svg width="100" height="100">
  <circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" />
</svg>
```

### 2.5. Responsive Images

- **Purpose**: Serve different image sizes based on device capabilities.
- **Key Attributes**: `srcset` and `sizes`.

```html
<img srcset="small.jpg 500w, medium.jpg 1000w, large.jpg 2000w"
     sizes="(max-width: 600px) 500px, (max-width: 1200px) 1000px, 2000px"
     src="fallback.jpg" alt="Responsive image">
```

---

## 3. Useful Resources

- [MDN Web Docs - HTML](https://developer.mozilla.org/en-US/docs/Web/HTML)
- [Schema.org](https://schema.org/)
- [Web Components Introduction](https://www.webcomponents.org/introduction)
- [Responsive Images - MDN](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a custom web component for a tooltip.

```html
<!-- Your solution here -->
```

- **Solution**:

```html
<template id="tooltip-template">
  <style>
    .tooltip {
      position: relative;
      display: inline-block;
      border-bottom: 1px dotted black;
    }
    .tooltip .tooltiptext {
      visibility: hidden;
      width: 120px;
      background-color: black;
      color: #fff;
      text-align: center;
      border-radius: 6px;
      padding: 5px 0;
      position: absolute;
      z-index: 1;
      bottom: 125%;
      left: 50%;
      margin-left: -60px;
      opacity: 0;
      transition: opacity 0.3s;
    }
    .tooltip:hover .tooltiptext {
      visibility: visible;
      opacity: 1;
    }
  </style>
  <span class="tooltip">
    <slot name="tooltip-trigger"></slot>
    <span class="tooltiptext"><slot name="tooltip-text"></slot></span>
  </span>
</template>

<script>
  class Tooltip extends HTMLElement {
    constructor() {
      super();
      const template = document.querySelector('#tooltip-template').content;
      const shadowRoot = this.attachShadow({mode: 'open'});
      shadowRoot.appendChild(template.cloneNode(true));
    }
  }
  customElements.define('my-tooltip', Tooltip);
</script>

<my-tooltip>
  <span slot="tooltip-trigger">Hover over me</span>
  <span slot="tooltip-text">This is a tooltip</span>
</my-tooltip>
```

### Problem 2

- **Description**: Implement responsive images for a hero section using the `srcset` and `sizes` attributes.
- **Solution**:

```html
<img srcset="hero-small.jpg 500w,
             hero-medium.jpg 1000w,
             hero-large.jpg 1500w"
     sizes="(max-width: 600px) 500px,
            (max-width: 1200px) 1000px,
            1500px"
     src="hero-fallback.jpg"
     alt="Hero image">
```

---

## 5. Questions & Further Study

- Question 1: How can web components be used to create a design system for a large-scale web application?
- Question 2: What are the performance implications of using inline SVG versus linked SVG files?

> Additional Notes: Explore the Intersection Observer API for advanced lazy loading techniques.

---

## 6. Reflection

- What did I learn from studying this topic? Advanced HTML features provide powerful tools for creating more semantic, performant, and interactive web pages.
- How confident do I feel about this topic now? Familiar with the concepts, but need more practice implementing them in real-world scenarios.
- What should I review next? Dive deeper into the Shadow DOM and its implications for styling and JavaScript interactions.
