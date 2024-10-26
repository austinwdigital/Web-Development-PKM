# CSS Animations

**Date**: 2024/10/26
**Topic**: CSS Animations
**Tags**: #css #animations #keyframes

---

## 1. Key Concepts

- [x] @keyframes Rule: Defines the stages and styles of an animation
- [x] Animation Properties: Control the behavior of animations
- [x] Timing Functions: Specify the speed curve of an animation
- [x] Animation Events: JavaScript events for animation control
- [x] Performance Considerations: Optimizing animations for smooth performance

> Summary: CSS Animations allow you to create smooth, controlled animations without using JavaScript, enhancing user experience and interface interactivity.

---

## 2. Detailed Notes

### 2.1. @keyframes Rule

The `@keyframes` rule specifies the animation code:

```css
@keyframes slide-in {
  0% { transform: translateX(-100%); }
  100% { transform: translateX(0); }
}
```

### 2.2. Animation Properties

1. `animation-name`: Specifies the name of the @keyframes rule
2. `animation-duration`: Sets how long the animation should take to complete
3. `animation-timing-function`: Specifies the speed curve of the animation
4. `animation-delay`: Sets a delay for the start of an animation
5. `animation-iteration-count`: Sets how many times the animation should run
6. `animation-direction`: Sets whether the animation should play forwards, backwards, or alternate
7. `animation-fill-mode`: Specifies what styles are applied before/after the animation
8. `animation-play-state`: Specifies whether the animation is running or paused

Shorthand:
```css
animation: name duration timing-function delay iteration-count direction fill-mode play-state;
```

### 2.3. Timing Functions

- `linear`: Constant speed
- `ease`: Slow start, then fast, then end slowly (default)
- `ease-in`: Slow start
- `ease-out`: Slow end
- `ease-in-out`: Slow start and end
- `cubic-bezier(n,n,n,n)`: Custom timing function

### 2.4. Animation Events

JavaScript can listen for animation events:

```javascript
element.addEventListener('animationstart', () => {
  console.log('Animation started');
});

element.addEventListener('animationend', () => {
  console.log('Animation ended');
});

element.addEventListener('animationiteration', () => {
  console.log('Animation iteration');
});
```

### 2.5. Performance Considerations

- Use `transform` and `opacity` for smoother animations
- Avoid animating properties that trigger layout changes (e.g., width, height, top, left)
- Use `will-change` property to hint the browser about animated properties
- Consider using `requestAnimationFrame` for JavaScript animations

---

## 3. Useful Resources

- [MDN Web Docs - CSS Animations](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations)
- [CSS-Tricks - Animation](https://css-tricks.com/almanac/properties/a/animation/)
- [W3Schools - CSS Animations](https://www.w3schools.com/css/css3_animations.asp)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a pulsing effect on a button using CSS animations.

- **Solution**:

```css
@keyframes pulse {
  0% { transform: scale(1); }
  50% { transform: scale(1.1); }
  100% { transform: scale(1); }
}

.pulse-button {
  animation: pulse 2s infinite;
}
```

### Problem 2

- **Description**: Implement a loading spinner using CSS animations.

- **Solution**:

```css
@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.spinner {
  width: 50px;
  height: 50px;
  border: 5px solid #f3f3f3;
  border-top: 5px solid #3498db;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}
```

---

## 5. Questions & Further Study

- Question 1: How can you synchronize multiple animations to create complex effects?
- Question 2: What are the accessibility considerations when using CSS animations?

> Additional Notes: Explore the Web Animations API for more programmatic control over animations.

---

## 6. Reflection

- What did I learn from studying this topic? CSS animations provide a powerful way to create engaging user interfaces without relying on JavaScript.
- How confident do I feel about this topic now? Comfortable with basic animations, but need more practice with complex, multi-step animations and performance optimization.
- What should I review next? Dive deeper into advanced animation techniques, such as 3D transforms and animation sequencing.

