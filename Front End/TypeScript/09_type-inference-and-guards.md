# TypeScript Type Inference and Guards

**Date**: 2024/11/02
**Topic**: Type Inference and Type Guards in TypeScript
**Tags**: #learning #TypeScript #TypeInference #TypeGuards

---

## 1. Key Concepts

- [ ] Type Inference: TypeScript's ability to automatically determine types
- [ ] Best Common Type: How TypeScript infers types for arrays and union types
- [ ] Contextual Typing: Type inference based on the context of the code
- [ ] Type Guards: Runtime checks that guarantee the type within a certain scope
- [ ] User-Defined Type Guards: Creating custom type checking functions

> Summary: Type inference and type guards are powerful features in TypeScript that enhance type safety while reducing the need for explicit type annotations.

---

## 2. Detailed Notes

### 2.1. Introduction to Type Inference and Guards

- **Definition**:
  - Type Inference: The automatic detection of types for variables based on their usage.
  - Type Guards: Special checks that help narrow down the type of a variable within a conditional block.
- **Why it's important**: These features make TypeScript code more concise and safer, reducing errors and improving developer productivity.
- **Use cases**: Simplifying variable declarations, handling union types, and ensuring type safety in conditional logic.

### 2.2. Examples

```typescript
// Type Inference
let x = 3;  // TypeScript infers x is a number
let arr = [1, 2, 3];  // TypeScript infers arr is number[]

// Best Common Type
let arr2 = [1, 'hello', true];  // TypeScript infers (string | number | boolean)[]

// Contextual Typing
window.onmousedown = function(mouseEvent) {
    console.log(mouseEvent.button);  // TypeScript knows mouseEvent is a MouseEvent
};

// Type Guards
function padLeft(value: string, padding: string | number) {
    if (typeof padding === "number") {
        return Array(padding + 1).join(" ") + value;
    }
    if (typeof padding === "string") {
        return padding + value;
    }
    throw new Error(`Expected string or number, got '${padding}'.`);
}

// User-Defined Type Guard
interface Bird {
    fly(): void;
    layEggs(): void;
}

interface Fish {
    swim(): void;
    layEggs(): void;
}

function isFish(pet: Fish | Bird): pet is Fish {
    return (pet as Fish).swim !== undefined;
}

function move(pet: Fish | Bird) {
    if (isFish(pet)) {
        pet.swim();
    } else {
        pet.fly();
    }
}
```

Explanation of the examples:

- Type inference is shown for simple variables and arrays.
- The `typeof` operator is used as a type guard for primitive types.
- A user-defined type guard (`isFish`) is created to distinguish between custom types.

### 2.3. Challenges and Considerations

- Understanding when type inference might not provide the desired type
- Properly using type guards to narrow union types
- Balancing between relying on inference and providing explicit type annotations

---

## 3. Useful Resources

- [TypeScript Handbook: Type Inference](https://www.typescriptlang.org/docs/handbook/type-inference.html)
- [TypeScript Handbook: Narrowing](https://www.typescriptlang.org/docs/handbook/2/narrowing.html)
- [TypeScript Playground](https://www.typescriptlang.org/play)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a function that takes a parameter which could be either a string or an array of strings. If it's a string, return its length. If it's an array, return the total length of all strings in the array.

```typescript
// Your code here
```

- **Solution**:

```typescript
function getTotalLength(input: string | string[]): number {
    if (typeof input === "string") {
        return input.length;
    } else {
        return input.reduce((total, str) => total + str.length, 0);
    }
}

console.log(getTotalLength("Hello"));  // 5
console.log(getTotalLength(["Hi", "There"]));  // 7
```

### Problem 2

- **Description**: Implement a user-defined type guard to distinguish between `Circle` and `Rectangle` shapes, then use it in a function to calculate the area of the shape.
- **Solution**:

```typescript
interface Circle {
    kind: "circle";
    radius: number;
}

interface Rectangle {
    kind: "rectangle";
    width: number;
    height: number;
}

type Shape = Circle | Rectangle;

function isCircle(shape: Shape): shape is Circle {
    return shape.kind === "circle";
}

function calculateArea(shape: Shape): number {
    if (isCircle(shape)) {
        return Math.PI * shape.radius ** 2;
    } else {
        return shape.width * shape.height;
    }
}

console.log(calculateArea({ kind: "circle", radius: 5 }));  // ~78.54
console.log(calculateArea({ kind: "rectangle", width: 4, height: 5 }));  // 20
```

---

## 5. Questions & Further Study

- Question 1: How does TypeScript's type inference compare to other statically typed languages?
- Question 2: What are some advanced scenarios where type guards are particularly useful?

> Additional Notes: Explore more complex type guard patterns and how they interact with advanced types like conditional types and mapped types.

---

## 6. Reflection

- What did I learn from studying this topic? (e.g., The power of TypeScript in providing type safety with minimal explicit typing)
- How confident do I feel about this topic now? (e.g., Comfortable with basic type inference and guards, need more practice with complex scenarios)
- What should I review next? (e.g., Advanced type inference techniques, complex type guard patterns, or how these features interact with other TypeScript concepts)
