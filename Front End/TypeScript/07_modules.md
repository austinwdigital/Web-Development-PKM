# TypeScript Modules

**Date**: 2024/10/31
**Topic**: Modules in TypeScript
**Tags**: #learning #TypeScript #Modules #CodeOrganization

---

## 1. Key Concepts

- [ ] Module Basics: Organizing code into separate files
- [ ] Export and Import: Sharing code between modules
- [ ] Default Exports: Exporting a single main feature from a module
- [ ] Namespace vs Module: Understanding the difference and when to use each
- [ ] Module Resolution: How TypeScript finds and loads modules

> Summary: Modules in TypeScript provide a way to organize and encapsulate code, making large applications more manageable and promoting code reuse.

---

## 2. Detailed Notes

### 2.1. Introduction to Modules in TypeScript

- **Definition**: Modules are a way to split code into separate files, each containing related functionality.
- **Why it's important**: Modules help in organizing large codebases, preventing naming conflicts, and controlling the visibility of code.
- **Use cases**: Structuring large applications, creating reusable libraries, and separating concerns in code.

### 2.2. Examples

```typescript
// math.ts
export function add(x: number, y: number): number {
    return x + y;
}

export function subtract(x: number, y: number): number {
    return x - y;
}

export default class Calculator {
    multiply(x: number, y: number): number {
        return x * y;
    }
}

// main.ts
import Calculator, { add, subtract } from './math';

console.log(add(5, 3));  // 8
console.log(subtract(10, 4));  // 6

const calc = new Calculator();
console.log(calc.multiply(2, 3));  // 6

// Importing entire module
import * as MathUtils from './math';
console.log(MathUtils.add(2, 2));  // 4
```

Explanation of the examples:

- We demonstrate how to export functions and classes from a module.
- The `import` statement is used to bring in specific exports or the entire module.
- Default exports are imported without curly braces.

### 2.3. Challenges and Considerations

- Managing circular dependencies between modules
- Understanding different module systems (CommonJS, AMD, ES6) and their compatibility
- Properly configuring module resolution in TypeScript compiler options

---

## 3. Useful Resources

- [TypeScript Handbook: Modules](https://www.typescriptlang.org/docs/handbook/modules.html)
- [TypeScript Module Resolution](https://www.typescriptlang.org/docs/handbook/module-resolution.html)
- [TypeScript Playground](https://www.typescriptlang.org/play)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create two modules: one for a `User` class and another for user-related utility functions. Then import and use them in a main file.

```typescript
// user.ts
// Your code here

// userUtils.ts
// Your code here

// main.ts
// Your code here
```

- **Solution**:

```typescript
// user.ts
export class User {
    constructor(public name: string, public age: number) {}
}

// userUtils.ts
export function printUserInfo(user: User): void {
    console.log(`Name: ${user.name}, Age: ${user.age}`);
}

// main.ts
import { User } from './user';
import { printUserInfo } from './userUtils';

const user = new User("Alice", 30);
printUserInfo(user);
```

### Problem 2

- **Description**: Create a module with a default export and several named exports. Then demonstrate different ways to import and use these exports in another file.
- **Solution**:

```typescript
// shapes.ts
export interface Shape {
    area(): number;
}

export class Circle implements Shape {
    constructor(private radius: number) {}
    area(): number {
        return Math.PI * this.radius ** 2;
    }
}

export class Rectangle implements Shape {
    constructor(private width: number, private height: number) {}
    area(): number {
        return this.width * this.height;
    }
}

export default function createShape(type: 'circle' | 'rectangle', ...args: number[]): Shape {
    if (type === 'circle') return new Circle(args[0]);
    return new Rectangle(args[0], args[1]);
}

// main.ts
import createShape, { Circle, Rectangle, Shape } from './shapes';

const myCircle = new Circle(5);
console.log(myCircle.area());

const myRectangle = createShape('rectangle', 4, 5);
console.log(myRectangle.area());

// Alternatively
import * as Shapes from './shapes';
const anotherCircle = new Shapes.Circle(3);
console.log(anotherCircle.area());
```

---

## 5. Questions & Further Study

- Question 1: How do TypeScript modules differ from ES6 modules?
- Question 2: What are the best practices for organizing modules in a large TypeScript project?

> Additional Notes: Explore advanced topics like dynamic imports and module augmentation in TypeScript.

---

## 6. Reflection

- What did I learn from studying this topic? (e.g., The importance of proper code organization in large projects)
- How confident do I feel about this topic now? (e.g., Comfortable with basic module concepts, need more practice with advanced module patterns)
- What should I review next? (e.g., Namespaces, module bundlers, or how modules are compiled to different target environments)
