# Prettier Overview

**Date**: 2024/10/25
**Topic**: Prettier
**Tags**: #tooling #javascript #code-formatter #prettier

---

## 1. Key Concepts

- [x] Opinionated Formatting: Enforces a consistent style by parsing code and reprinting it
- [x] Language Support: Works with JavaScript, TypeScript, CSS, HTML, JSON, and more
- [x] Integration: Can be integrated with most editors and used with other tools like ESLint
- [x] Configuration: Minimal configuration options to maintain simplicity

> Summary: Prettier is an opinionated code formatter that supports multiple languages, aiming to end debates over code style by providing a consistent output regardless of the input format.

---

## 2. Detailed Notes

### 2.1. Introduction to Prettier

- **Definition**: Prettier is an opinionated code formatter that enforces a consistent style by parsing your code and reprinting it with its own rules.
- **Why it's important**: It saves time and energy by eliminating debates over code style, ensuring consistency across a project or team.
- **Use cases**: Formatting code in any JavaScript, TypeScript, CSS, HTML, or JSON project, integrating with pre-commit hooks for automatic formatting.

### 2.2. Examples

```javascript
// Before Prettier
const foo = {bar: "baz",qux: "quux"}

function   greet(name)    {
    return `Hello, ${name}!`;}

// After Prettier
const foo = { bar: "baz", qux: "quux" };

function greet(name) {
  return `Hello, ${name}!`;
}
```

Configuration example (`.prettierrc`):

```json
{
  "printWidth": 100,
  "tabWidth": 2,
  "useTabs": false,
  "semi": true,
  "singleQuote": true,
  "trailingComma": "es5",
  "bracketSpacing": true,
  "arrowParens": "avoid"
}
```

Explanation of the examples:

- Prettier automatically adjusts spacing, indentation, and line breaks.
- The configuration file allows for some customization of Prettier's behavior.

### 2.3. Challenges and Considerations

- Opinionated Nature: Some developers may disagree with Prettier's choices.
- Integration with Other Tools: Ensuring Prettier works well with linters and other formatting tools.
- Performance: Formatting large files or projects can be time-consuming.

---

## 3. Useful Resources

- [Prettier Official Documentation](https://prettier.io/docs/en/index.html)
- [Prettier Playground](https://prettier.io/playground/)
- [Prettier Options](https://prettier.io/docs/en/options.html)

---

## 4. Practice Problems

### Problem 1

- **Description**: Set up a Prettier configuration that enforces the following rules:
  1. Use single quotes for strings
  2. No semicolons at the end of statements
  3. Use 2 spaces for indentation
  4. Limit line length to 80 characters

- **Solution**:

```json
// .prettierrc
{
  "singleQuote": true,
  "semi": false,
  "tabWidth": 2,
  "printWidth": 80
}
```

### Problem 2

- **Description**: Create a pre-commit hook using Husky and lint-staged that runs Prettier on staged JavaScript and CSS files before each commit.
- **Solution**:

1. Install necessary packages:

```bash
npm install --save-dev prettier husky lint-staged
```

2. Add the following to your `package.json`:

```json
{
  "husky": {
    "hooks": {
      "pre-commit": "lint-staged"
    }
  },
  "lint-staged": {
    "*.{js,css}": ["prettier --write", "git add"]
  }
}
```

This setup will run Prettier on staged `.js` and `.css` files before each commit, automatically formatting them.

---

## 5. Questions & Further Study

- Question 1: How can Prettier be configured to work alongside ESLint without conflicts?
- Question 2: What are the trade-offs between using Prettier and maintaining a detailed style guide?

> Additional Notes: Explore how Prettier handles different languages and how its behavior can be customized for each file type.

---

## 6. Reflection

- What did I learn from studying this topic? Prettier offers a simple yet powerful way to maintain consistent code formatting across projects and teams.
- How confident do I feel about this topic now? Comfortable with basic usage and configuration, but need more practice with integrating Prettier into complex development workflows.
- What should I review next? Dive deeper into advanced Prettier configurations, explore its plugin system, and study best practices for integrating Prettier with other development tools and CI/CD pipelines.
