# TypeScript Generics

**Date**: 2024/10/29
**Topic**: Generics in TypeScript
**Tags**: #learning #TypeScript #Generics

---

## 1. Key Concepts

- [ ] Generic Functions: Functions that work with multiple types
- [ ] Generic Interfaces: Interfaces that can work with different types
- [ ] Generic Classes: Classes that can work with various types
- [ ] Constraints: Limiting the types that can be used with generics

> Summary: Generics in TypeScript allow you to create reusable components that can work with a variety of types while maintaining type safety.

---

## 2. Detailed Notes

### 2.1. Introduction to Generics

- **Definition**: Generics are a way to create reusable code components that can work with multiple types while preserving type information.
- **Why it's important**: Generics provide flexibility and type safety, allowing you to write code that can work with different data types without sacrificing static type checking.
- **Use cases**: Creating flexible functions, classes, and interfaces that can work with various data types.

### 2.2. Examples

```typescript
// Generic function
function identity<T>(arg: T): T {
    return arg;
}

let output = identity<string>("myString");
let output2 = identity(42); // Type inference

// Generic interface
interface GenericIdentityFn<T> {
    (arg: T): T;
}

let myIdentity: GenericIdentityFn<number> = identity;

// Generic class
class GenericNumber<T> {
    zeroValue: T;
    add: (x: T, y: T) => T;
}

let myGenericNumber = new GenericNumber<number>();
myGenericNumber.zeroValue = 0;
myGenericNumber.add = function(x, y) { return x + y; };

// Generic with constraints
interface Lengthwise {
    length: number;
}

function loggingIdentity<T extends Lengthwise>(arg: T): T {
    console.log(arg.length);  // Now we know it has a .length property
    return arg;
}
```

Explanation of the examples:

- We demonstrate generic functions, interfaces, and classes.
- Type inference allows TypeScript to deduce the type in some cases.
- Constraints are used to limit the types that can be used with a generic.

### 2.3. Challenges and Considerations

- Understanding when to use generics vs. specific types
- Properly constraining generics to ensure type safety
- Balancing flexibility and readability in generic code

---

## 3. Useful Resources

- [TypeScript Handbook: Generics](https://www.typescriptlang.org/docs/handbook/generics.html)
- [TypeScript Deep Dive: Generics](https://basarat.gitbook.io/typescript/type-system/generics)
- [TypeScript Playground](https://www.typescriptlang.org/play)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a generic function `reverseArray` that takes an array of any type and returns the reversed array.

```typescript
// Your code here
```

- **Solution**:

```typescript
function reverseArray<T>(array: T[]): T[] {
    return array.reverse();
}

console.log(reverseArray([1, 2, 3, 4, 5]));  // [5, 4, 3, 2, 1]
console.log(reverseArray(["a", "b", "c"]));  // ["c", "b", "a"]
```

### Problem 2

- **Description**: Implement a generic `Stack` class with `push`, `pop`, and `peek` methods.
- **Solution**:

```typescript
class Stack<T> {
    private items: T[] = [];

    push(item: T): void {
        this.items.push(item);
    }

    pop(): T | undefined {
        return this.items.pop();
    }

    peek(): T | undefined {
        return this.items[this.items.length - 1];
    }
}

const numberStack = new Stack<number>();
numberStack.push(1);
numberStack.push(2);
console.log(numberStack.pop());  // 2
console.log(numberStack.peek()); // 1
```

---

## 5. Questions & Further Study

- Question 1: How do generics in TypeScript compare to templates in C++?
- Question 2: When should I use generics instead of the `any` type?

> Additional Notes: Explore advanced topics like generic constraints with key-of type operators and conditional types.

---

## 6. Reflection

- What did I learn from studying this topic? (e.g., The power of writing flexible, type-safe code with generics)
- How confident do I feel about this topic now? (e.g., Comfortable with basic concepts, need more practice with advanced scenarios)
- What should I review next? (e.g., Advanced generic patterns, type inference, or conditional types)
