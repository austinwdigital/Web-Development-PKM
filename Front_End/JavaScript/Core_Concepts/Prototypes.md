# Prototypes Overview

**Date**: 2024/10/25
**Topic**: Prototypes
**Tags**: #learning #prototypes #javascript

---

## 1. Key Concepts

- [x] Prototype Chain: Objects can inherit properties and methods from other objects through the prototype chain.
- [x] `__proto__`: The property that points to the object's prototype.
- [x] `prototype` Property: Function objects have a `prototype` property that is used when the function is used as a constructor.

> Summary: Prototypes are the mechanism by which JavaScript objects inherit features from one another, forming the basis for prototypal inheritance.

---

## 2. Detailed Notes

### 2.1. Introduction to Prototypes

- **Definition**: A prototype is an object that serves as a template for other objects, allowing them to inherit properties and methods.
- **Why it's important**: Prototypes are fundamental to JavaScript's object-oriented programming model and enable efficient inheritance and memory usage.
- **Use cases**: Creating object hierarchies, implementing inheritance, and extending built-in objects.

### 2.2. Examples

```javascript
// Constructor function
function Animal(name) {
  this.name = name;
}

// Adding a method to the prototype
Animal.prototype.sayHello = function() {
  console.log(`Hello, I'm ${this.name}`);
};

// Creating an instance
const cat = new Animal("Whiskers");
cat.sayHello(); // Outputs: "Hello, I'm Whiskers"

// Checking the prototype chain
console.log(cat.__proto__ === Animal.prototype); // true
console.log(Animal.prototype.__proto__ === Object.prototype); // true
```

Explanation of the example:

- `Animal` is a constructor function with a `prototype` property.
- `sayHello` method is added to `Animal.prototype`, making it available to all instances.
- `cat` is an instance of `Animal` and inherits from `Animal.prototype`.
- The prototype chain extends from `cat` to `Animal.prototype` to `Object.prototype`.

### 2.3. Challenges and Considerations

- Performance: Lookups through the prototype chain can be slower than direct property access.
- Shadowing: Properties on an object can shadow properties of the same name in the prototype chain.
- Mutability: Modifying an object's prototype affects all objects that inherit from it.

---

## 3. Useful Resources

- [MDN Web Docs - Object prototypes](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Object_prototypes)
- [JavaScript.info - Prototypal inheritance](https://javascript.info/prototype-inheritance)
- [You Don't Know JS: this & Object Prototypes](https://github.com/getify/You-Dont-Know-JS/tree/1st-ed/this%20%26%20object%20prototypes)

---

## 4. Practice Problems

### Problem 1

- **Description**: Implement a `Vehicle` constructor and a `Car` constructor that inherits from `Vehicle`.

```javascript
function Vehicle(make, model) {
  // Your code here
}

function Car(make, model, year) {
  // Your code here
}

// Set up inheritance
// Your code here

const myCar = new Car("Toyota", "Corolla", 2020);
console.log(myCar.getInfo()); // Should output: "Toyota Corolla"
```

- **Solution**:

```javascript
function Vehicle(make, model) {
  this.make = make;
  this.model = model;
}

Vehicle.prototype.getInfo = function() {
  return `${this.make} ${this.model}`;
};

function Car(make, model, year) {
  Vehicle.call(this, make, model);
  this.year = year;
}

Car.prototype = Object.create(Vehicle.prototype);
Car.prototype.constructor = Car;

const myCar = new Car("Toyota", "Corolla", 2020);
console.log(myCar.getInfo()); // Outputs: "Toyota Corolla"
```

### Problem 2

- **Description**: Extend the built-in `Array` prototype with a method `shuffle()` that randomly shuffles the elements of the array.
- **Solution**:

```javascript
Array.prototype.shuffle = function() {
  for (let i = this.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [this[i], this[j]] = [this[j], this[i]];
  }
  return this;
};

const arr = [1, 2, 3, 4, 5];
console.log(arr.shuffle()); // Outputs a randomly shuffled array
```

---

## 5. Questions & Further Study

- Question 1: How does prototypal inheritance differ from classical inheritance?
- Question 2: What are the implications of modifying built-in prototypes like `Array.prototype`?

> Additional Notes: Explore the `Object.create()` method and how it relates to prototypal inheritance.

---

## 6. Reflection

- What did I learn from studying this topic? Prototypes are a powerful and flexible way to implement inheritance in JavaScript.
- How confident do I feel about this topic now? Comfortable with basic prototypal inheritance, but need more practice with complex inheritance patterns.
- What should I review next? Dive deeper into ES6 classes and how they relate to prototypes under the hood.

