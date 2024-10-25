# TypeScript Classes

**Date**: 2024/10/30
**Topic**: Classes in TypeScript
**Tags**: #learning #TypeScript #Classes #OOP

---

## 1. Key Concepts

- [ ] Class Declaration: Defining classes with properties and methods
- [ ] Access Modifiers: public, private, and protected members
- [ ] Inheritance: Extending classes and method overriding
- [ ] Abstract Classes: Creating base classes that can't be instantiated
- [ ] Interfaces with Classes: Implementing interfaces in classes

> Summary: TypeScript enhances JavaScript's class syntax with additional features for object-oriented programming, providing better encapsulation and type safety.

---

## 2. Detailed Notes

### 2.1. Introduction to Classes in TypeScript

- **Definition**: Classes in TypeScript are blueprints for creating objects, encapsulating data and behavior.
- **Why it's important**: Classes provide a way to structure code in an object-oriented manner, improving code organization and reusability.
- **Use cases**: Creating complex data structures, implementing design patterns, and organizing application logic.

### 2.2. Examples

```typescript
// Basic class
class Person {
    private name: string;
    public age: number;

    constructor(name: string, age: number) {
        this.name = name;
        this.age = age;
    }

    public introduce(): string {
        return `Hi, I'm ${this.name} and I'm ${this.age} years old.`;
    }
}

// Inheritance
class Employee extends Person {
    private department: string;

    constructor(name: string, age: number, department: string) {
        super(name, age);
        this.department = department;
    }

    public introduce(): string {
        return `${super.introduce()} I work in ${this.department}.`;
    }
}

// Abstract class
abstract class Shape {
    abstract getArea(): number;

    printArea(): void {
        console.log(`The area is: ${this.getArea()}`);
    }
}

class Circle extends Shape {
    constructor(private radius: number) {
        super();
    }

    getArea(): number {
        return Math.PI * this.radius ** 2;
    }
}

// Interface implementation
interface Printable {
    print(): void;
}

class Book implements Printable {
    constructor(private title: string) {}

    print(): void {
        console.log(`Printing: ${this.title}`);
    }
}
```

Explanation of the examples:

- We demonstrate basic class structure, inheritance, abstract classes, and interface implementation.
- Access modifiers (public, private) are used to control member visibility.
- The `super` keyword is used to call the parent class constructor and methods.

### 2.3. Challenges and Considerations

- Understanding when to use classes vs. interfaces or simple objects
- Properly designing class hierarchies to avoid deep inheritance chains
- Balancing encapsulation with the need for extensibility

---

## 3. Useful Resources

- [TypeScript Handbook: Classes](https://www.typescriptlang.org/docs/handbook/classes.html)
- [TypeScript Deep Dive: Classes](https://basarat.gitbook.io/typescript/future-javascript/classes)
- [TypeScript Playground](https://www.typescriptlang.org/play)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a `BankAccount` class with methods for deposit, withdraw, and checking balance. Include proper access modifiers.

```typescript
// Your code here
```

- **Solution**:

```typescript
class BankAccount {
    private balance: number = 0;

    public deposit(amount: number): void {
        if (amount > 0) {
            this.balance += amount;
            console.log(`Deposited ${amount}. New balance: ${this.balance}`);
        }
    }

    public withdraw(amount: number): void {
        if (amount > 0 && amount <= this.balance) {
            this.balance -= amount;
            console.log(`Withdrawn ${amount}. New balance: ${this.balance}`);
        } else {
            console.log("Insufficient funds");
        }
    }

    public getBalance(): number {
        return this.balance;
    }
}

const account = new BankAccount();
account.deposit(100);
account.withdraw(50);
console.log(account.getBalance());  // 50
```

### Problem 2

- **Description**: Implement a simple class hierarchy for geometric shapes. Create an abstract `Shape` class and two concrete classes `Circle` and `Rectangle` that inherit from it.
- **Solution**:

```typescript
abstract class Shape {
    abstract getArea(): number;
    abstract getPerimeter(): number;
}

class Circle extends Shape {
    constructor(private radius: number) {
        super();
    }

    getArea(): number {
        return Math.PI * this.radius ** 2;
    }

    getPerimeter(): number {
        return 2 * Math.PI * this.radius;
    }
}

class Rectangle extends Shape {
    constructor(private width: number, private height: number) {
        super();
    }

    getArea(): number {
        return this.width * this.height;
    }

    getPerimeter(): number {
        return 2 * (this.width + this.height);
    }
}

const circle = new Circle(5);
console.log(circle.getArea());  // ~78.54
const rectangle = new Rectangle(4, 5);
console.log(rectangle.getPerimeter());  // 18
```

---

## 5. Questions & Further Study

- Question 1: How do TypeScript classes differ from traditional OOP languages like Java or C#?
- Question 2: When should I use abstract classes instead of interfaces?

> Additional Notes: Explore advanced topics like mixins, decorators, and static members in classes.

---

## 6. Reflection

- What did I learn from studying this topic? (e.g., The power of TypeScript in enhancing JavaScript's OOP capabilities)
- How confident do I feel about this topic now? (e.g., Comfortable with basic class concepts, need more practice with advanced patterns)
- What should I review next? (e.g., Design patterns in TypeScript, advanced OOP concepts, or how classes compile to JavaScript)
