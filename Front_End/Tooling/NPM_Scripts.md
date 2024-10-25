# NPM Scripts Overview

**Date**: 2024/10/25
**Topic**: NPM Scripts
**Tags**: #tooling #javascript #npm #task-runner #build-automation

---

## 1. Key Concepts

- [x] package.json: Central configuration for npm projects and scripts
- [x] Script Definitions: Custom commands defined in the "scripts" section
- [x] Pre and Post Hooks: Automatic script execution before or after specified scripts
- [x] Cross-platform Compatibility: Writing scripts that work across different operating systems

> Summary: NPM Scripts provide a simple yet powerful way to automate tasks in JavaScript projects, leveraging the npm ecosystem without the need for additional task runners.

---

## 2. Detailed Notes

### 2.1. Introduction to NPM Scripts

- **Definition**: NPM Scripts are custom commands defined in a project's package.json file, allowing developers to automate various tasks.
- **Why it's important**: They provide a standardized way to run tasks, reducing the need for external task runners and improving project consistency.
- **Use cases**: Building applications, running tests, starting development servers, linting code, and deploying applications.

### 2.2. Examples

```json
{
  "name": "my-project",
  "version": "1.0.0",
  "scripts": {
    "start": "node server.js",
    "test": "jest",
    "build": "webpack --mode production",
    "lint": "eslint .",
    "pretest": "npm run lint",
    "postbuild": "echo 'Build complete!'"
  }
}
```

Usage examples:

```bash
npm run start
npm test
npm run build
```

Explanation of the examples:

- The `start` script runs the main server file.
- `test` runs the Jest testing framework.
- `build` uses webpack to create a production build.
- `lint` runs ESLint on all files.
- `pretest` automatically runs before `test`, ensuring linting is done before testing.
- `postbuild` runs after the build process, providing a simple notification.

### 2.3. Challenges and Considerations

- Script Complexity: Long or complex commands can become hard to read and maintain.
- Environment Variables: Managing different environments (development, production, etc.) can be tricky.
- Cross-platform Issues: Ensuring scripts work on both Windows and Unix-based systems.

---

## 3. Useful Resources

- [NPM Scripts Documentation](https://docs.npmjs.com/cli/v7/using-npm/scripts)
- [Introduction to NPM Scripts](https://www.freecodecamp.org/news/introduction-to-npm-scripts-1dbb2ae01633/)
- [Awesome npm scripts](https://github.com/RyanZim/awesome-npm-scripts)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a set of npm scripts that:
  1. Runs a development server
  2. Builds the project for production
  3. Runs tests and linting before the build

- **Solution**:

```json
{
  "scripts": {
    "start": "webpack-dev-server --mode development",
    "build": "webpack --mode production",
    "test": "jest",
    "lint": "eslint .",
    "prebuild": "npm run test && npm run lint"
  }
}
```

### Problem 2

- **Description**: Create a cross-platform npm script that cleans the `dist` directory before building.
- **Solution**:

```json
{
  "scripts": {
    "clean": "rimraf dist",
    "build": "npm run clean && webpack --mode production"
  }
}
```

Note: This solution uses the `rimraf` package, which should be installed as a dev dependency: `npm install rimraf --save-dev`

---

## 5. Questions & Further Study

- Question 1: How can npm scripts be used in conjunction with other build tools like Gulp or Webpack?
- Question 2: What are the limitations of npm scripts compared to dedicated task runners?

> Additional Notes: Explore how to use npm scripts in a monorepo setup or how to share common scripts across multiple projects.

---

## 6. Reflection

- What did I learn from studying this topic? NPM Scripts offer a powerful, built-in solution for task automation in JavaScript projects, reducing the need for external tools.
- How confident do I feel about this topic now? Comfortable with basic script creation and usage, but need more practice with complex scenarios and cross-platform considerations.
- What should I review next? Dive deeper into advanced npm script techniques, such as using `npm-run-all` for parallel script execution or leveraging environment variables effectively.
