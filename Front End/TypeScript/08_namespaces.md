# TypeScript Namespaces

**Date**: 2024/11/01
**Topic**: Namespaces in TypeScript
**Tags**: #learning #TypeScript #Namespaces #CodeOrganization

---

## 1. Key Concepts

- [ ] Namespace Basics: Grouping related code under a single name
- [ ] Nested Namespaces: Creating hierarchical structures
- [ ] Namespace Exports: Making specific elements accessible outside the namespace
- [ ] Namespace Aliases: Creating shortcuts for long namespace names
- [ ] Namespaces vs Modules: Understanding when to use each

> Summary: Namespaces in TypeScript provide a way to organize code and prevent naming conflicts, especially useful in larger applications or when working with multiple libraries.

---

## 2. Detailed Notes

### 2.1. Introduction to Namespaces

- **Definition**: Namespaces are a TypeScript-specific way to organize code, grouping related functionality under a single name.
- **Why it's important**: They help prevent naming conflicts and provide a logical structure to code organization.
- **Use cases**: Large applications, libraries with many functions, or when working with multiple third-party libraries.

### 2.2. Examples

```typescript
// Basic namespace
namespace Validation {
    export interface StringValidator {
        isAcceptable(s: string): boolean;
    }

    export class LettersOnlyValidator implements StringValidator {
        isAcceptable(s: string) {
            return /^[A-Za-z]+$/.test(s);
        }
    }
}

// Using the namespace
let validator = new Validation.LettersOnlyValidator();
console.log(validator.isAcceptable("Hello")); // true

// Nested namespaces
namespace Shapes {
    export namespace Polygons {
        export class Triangle { /* ... */ }
        export class Square { /* ... */ }
    }
}

let sq = new Shapes.Polygons.Square();

// Namespace aliases
import polygons = Shapes.Polygons;
let tri = new polygons.Triangle();
```

Explanation of the examples:

- We demonstrate how to create and use basic namespaces.
- Nested namespaces show how to create hierarchical structures.
- Namespace aliases provide a way to create shortcuts for long namespace names.

### 2.3. Challenges and Considerations

- Deciding between namespaces and modules for code organization
- Managing dependencies between namespaces
- Avoiding excessive nesting that can lead to overly complex code

---

## 3. Useful Resources

- [TypeScript Handbook: Namespaces](https://www.typescriptlang.org/docs/handbook/namespaces.html)
- [TypeScript Namespaces and Modules](https://www.typescriptlang.org/docs/handbook/namespaces-and-modules.html)
- [TypeScript Playground](https://www.typescriptlang.org/play)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a namespace `MathOperations` with functions for basic arithmetic operations. Then use these functions in a separate file.

```typescript
// mathOperations.ts
// Your code here

// main.ts
// Your code here
```

- **Solution**:

```typescript
// mathOperations.ts
namespace MathOperations {
    export function add(x: number, y: number): number {
        return x + y;
    }
    export function subtract(x: number, y: number): number {
        return x - y;
    }
    export function multiply(x: number, y: number): number {
        return x * y;
    }
    export function divide(x: number, y: number): number {
        if (y === 0) throw new Error("Cannot divide by zero");
        return x / y;
    }
}

// main.ts
/// <reference path="mathOperations.ts" />
console.log(MathOperations.add(5, 3));      // 8
console.log(MathOperations.multiply(4, 2)); // 8
```

### Problem 2

- **Description**: Create a nested namespace structure for a simple game with entities and utilities. Include at least one class and one function in each namespace.
- **Solution**:

```typescript
namespace Game {
    export namespace Entities {
        export class Player {
            constructor(public name: string, public health: number) {}
        }
        export class Enemy {
            constructor(public type: string, public damage: number) {}
        }
    }

    export namespace Utils {
        export function calculateDamage(attacker: Entities.Enemy, defender: Entities.Player): number {
            return Math.min(attacker.damage, defender.health);
        }
        export function isGameOver(player: Entities.Player): boolean {
            return player.health <= 0;
        }
    }
}

// Usage
let player = new Game.Entities.Player("Hero", 100);
let enemy = new Game.Entities.Enemy("Dragon", 50);
let damage = Game.Utils.calculateDamage(enemy, player);
console.log(`Player took ${damage} damage`);
```

---

## 5. Questions & Further Study

- Question 1: How do namespaces in TypeScript compare to similar concepts in other languages (e.g., C# namespaces)?
- Question 2: In what scenarios might namespaces be preferred over modules in TypeScript?

> Additional Notes: Explore how namespaces are compiled to JavaScript and how they work with module systems.

---

## 6. Reflection

- What did I learn from studying this topic? (e.g., The role of namespaces in organizing large codebases)
- How confident do I feel about this topic now? (e.g., Understand basic concepts, need more practice with complex namespace structures)
- What should I review next? (e.g., Advanced namespace patterns, namespace merging, or transitioning from namespaces to modules)
