# TypeScript Enums and Advanced Types

**Date**: 2024/11/03
**Topic**: Enums and Advanced Types in TypeScript
**Tags**: #learning #TypeScript #Enums #AdvancedTypes

---

## 1. Key Concepts

- [ ] Enums: Defining a set of named constants
- [ ] Union Types: Allowing a value to be one of several types
- [ ] Intersection Types: Combining multiple types into one
- [ ] Literal Types: Using specific strings or numbers as types
- [ ] Conditional Types: Types that depend on a condition

> Summary: Enums and advanced types in TypeScript provide powerful tools for creating more expressive and precise type definitions, enhancing code clarity and type safety.

---

## 2. Detailed Notes

### 2.1. Introduction to Enums and Advanced Types

- **Definition**:
  - Enums: A way to define a set of named constants.
  - Advanced Types: More complex type constructs that allow for greater flexibility and precision in type definitions.
- **Why it's important**: These features allow for more expressive type systems, reducing errors and improving code readability.
- **Use cases**: Defining sets of related constants, creating complex type relationships, and enhancing type safety in various scenarios.

### 2.2. Examples

```typescript
// Enum
enum Direction {
    Up,
    Down,
    Left,
    Right
}
let move: Direction = Direction.Up;

// String Enum
enum Color {
    Red = "RED",
    Green = "GREEN",
    Blue = "BLUE"
}

// Union Types
type StringOrNumber = string | number;
function printId(id: StringOrNumber) {
    console.log(`Your ID is: ${id}`);
}

// Intersection Types
interface Colorful { color: string; }
interface Circle { radius: number; }
type ColorfulCircle = Colorful & Circle;

// Literal Types
type Easing = "ease-in" | "ease-out" | "ease-in-out";
function animate(easing: Easing) { /* ... */ }

// Conditional Types
type TypeName<T> = 
    T extends string ? "string" :
    T extends number ? "number" :
    T extends boolean ? "boolean" :
    T extends undefined ? "undefined" :
    T extends Function ? "function" :
    "object";

type T0 = TypeName<string>;  // "string"
type T1 = TypeName<"a">;     // "string"
type T2 = TypeName<true>;    // "boolean"
```

Explanation of the examples:

- Enums are used to define a set of named constants.
- Union types allow a value to be one of several types.
- Intersection types combine multiple types.
- Literal types use specific values as types.
- Conditional types create type relationships that depend on a condition.

### 2.3. Challenges and Considerations

- Understanding when to use enums vs union types of literals
- Managing complexity with advanced types
- Performance considerations with large conditional types

---

## 3. Useful Resources

- [TypeScript Handbook: Enums](https://www.typescriptlang.org/docs/handbook/enums.html)
- [TypeScript Handbook: Advanced Types](https://www.typescriptlang.org/docs/handbook/advanced-types.html)
- [TypeScript Playground](https://www.typescriptlang.org/play)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create an enum for card suits, then write a function that takes a card suit and returns whether it's a red or black suit.

```typescript
// Your code here
```

- **Solution**:

```typescript
enum CardSuit {
    Hearts = "Hearts",
    Diamonds = "Diamonds",
    Clubs = "Clubs",
    Spades = "Spades"
}

function isRedSuit(suit: CardSuit): boolean {
    return suit === CardSuit.Hearts || suit === CardSuit.Diamonds;
}

console.log(isRedSuit(CardSuit.Hearts));    // true
console.log(isRedSuit(CardSuit.Spades));    // false
```

### Problem 2

- **Description**: Create a type that represents either a 2D point (with x and y coordinates) or a 3D point (with x, y, and z coordinates). Then write a function that calculates the distance from the origin for both types of points.
- **Solution**:

```typescript
type Point2D = { x: number; y: number; };
type Point3D = { x: number; y: number; z: number; };
type Point = Point2D | Point3D;

function distanceFromOrigin(point: Point): number {
    const { x, y, z = 0 } = point;  // Default z to 0 for 2D points
    return Math.sqrt(x * x + y * y + z * z);
}

console.log(distanceFromOrigin({ x: 3, y: 4 }));          // 5
console.log(distanceFromOrigin({ x: 1, y: 2, z: 2 }));    // 3
```

---

## 5. Questions & Further Study

- Question 1: How do TypeScript's advanced types compare to type systems in other languages?
- Question 2: What are some real-world scenarios where conditional types are particularly useful?

> Additional Notes: Explore more complex scenarios involving mapped types, template literal types, and the infer keyword in conditional types.

---

## 6. Reflection

- What did I learn from studying this topic? (e.g., The expressiveness and power of TypeScript's type system)
- How confident do I feel about this topic now? (e.g., Comfortable with basic concepts, need more practice with advanced type manipulations)
- What should I review next? (e.g., Type inference with advanced types, practical applications in large codebases, or performance considerations)
