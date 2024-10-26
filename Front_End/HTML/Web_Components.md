# Web Components

**Date**: 2024/10/26
**Topic**: Web Components
**Tags**: #web-components #custom-elements #shadow-dom #html-templates

---

## 1. Key Concepts

- [x] Custom Elements: Create new HTML tags
- [x] Shadow DOM: Encapsulated DOM and styling
- [x] HTML Templates: Reusable markup structures
- [x] ES Modules: JavaScript modules for organizing component code

> Summary: Web Components allow developers to create reusable custom elements with encapsulated functionality and styling.

---

## 2. Detailed Notes

### 2.1. Custom Elements

- Extend HTML with new elements.
- Use JavaScript classes to define behavior.

```javascript
class MyElement extends HTMLElement {
  constructor() {
    super();
    this.textContent = 'Hello from MyElement!';
  }
}
customElements.define('my-element', MyElement);
```

Usage:
```html
<my-element></my-element>
```

### 2.2. Shadow DOM

- Provides encapsulation for DOM and styles.
- Creates a separate DOM tree attached to an element.

```javascript
class MyShadowElement extends HTMLElement {
  constructor() {
    super();
    const shadow = this.attachShadow({mode: 'open'});
    const div = document.createElement('div');
    div.textContent = 'I'm in the shadow DOM!';
    shadow.appendChild(div);
  }
}
customElements.define('my-shadow-element', MyShadowElement);
```

### 2.3. HTML Templates

- Define reusable markup structures.
- Use with Custom Elements and Shadow DOM.

```html
<template id="my-template">
  <style>
    p { color: blue; }
  </style>
  <p>Template content</p>
</template>

<script>
class TemplateElement extends HTMLElement {
  constructor() {
    super();
    const template = document.querySelector('#my-template');
    const shadowRoot = this.attachShadow({mode: 'open'});
    shadowRoot.appendChild(template.content.cloneNode(true));
  }
}
customElements.define('template-element', TemplateElement);
</script>
```

### 2.4. Lifecycle Callbacks

- `connectedCallback()`: Invoked when the element is added to the document.
- `disconnectedCallback()`: Invoked when the element is removed from the document.
- `attributeChangedCallback(name, oldValue, newValue)`: Invoked when an attribute is added, removed, or changed.

```javascript
class LifecycleElement extends HTMLElement {
  static get observedAttributes() { return ['color']; }

  connectedCallback() {
    console.log('Element added to page.');
  }

  disconnectedCallback() {
    console.log('Element removed from page.');
  }

  attributeChangedCallback(name, oldValue, newValue) {
    console.log(`Attribute ${name} changed from ${oldValue} to ${newValue}`);
  }
}
customElements.define('lifecycle-element', LifecycleElement);
```

---

## 3. Useful Resources

- [MDN Web Docs - Web Components](https://developer.mozilla.org/en-US/docs/Web/Web_Components)
- [Google Developers - Custom Elements v1](https://developers.google.com/web/fundamentals/web-components/customelements)
- [Web Components - Introduction](https://www.webcomponents.org/introduction)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a custom element that displays a counter with increment and decrement buttons.

```javascript
// Your solution here
```

- **Solution**:

```javascript
class CounterElement extends HTMLElement {
  constructor() {
    super();
    this.count = 0;
    this.attachShadow({ mode: 'open' });
    this.shadowRoot.innerHTML = `
      <style>
        button { margin: 0 5px; }
      </style>
      <button id="decrement">-</button>
      <span id="count">0</span>
      <button id="increment">+</button>
    `;
    this.incrementBtn = this.shadowRoot.querySelector('#increment');
    this.decrementBtn = this.shadowRoot.querySelector('#decrement');
    this.countSpan = this.shadowRoot.querySelector('#count');
  }

  connectedCallback() {
    this.incrementBtn.addEventListener('click', () => this.increment());
    this.decrementBtn.addEventListener('click', () => this.decrement());
  }

  increment() {
    this.count++;
    this.updateCount();
  }

  decrement() {
    this.count--;
    this.updateCount();
  }

  updateCount() {
    this.countSpan.textContent = this.count;
  }
}

customElements.define('counter-element', CounterElement);
```

Usage:
```html
<counter-element></counter-element>
```

### Problem 2

- **Description**: Create a custom element that renders a responsive card component with an image, title, and description. Use Shadow DOM for style encapsulation.
- **Solution**:

```javascript
class CardElement extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
    this.shadowRoot.innerHTML = `
      <style>
        .card {
          border: 1px solid #ddd;
          border-radius: 8px;
          overflow: hidden;
          max-width: 300px;
          margin: 10px;
          box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        img {
          width: 100%;
          height: auto;
        }
        .content {
          padding: 15px;
        }
        h2 {
          margin-top: 0;
        }
      </style>
      <div class="card">
        <img>
        <div class="content">
          <h2></h2>
          <p></p>
        </div>
      </div>
    `;
  }

  static get observedAttributes() {
    return ['image', 'title', 'description'];
  }

  attributeChangedCallback(name, oldValue, newValue) {
    switch(name) {
      case 'image':
        this.shadowRoot.querySelector('img').src = newValue;
        break;
      case 'title':
        this.shadowRoot.querySelector('h2').textContent = newValue;
        break;
      case 'description':
        this.shadowRoot.querySelector('p').textContent = newValue;
        break;
    }
  }
}

customElements.define('card-element', CardElement);
```

Usage:
```html
<card-element
  image="https://example.com/image.jpg"
  title="Card Title"
  description="This is a description of the card content."
></card-element>
```

---

## 5. Questions & Further Study

- Question 1: How can Web Components be integrated with popular frontend frameworks like React or Vue?
- Question 2: What are the performance implications of using Shadow DOM extensively in a large application?

> Additional Notes: Explore the use of ES Modules with Web Components for better code organization and reusability.

---

## 6. Reflection

- What did I learn from studying this topic? Web Components provide a powerful way to create reusable, encapsulated custom elements that work across different frameworks and libraries.
- How confident do I feel about this topic now? Comfortable with basic concepts, but need more practice with complex scenarios and real-world applications.
- What should I review next? Dive deeper into advanced patterns for Web Components, such as composition and state management.

