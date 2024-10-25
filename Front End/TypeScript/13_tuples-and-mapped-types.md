# TypeScript Tuples and Mapped Types

**Date**: 2024/11/06
**Topic**: Tuples and Mapped Types in TypeScript
**Tags**: #learning #TypeScript #Tuples #MappedTypes

---

## 1. Key Concepts

- [ ] Tuples: Fixed-length arrays where each element may have a different type
- [ ] Tuple Types: Defining the structure of tuples
- [ ] Mapped Types: Creating new types based on existing ones
- [ ] Keyof Operator: Obtaining the keys of a type as a union
- [ ] Index Types: Accessing the type of a property using indexed access

> Summary: Tuples and mapped types in TypeScript provide powerful tools for creating structured data and transforming existing types, enhancing type safety and code flexibility.

---

## 2. Detailed Notes

### 2.1. Introduction to Tuples and Mapped Types

- **Definition**:
  - Tuples: Arrays with a fixed number of elements whose types are known.
  - Mapped Types: Ways to create new types based on old ones by transforming properties.
- **Why it's important**: These features allow for more precise type definitions and powerful type transformations.
- **Use cases**: Representing structured data, creating type-safe APIs, and performing systematic type modifications.

### 2.2. Examples

```typescript
// Tuples
let person: [string, number] = ['Alice', 30];
console.log(person[0].substring(1)); // OK
console.log(person[1].toFixed(2));   // OK

// Tuple with optional elements
type StringNumberBooleans = [string, number, ...boolean[]];
let snb: StringNumberBooleans = ['hello', 42, true, false, true];

// Mapped Types
type Readonly<T> = {
    readonly [P in keyof T]: T[P];
};

interface Todo {
    title: string;
    description: string;
}

const todo: Readonly<Todo> = {
    title: "Learn TypeScript",
    description: "Study tuples and mapped types"
};

// todo.title = "New Title"; // Error: Cannot assign to 'title' because it is a read-only property.

// Keyof and Index Types
type TodoKeys = keyof Todo; // "title" | "description"

function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
    return obj[key];
}

const todoTitle = getProperty(todo, "title"); // type is string
```

Explanation of the examples:

- Tuples are defined with specific types for each element.
- Mapped types create new types by transforming properties of existing types.
- The `keyof` operator is used to get a union of property names.
- Index types allow for type-safe property access.

### 2.3. Challenges and Considerations

- Understanding when to use tuples vs. objects or regular arrays
- Managing complexity in mapped types with multiple transformations
- Ensuring type safety when working with dynamic property access

---

## 3. Useful Resources

- [TypeScript Handbook: Tuples](https://www.typescriptlang.org/docs/handbook/basic-types.html#tuple)
- [TypeScript Handbook: Mapped Types](https://www.typescriptlang.org/docs/handbook/advanced-types.html#mapped-types)
- [TypeScript Playground](https://www.typescriptlang.org/play)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a function that takes a tuple representing a RGB color (three numbers from 0-255) and returns a string representation of the color in hexadecimal format.

```typescript
// Your code here
```

- **Solution**:

```typescript
type RGB = [number, number, number];

function rgbToHex(color: RGB): string {
    return '#' + color.map(c => {
        const hex = c.toString(16);
        return hex.length === 1 ? '0' + hex : hex;
    }).join('');
}

console.log(rgbToHex([255, 128, 0])); // "#ff8000"
```

### Problem 2

- **Description**: Create a mapped type that makes all properties of an interface optional and nullable (can be null).
- **Solution**:

```typescript
type Nullable<T> = { [P in keyof T]: T[P] | null };
type Optional<T> = { [P in keyof T]?: T[P] };
type NullableOptional<T> = Optional<Nullable<T>>;

interface User {
    id: number;
    name: string;
    email: string;
}

type NullableOptionalUser = NullableOptional<User>;

const user: NullableOptionalUser = {
    id: 1,
    name: null,
    // email can be omitted
};
```

---

## 5. Questions & Further Study

- Question 1: How do tuples in TypeScript compare to similar concepts in other programming languages?
- Question 2: What are some advanced scenarios where mapped types are particularly useful?

> Additional Notes: Explore more complex mapped types, such as conditional mapped types and recursive mapped types.

---

## 6. Reflection

- What did I learn from studying this topic? (e.g., The power of TypeScript in creating precise data structures and type transformations)
- How confident do I feel about this topic now? (e.g., Comfortable with basic tuples and mapped types, need more practice with advanced scenarios)
- What should I review next? (e.g., Advanced tuple manipulations, complex mapped types, or practical applications in large-scale projects)
