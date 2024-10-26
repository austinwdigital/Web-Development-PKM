# CSS-in-JS

**Date**: 2024/10/26
**Topic**: CSS-in-JS
**Tags**: #css #javascript #css-in-js #styling

---

## 1. Key Concepts

- [x] Inline Styles: Writing CSS directly in JavaScript
- [x] Styled Components: Popular library for component-based styling
- [x] CSS Modules: Locally scoped CSS classes
- [x] Dynamic Styling: Generating styles based on props or state
- [x] Theming: Easily implementing and switching themes
- [x] Performance Considerations: Runtime overhead vs. traditional CSS

> Summary: CSS-in-JS is an approach to styling in web applications where CSS is composed using JavaScript instead of defined in external files.

---

## 2. Detailed Notes

### 2.1. Inline Styles

```jsx
const Button = () => (
  <button style={{
    backgroundColor: 'blue',
    color: 'white',
    padding: '10px 20px',
    border: 'none',
    borderRadius: '5px'
  }}>
    Click me
  </button>
);
```

### 2.2. Styled Components

```jsx
import styled from 'styled-components';

const Button = styled.button`
  background-color: blue;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
`;

const App = () => <Button>Click me</Button>;
```

### 2.3. CSS Modules

```css
/* Button.module.css */
.button {
  background-color: blue;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
}
```

```jsx
import styles from './Button.module.css';

const Button = () => (
  <button className={styles.button}>Click me</button>
);
```

### 2.4. Dynamic Styling

```jsx
const Button = styled.button`
  background-color: ${props => props.primary ? 'blue' : 'gray'};
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
`;

const App = () => (
  <div>
    <Button primary>Primary Button</Button>
    <Button>Secondary Button</Button>
  </div>
);
```

### 2.5. Advantages and Disadvantages

Advantages:
- Scoped styles
- Dynamic styling based on props/state
- Eliminates dead code
- Improved developer experience

Disadvantages:
- Learning curve
- Potential performance overhead
- Increased bundle size
- Lack of separation of concerns

---

## 3. Useful Resources

- [Styled Components Documentation](https://styled-components.com/)
- [CSS Modules GitHub](https://github.com/css-modules/css-modules)
- [A Thorough Analysis of CSS-in-JS](https://css-tricks.com/a-thorough-analysis-of-css-in-js/)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a styled component for a card with a title, content, and a dynamic background color based on a prop.

- **Solution**:

```jsx
import styled from 'styled-components';

const Card = styled.div`
  background-color: ${props => props.color || 'white'};
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
`;

const Title = styled.h2`
  font-size: 18px;
  margin-bottom: 10px;
`;

const Content = styled.p`
  font-size: 14px;
`;

const App = () => (
  <Card color="lightblue">
    <Title>Card Title</Title>
    <Content>This is the card content.</Content>
  </Card>
);
```

### Problem 2

- **Description**: Implement a theme switch using CSS-in-JS.

- **Solution**:

```jsx
import { ThemeProvider, createGlobalStyle } from 'styled-components';
import { useState } from 'react';

const lightTheme = {
  body: '#fff',
  text: '#333'
};

const darkTheme = {
  body: '#333',
  text: '#fff'
};

const GlobalStyle = createGlobalStyle`
  body {
    background-color: ${props => props.theme.body};
    color: ${props => props.theme.text};
  }
`;

const App = () => {
  const [theme, setTheme] = useState('light');

  const toggleTheme = () => {
    setTheme(theme === 'light' ? 'dark' : 'light');
  };

  return (
    <ThemeProvider theme={theme === 'light' ? lightTheme : darkTheme}>
      <GlobalStyle />
      <button onClick={toggleTheme}>Toggle Theme</button>
      <h1>Hello, world!</h1>
    </ThemeProvider>
  );
};
```

---

## 5. Questions & Further Study

- Question 1: How does CSS-in-JS affect the separation of concerns principle in web development?
- Question 2: What are the performance implications of using CSS-in-JS in large-scale applications?

> Additional Notes: Explore server-side rendering considerations when using CSS-in-JS.

---

## 6. Reflection

- What did I learn from studying this topic? CSS-in-JS provides powerful tools for component-based styling and dynamic theming, but comes with its own set of trade-offs.
- How confident do I feel about this topic now? Familiar with the basic concepts, but need more practice with advanced use cases and performance optimization.
- What should I review next? Dive deeper into the internals of CSS-in-JS libraries and explore best practices for scaling CSS-in-JS in large applications.

