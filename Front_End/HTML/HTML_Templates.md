# HTML Templates

**Date**: 2024/10/26
**Topic**: HTML Templates
**Tags**: #html #templates #web-components

---

## 1. Key Concepts

- [x] `<template>` Element: Holds HTML that is not to be rendered immediately
- [x] Content Inert: Template content is not processed by the browser until used
- [x] Cloning: Templates are meant to be cloned and used multiple times
- [x] JavaScript Interaction: Templates are typically manipulated with JavaScript
- [x] Web Components: Often used in conjunction with Custom Elements

> Summary: HTML Templates provide a way to declare fragments of markup that can be cloned and inserted in the document later.

---

## 2. Detailed Notes

### 2.1. Basic Usage

- The `<template>` element is used to declare fragments of HTML that can be used later.
- Content inside a template is not rendered until it's activated via JavaScript.

```html
<template id="my-paragraph">
  <p>This is a paragraph that will be used later.</p>
</template>
```

### 2.2. Using Templates with JavaScript

- Templates are typically cloned and inserted into the document using JavaScript.

```javascript
const template = document.querySelector('#my-paragraph');
const clone = template.content.cloneNode(true);
document.body.appendChild(clone);
```

### 2.3. Templates in Web Components

- Templates are often used in creating Web Components.

```html
<template id="my-button">
  <style>
    button { background-color: blue; color: white; }
  </style>
  <button><slot></slot></button>
</template>

<script>
class MyButton extends HTMLElement {
  constructor() {
    super();
    const template = document.querySelector('#my-button');
    const shadowRoot = this.attachShadow({mode: 'open'});
    shadowRoot.appendChild(template.content.cloneNode(true));
  }
}
customElements.define('my-button', MyButton);
</script>

<my-button>Click me</my-button>
```

### 2.4. Benefits and Use Cases

1. Reusability: Define markup once and use it multiple times.
2. Performance: Content isn't processed until needed.
3. Encapsulation: When used with Shadow DOM, provides style and markup encapsulation.
4. Dynamic Content: Easily create dynamic content with consistent structure.

---

## 3. Useful Resources

- [MDN Web Docs - <template>](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/template)
- [HTML Living Standard - The template element](https://html.spec.whatwg.org/multipage/scripting.html#the-template-element)
- [web.dev - HTML templates](https://web.dev/learn/html/template/)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create an HTML template for a product card and use JavaScript to populate it with data.

```html
<!-- Your solution here -->
```

- **Solution**:

```html
<template id="product-card">
  <div class="product">
    <img class="product-image" src="" alt="">
    <h2 class="product-name"></h2>
    <p class="product-price"></p>
    <button class="buy-button">Buy Now</button>
  </div>
</template>

<div id="product-container"></div>

<script>
  const products = [
    { name: 'Widget A', price: .99, image: 'widget-a.jpg' },
    { name: 'Gadget B', price: 9.99, image: 'gadget-b.jpg' }
  ];

  const template = document.querySelector('#product-card');
  const container = document.querySelector('#product-container');

  products.forEach(product => {
    const clone = template.content.cloneNode(true);
    clone.querySelector('.product-name').textContent = product.name;
    clone.querySelector('.product-price').textContent = product.price;
    clone.querySelector('.product-image').src = product.image;
    clone.querySelector('.product-image').alt = product.name;
    container.appendChild(clone);
  });
</script>
```

### Problem 2

- **Description**: Create a custom element using an HTML template that displays a tooltip on hover.
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
    <slot name="trigger"></slot>
    <span class="tooltiptext"><slot name="content"></slot></span>
  </span>
</template>

<script>
class Tooltip extends HTMLElement {
  constructor() {
    super();
    const template = document.querySelector('#tooltip-template');
    const shadowRoot = this.attachShadow({mode: 'open'});
    shadowRoot.appendChild(template.content.cloneNode(true));
  }
}
customElements.define('my-tooltip', Tooltip);
</script>

<my-tooltip>
  <span slot="trigger">Hover over me</span>
  <span slot="content">This is the tooltip content</span>
</my-tooltip>
```

---

## 5. Questions & Further Study

- Question 1: How can HTML templates be used to improve performance in single-page applications?
- Question 2: What are the security considerations when using HTML templates with user-generated content?

> Additional Notes: Explore how HTML templates can be used with various frontend frameworks and libraries.

---

## 6. Reflection

- What did I learn from studying this topic? HTML templates provide a powerful way to create reusable markup structures that can be efficiently manipulated with JavaScript.
- How confident do I feel about this topic now? Comfortable with basic usage, but need more practice with complex scenarios and integration with web components.
- What should I review next? Dive deeper into the relationship between HTML templates, Shadow DOM, and Custom Elements in the Web Components ecosystem.

