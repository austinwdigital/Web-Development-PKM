# Migrating to TypeScript

**Date**: 2024/11/08
**Topic**: Migrating to TypeScript
**Tags**: #learning #TypeScript #Migration #JavaScript

---

## 1. Key Concepts

- [ ] Incremental Migration: Gradually introducing TypeScript into a JavaScript project
- [ ] TypeScript Configuration: Setting up tsconfig.json for migration
- [ ] Declaration Files: Using and creating .d.ts files for existing JavaScript
- [ ] Any Type: Using 'any' as a temporary measure during migration
- [ ] Strict Mode: Gradually increasing TypeScript's strictness

> Summary: Migrating to TypeScript involves a step-by-step process of converting JavaScript to TypeScript, addressing type issues, and gradually increasing type safety.

---

## 2. Detailed Notes

### 2.1. Introduction to Migrating to TypeScript

- **Definition**: The process of converting an existing JavaScript project to TypeScript, either partially or fully.
- **Why it's important**: Migration allows teams to leverage TypeScript's benefits in existing projects, improving code quality and maintainability.
- **Use cases**: Enhancing large JavaScript codebases, preparing for scaling, improving developer experience in existing projects.

### 2.2. Examples

```typescript
// Example of migrating a JavaScript file to TypeScript

// Original JavaScript (app.js)
function greet(name) {
    return `Hello, ${name}!`;
}

const user = {
    name: "Alice",
    age: 30
};

console.log(greet(user.name));

// Migrated TypeScript (app.ts)
interface User {
    name: string;
    age: number;
}

function greet(name: string): string {
    return `Hello, ${name}!`;
}

const user: User = {
    name: "Alice",
    age: 30
};

console.log(greet(user.name));

// Example tsconfig.json for migration
{
  "compilerOptions": {
    "target": "es6",
    "module": "commonjs",
    "allowJs": true,
    "checkJs": true,
    "outDir": "./dist",
    "strict": false,
    "noImplicitAny": false,
    "strictNullChecks": false
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules"]
}
```

Explanation of the examples:

- The JavaScript to TypeScript migration adds type annotations and interfaces.
- The tsconfig.json is set up to allow JavaScript files and gradually introduce strictness.

### 2.3. Challenges and Considerations

- Dealing with dynamic typing and 'any' type during initial migration
- Managing third-party libraries without TypeScript support
- Balancing migration speed with maintaining a working application
- Educating team members on TypeScript features and best practices

---

## 3. Useful Resources

- [TypeScript Migration Guide](https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html)
- [Adopting TypeScript at Scale](https://www.youtube.com/watch?v=P-J9Eg7hJwE)
- [TypeScript Deep Dive: Migrating from JavaScript](https://basarat.gitbook.io/typescript/getting-started/migrating-from-javascript)

---

## 4. Practice Problems

### Problem 1

- **Description**: Convert the following JavaScript code to TypeScript, adding appropriate types and interfaces.

```javascript
// Your code here
function createUser(name, age, isAdmin) {
    return { name, age, isAdmin, createdAt: new Date() };
}

const users = [
    createUser("Alice", 28, true),
    createUser("Bob", 35, false)
];

function printUserInfo(user) {
    console.log(`${user.name} (${user.age}) - Admin: ${user.isAdmin}`);
}

users.forEach(printUserInfo);
```

- **Solution**:

```typescript
interface User {
    name: string;
    age: number;
    isAdmin: boolean;
    createdAt: Date;
}

function createUser(name: string, age: number, isAdmin: boolean): User {
    return { name, age, isAdmin, createdAt: new Date() };
}

const users: User[] = [
    createUser("Alice", 28, true),
    createUser("Bob", 35, false)
];

function printUserInfo(user: User): void {
    console.log(`${user.name} (${user.age}) - Admin: ${user.isAdmin}`);
}

users.forEach(printUserInfo);
```

### Problem 2

- **Description**: Create a declaration file (.d.ts) for a simple JavaScript library that doesn't have TypeScript support.
- **Solution**:

```typescript
// Assume this is a JavaScript library named 'simpleLib'
// simpleLib.d.ts

declare module 'simpleLib' {
    export function add(a: number, b: number): number;
    export function subtract(a: number, b: number): number;
    export class Calculator {
        constructor(initialValue: number);
        add(value: number): void;
        subtract(value: number): void;
        getCurrentValue(): number;
    }
}
```

---

## 5. Questions & Further Study

- Question 1: What are some strategies for convincing a team to migrate to TypeScript?
- Question 2: How can you measure the success and impact of a TypeScript migration?

> Additional Notes: Explore tools like 'ts-migrate' for automating parts of the migration process, and consider studying case studies of large-scale TypeScript migrations.

---

## 6. Reflection

- What did I learn from studying this topic? (e.g., The complexities and benefits of migrating to TypeScript)
- How confident do I feel about this topic now? (e.g., Understand the basic process, need more practice with large-scale migrations)
- What should I review next? (e.g., Advanced migration techniques, handling complex JavaScript patterns in TypeScript, or strategies for migrating different frameworks/libraries)
