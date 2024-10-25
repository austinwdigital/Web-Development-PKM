# TypeScript Basic Types

**Date**: 2024/10/25
**Topic**: Basic Types in TypeScript
**Tags**: #learning #TypeScript #BasicTypes

---

## 1. Key Concepts

- [ ] Primitive Types: number, string, boolean
- [ ] Complex Types: array, tuple, enum
- [ ] Special Types: any, void, null, undefined

> Summary: TypeScript provides a rich set of basic types that help in writing more robust and error-free code by catching type-related issues at compile-time.

---

## 2. Detailed Notes

### 2.1. Introduction to Basic Types in TypeScript

- **Definition**: Basic types in TypeScript are the fundamental building blocks for describing the shape and behavior of data.
- **Why it's important**: They provide type safety, improve code readability, and enhance developer productivity through better tooling support.
- **Use cases**: Declaring variables, function parameters, return types, and object properties.

### 2.2. Examples

```typescript
// Primitive types
let age: number = 30;
let name: string = "John Doe";
let isStudent: boolean = false;

// Array
let fruits: string[] = ["apple", "banana", "orange"];

// Tuple
let person: [string, number] = ["Alice", 25];

// Enum
enum Color {
  Red,
  Green,
  Blue
}
let favoriteColor: Color = Color.Blue;

// Any
let notSure: any = 4;
notSure = "maybe a string instead";

// Void (typically used as the return type of functions that do not return a value)
function logMessage(message: string): void {
  console.log(message);
}
```

Explanation of the example:

- This code demonstrates various basic types in TypeScript.
- It shows how to declare variables with specific types and how to use more complex types like arrays, tuples, and enums.

### 2.3. Challenges and Considerations

- Choosing the appropriate type for variables and function parameters
- Understanding when to use `any` type and its implications
- Properly using union types and type assertions when needed

---

## 3. Useful Resources

- [TypeScript Handbook: Basic Types](https://www.typescriptlang.org/docs/handbook/basic-types.html)
- [TypeScript Deep Dive: Types](https://basarat.gitbook.io/typescript/type-system)
- [TypeScript Playground](https://www.typescriptlang.org/play)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a function that takes an array of numbers and returns the sum of all even numbers in the array.

```typescript
function sumEvenNumbers(numbers: number[]): number {
  // Your code here
}
```

- **Solution**:

```typescript
function sumEvenNumbers(numbers: number[]): number {
  return numbers.filter(n => n % 2 === 0).reduce((sum, n) => sum + n, 0);
}
```

### Problem 2

- **Description**: Define an interface for a `Book` with properties for title (string), author (string), and pages (number). Then create an array of Books.
- **Solution**:

```typescript
interface Book {
  title: string;
  author: string;
  pages: number;
}

const books: Book[] = [
  { title: "TypeScript Basics", author: "John Doe", pages: 200 },
  { title: "Advanced TypeScript", author: "Jane Smith", pages: 350 }
];
```

---

## 5. Questions & Further Study

- Question 1: How do TypeScript's basic types differ from JavaScript's types?
- Question 2: When should I use `unknown` instead of `any`?

> Additional Notes: Pay attention to type inference in TypeScript, as it can often deduce types without explicit annotations.

---

## 6. Reflection

- What did I learn from studying this topic? (e.g., The importance of choosing the right type for better code quality)
- How confident do I feel about this topic now? (e.g., Comfortable with primitive types, need more practice with complex types)
- What should I review next? (e.g., Advanced types, generics, or type assertions)
