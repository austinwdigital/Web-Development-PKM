# TypeScript Utility Types

**Date**: 2024/11/04
**Topic**: Utility Types in TypeScript
**Tags**: #learning #TypeScript #UtilityTypes

---

## 1. Key Concepts

- [ ] Partial<T>: Make all properties in T optional
- [ ] Required<T>: Make all properties in T required
- [ ] Readonly<T>: Make all properties in T readonly
- [ ] Pick<T, K>: From T, pick a set of properties K
- [ ] Omit<T, K>: Construct a type with all properties from T except for those in K
- [ ] Record<K, T>: Construct a type with a set of properties K of type T

> Summary: Utility types in TypeScript provide powerful tools for common type transformations, enhancing code reusability and type manipulation capabilities.

---

## 2. Detailed Notes

### 2.1. Introduction to Utility Types

- **Definition**: Utility types are pre-defined generic types in TypeScript that facilitate common type transformations.
- **Why it's important**: They provide a standardized way to perform type manipulations, reducing boilerplate code and improving type safety.
- **Use cases**: Modifying existing types, creating new types based on existing ones, and handling common patterns in type definitions.

### 2.2. Examples

```typescript
interface Todo {
    title: string;
    description: string;
    completed: boolean;
}

// Partial<T>
function updateTodo(todo: Todo, fieldsToUpdate: Partial<Todo>) {
    return { ...todo, ...fieldsToUpdate };
}

// Required<T>
type RequiredTodo = Required<Partial<Todo>>;

// Readonly<T>
const todo: Readonly<Todo> = {
    title: "Learn TypeScript",
    description: "Study utility types",
    completed: false
};

// Pick<T, K>
type TodoPreview = Pick<Todo, "title" | "completed">;

// Omit<T, K>
type TodoWithoutDescription = Omit<Todo, "description">;

// Record<K, T>
type PageInfo = {
    title: string;
};
type Page = "home" | "about" | "contact";

const nav: Record<Page, PageInfo> = {
    home: { title: "Home" },
    about: { title: "About" },
    contact: { title: "Contact" },
};
```

Explanation of the examples:

- `Partial<T>` is used to make all properties optional, useful for update functions.
- `Required<T>` makes all properties required, even if they were originally optional.
- `Readonly<T>` creates a type with all properties set to readonly.
- `Pick<T, K>` creates a type by picking a set of properties from another type.
- `Omit<T, K>` creates a type by omitting specific properties from another type.
- `Record<K, T>` creates an object type whose property keys are K and values are T.

### 2.3. Challenges and Considerations

- Understanding when to use each utility type
- Combining multiple utility types for complex type transformations
- Performance considerations when using utility types with large interfaces

---

## 3. Useful Resources

- [TypeScript Handbook: Utility Types](https://www.typescriptlang.org/docs/handbook/utility-types.html)
- [TypeScript Playground](https://www.typescriptlang.org/play)
- [TypeScript Deep Dive: Utility Types](https://basarat.gitbook.io/typescript/type-system/utility-types)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a function that takes an object and makes all its properties optional, then updates only the provided properties.

```typescript
// Your code here
```

- **Solution**:

```typescript
function partialUpdate<T extends object>(obj: T, updates: Partial<T>): T {
    return { ...obj, ...updates };
}

interface User {
    name: string;
    age: number;
    email: string;
}

const user: User = {
    name: "John Doe",
    age: 30,
    email: "john@example.com"
};

const updatedUser = partialUpdate(user, { age: 31 });
console.log(updatedUser);  // { name: "John Doe", age: 31, email: "john@example.com" }
```

### Problem 2

- **Description**: Create a type that represents a config object where all properties are optional except for a required 'id' property.
- **Solution**:

```typescript
type Config = {
    id: string;
    name?: string;
    description?: string;
    isEnabled?: boolean;
};

type OptionalConfig = Partial<Omit<Config, 'id'>> & Pick<Config, 'id'>;

const validConfig: OptionalConfig = {
    id: "123",
    name: "My Config"
};

// This would be a type error:
// const invalidConfig: OptionalConfig = { name: "Invalid" };
```

---

## 5. Questions & Further Study

- Question 1: How do utility types in TypeScript compare to similar features in other languages?
- Question 2: What are some advanced scenarios where combining multiple utility types is particularly useful?

> Additional Notes: Explore creating custom utility types and how they can be used to solve specific problems in your codebase.

---

## 6. Reflection

- What did I learn from studying this topic? (e.g., The power of TypeScript's built-in type manipulation capabilities)
- How confident do I feel about this topic now? (e.g., Comfortable with basic utility types, need more practice with complex combinations)
- What should I review next? (e.g., Advanced type manipulations, creating custom utility types, or practical applications in large projects)
