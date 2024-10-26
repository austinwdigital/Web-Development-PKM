# Lazy Loading in HTML

**Date**: 2024/10/26
**Topic**: Lazy Loading
**Tags**: #html #performance #lazy-loading

---

## 1. Key Concepts

- [x] Deferred Loading: Load non-critical resources when needed
- [x] Performance Optimization: Improve initial page load time
- [x] Native Support: Use of loading="lazy" attribute
- [x] JavaScript Implementation: Custom lazy loading for older browsers
- [x] Intersection Observer API: Modern way to detect element visibility

> Summary: Lazy loading is a technique to defer loading of non-critical resources, improving initial page load performance.

---

## 2. Detailed Notes

### 2.1. Native Lazy Loading

- **Usage**: Add `loading="lazy"` attribute to `<img>` or `<iframe>` elements.
- **Browser Support**: Widely supported in modern browsers.

```html
<img src="image.jpg" loading="lazy" alt="Lazy loaded image">
<iframe src="video-player.html" loading="lazy"></iframe>
```

### 2.2. JavaScript Implementation

- For older browsers or custom behavior.
- Often uses Intersection Observer API.

```javascript
document.addEventListener("DOMContentLoaded", function() {
  var lazyImages = [].slice.call(document.querySelectorAll("img.lazy"));

  if ("IntersectionObserver" in window) {
    let lazyImageObserver = new IntersectionObserver(function(entries, observer) {
      entries.forEach(function(entry) {
        if (entry.isIntersecting) {
          let lazyImage = entry.target;
          lazyImage.src = lazyImage.dataset.src;
          lazyImage.classList.remove("lazy");
          lazyImageObserver.unobserve(lazyImage);
        }
      });
    });

    lazyImages.forEach(function(lazyImage) {
      lazyImageObserver.observe(lazyImage);
    });
  } else {
    // Fallback for browsers without Intersection Observer support
  }
});
```

### 2.3. Best Practices

1. Use for images below the fold.
2. Provide appropriate placeholder content.
3. Consider the impact on layout shifts (CLS).
4. Test thoroughly across different devices and connection speeds.

---

## 3. Useful Resources

- [MDN Web Docs - Lazy loading](https://developer.mozilla.org/en-US/docs/Web/Performance/Lazy_loading)
- [web.dev - Browser-level lazy loading for CMSs](https://web.dev/browser-level-lazy-loading-for-cmss/)
- [Intersection Observer API](https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API)

---

## 4. Practice Problems

### Problem 1

- **Description**: Implement lazy loading for a gallery of images using the native `loading="lazy"` attribute.

```html
<!-- Your solution here -->
```

- **Solution**:

```html
<div class="image-gallery">
  <img src="image1.jpg" loading="lazy" alt="Gallery image 1">
  <img src="image2.jpg" loading="lazy" alt="Gallery image 2">
  <img src="image3.jpg" loading="lazy" alt="Gallery image 3">
  <img src="image4.jpg" loading="lazy" alt="Gallery image 4">
  <img src="image5.jpg" loading="lazy" alt="Gallery image 5">
</div>
```

### Problem 2

- **Description**: Create a JavaScript function that implements lazy loading for images using the Intersection Observer API.
- **Solution**:

```javascript
function lazyLoadImages() {
  const images = document.querySelectorAll('img[data-src]');
  const options = {
    root: null,
    rootMargin: '0px',
    threshold: 0.1
  };

  const observer = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const img = entry.target;
        img.src = img.dataset.src;
        img.removeAttribute('data-src');
        observer.unobserve(img);
      }
    });
  }, options);

  images.forEach(img => observer.observe(img));
}

// Usage
document.addEventListener('DOMContentLoaded', lazyLoadImages);
```

---

## 5. Questions & Further Study

- Question 1: How does lazy loading impact SEO, and what considerations should be taken into account?
- Question 2: What are the trade-offs between using native lazy loading and a custom JavaScript implementation?

> Additional Notes: Explore how lazy loading can be applied to other resources like JavaScript modules or CSS.

---

## 6. Reflection

- What did I learn from studying this topic? Lazy loading is a powerful technique for improving page load performance, with both native and JavaScript-based implementations available.
- How confident do I feel about this topic now? Comfortable with basic implementations, but need more practice with complex scenarios and performance optimization.
- What should I review next? Dive deeper into performance metrics and how lazy loading impacts Core Web Vitals.

