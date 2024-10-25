# Topic Overview

**Date**: 2024/10/28
**Topic**: Functions in TypeScript
**Tags**: #learning #TypeScript #Functions

---

## 1. Key Concepts

- [ ] Function Types: Defining the structure of functions
- [ ] Optional and Default Parameters: Flexibility in function arguments
- [ ] Rest Parameters: Handling variable number of arguments
- [ ] Function Overloading: Multiple function signatures for the same function

> Summary: TypeScript enhances JavaScript functions with static typing, providing better tooling support and catching errors at compile-time.

---

## 2. Detailed Notes

### 2.1. Introduction to Functions in TypeScript

- **Definition**: Functions in TypeScript are similar to JavaScript but with added type annotations for parameters and return values.
- **Why it's important**: Type annotations improve code readability, catch errors early, and provide better IntelliSense in IDEs.
- **Use cases**: Any scenario where you need to encapsulate reusable code with well-defined inputs and outputs.

### 2.2. Examples

```typescript
// Basic function with type annotations
function greet(name: string): string {
  return `Hello, ${name}!`;
}

// Arrow function with optional parameter
const greetOptional = (name?: string): string => {
  return `Hello, ${name || 'Guest'}!`;
};

// Function with default parameter
function greetWithDefault(name: string = 'Guest'): string {
  return `Hello, ${name}!`;
}

// Function with rest parameters
function sum(...numbers: number[]): number {
  return numbers.reduce((total, num) => total + num, 0);
}

// Function overloading
function padding(all: number): string;
function padding(topBottom: number, leftRight: number): string;
function padding(top: number, right: number, bottom: number, left: number): string;
function padding(a: number, b?: number, c?: number, d?: number): string {
  if (b === undefined && c === undefined && d === undefined) {
    b = c = d = a;
  } else if (c === undefined && d === undefined) {
    c = a;
    d = b;
  }
  return `${a}px ${b}px ${c}px ${d}px`;
}
```

Explanation of the examples:

- We demonstrate various function declarations with type annotations.
- Optional parameters, default values, and rest parameters are shown.
- Function overloading allows multiple function signatures for different use cases.

### 2.3. Challenges and Considerations

- Balancing flexibility and type safety when designing function signatures.
- Understanding when to use function overloading vs. optional parameters.
- Properly typing higher-order functions and callbacks.

---

## 3. Useful Resources

- [TypeScript Handbook: Functions](https://www.typescriptlang.org/docs/handbook/functions.html)
- [TypeScript Deep Dive: Functions](https://basarat.gitbook.io/typescript/type-system/functions)
- [TypeScript Playground](https://www.typescriptlang.org/play)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a function `calculateArea` that can calculate the area of either a circle or a rectangle. Use function overloading to achieve this.

```typescript
// Your code here
```

- **Solution**:

```typescript
function calculateArea(shape: 'circle', radius: number): number;
function calculateArea(shape: 'rectangle', width: number, height: number): number;
function calculateArea(shape: 'circle' | 'rectangle', a: number, b?: number): number {
  if (shape === 'circle') {
    return Math.PI * a * a;
  } else {
    return a * (b as number);
  }
}

console.log(calculateArea('circle', 5));  // 78.54
console.log(calculateArea('rectangle', 4, 5));  // 20
```

### Problem 2

- **Description**: Implement a higher-order function `repeat` that takes a function and a number, and returns a new function that calls the original function that many times.
- **Solution**:

```typescript
function repeat(fn: () => void, times: number): () => void {
  return () => {
    for (let i = 0; i < times; i++) {
      fn();
    }
  };
}

const greet = () => console.log('Hello!');
const greetTwice = repeat(greet, 2);
greetTwice();  // Logs 'Hello!' twice
```

---

## 5. Questions & Further Study

- Question 1: How do TypeScript function types differ from JavaScript function types?
- Question 2: When should I use function overloading instead of union types for parameters?

> Additional Notes: Explore advanced topics like generic functions and this parameters in functions.

---

## 6. Reflection

- What did I learn from studying this topic? (e.g., The power of static typing in function declarations)
- How confident do I feel about this topic now? (e.g., Comfortable with basic concepts, need more practice with advanced scenarios)
- What should I review next? (e.g., Generics, classes, or advanced function techniques)
