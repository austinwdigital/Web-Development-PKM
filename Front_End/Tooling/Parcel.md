# Parcel Overview

**Date**: 2024/10/25
**Topic**: Parcel
**Tags**: #tooling #javascript #bundler #parcel #zero-config

---

## 1. Key Concepts

- [x] Zero Configuration: Works out of the box for most projects without config files
- [x] Asset Bundling: Handles various file types (JS, CSS, HTML, images, etc.)
- [x] Hot Module Replacement (HMR): Updates modules in the browser without full page reloads
- [x] Code Splitting: Automatically splits code into smaller chunks for better performance

> Summary: Parcel is a web application bundler that differentiates itself with its zero-configuration approach, offering a simple and fast bundling solution for web projects.

---

## 2. Detailed Notes

### 2.1. Introduction to Parcel

- **Definition**: Parcel is a web application bundler that requires zero configuration and can handle various asset types out of the box.
- **Why it's important**: It simplifies the build process, especially for smaller projects or rapid prototyping, by reducing the need for complex configuration.
- **Use cases**: Building web applications, creating quick prototypes, bundling assets for simple to moderately complex projects.

### 2.2. Examples

```bash
# Installing Parcel
npm install -g parcel-bundler

# Running Parcel (assuming index.html is your entry point)
parcel index.html
```

```html
<!-- index.html -->
<!DOCTYPE html>
<html>
<head>
  <title>Parcel Example</title>
  <link rel="stylesheet" href="./styles.css">
</head>
<body>
  <h1>Hello, Parcel!</h1>
  <script src="./index.js"></script>
</body>
</html>
```

```javascript
// index.js
import { greeting } from ./greeting;

console.log(greeting(Parcel));
```

```javascript
// greeting.js
export function greeting(name) {
  return `Hello, ${name}!`;
}
```

Explanation of the examples:
- The HTML file includes CSS and JavaScript files as if they were not bundled.
- Parcel automatically handles the bundling of these assets.
- JavaScript modules are used and Parcel handles the module resolution and bundling.

### 2.3. Challenges and Considerations

- Limited Configuration: While zero-config is a feature, it can be limiting for complex use cases.
- Build Performance: For very large projects, build times can be slower compared to more configurable bundlers.
- Plugin Ecosystem: Smaller plugin ecosystem compared to some other bundlers.

---

## 3. Useful Resources

- [Parcel Official Documentation](https://parceljs.org/docs/)
- [Getting Started with Parcel](https://parceljs.org/getting-started/webapp/)
- [Parcel GitHub Repository](https://github.com/parcel-bundler/parcel)

---

## 4. Practice Problems

### Problem 1

- **Description**: Set up a basic Parcel project that includes a JavaScript file, a CSS file, and an image, all referenced from an HTML file.

- **Solution**:

```html
<!-- index.html -->
<!DOCTYPE html>
<html>
<head>
  <title>Parcel Project</title>
  <link rel="stylesheet" href="./styles.css">
</head>
<body>
  <h1>Welcome to My Parcel Project</h1>
  <img src="./image.jpg" alt="Example Image">
  <script src="./index.js"></script>
</body>
</html>
```

```css
/* styles.css */
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
}
```

```javascript
// index.js
console.log(Parcel
