# Lazy Loading

**Date**: 2024/10/27
**Topic**: Lazy Loading
**Tags**: #optimization #performance #images #javascript

---

## 1. Key Concepts

- [x] Image lazy loading: Loading images as they enter viewport
- [x] Component lazy loading: Loading components on demand
- [x] Intersection Observer API: Detecting element visibility
- [x] Native lazy loading: Using loading="lazy" attribute
- [x] Performance benefits: Reducing initial page load time
- [x] Implementation strategies: Different approaches to lazy loading

> Summary: Lazy loading is a technique to defer loading of non-critical resources until they are needed, improving initial page load performance.

---

## 2. Detailed Notes

### 2.1. Native Image Lazy Loading

```html
<img 
  src="image.jpg" 
  loading="lazy" 
  alt="Lazy loaded image"
>
```

### 2.2. Intersection Observer Implementation

```javascript
const images = document.querySelectorAll(img[data-src]);

const imageObserver = new IntersectionObserver((entries, observer) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const img = entry.target;
      img.src = img.dataset.src;
      img.removeAttribute(data-src);
      observer.unobserve(img);
    }
  });
});

images.forEach(img => imageObserver.observe(img));
```

### 2.3. React Component Lazy Loading

```jsx
import { lazy, Suspense } from react;

const HeavyComponent = lazy(() => import(./HeavyComponent));

function App() {
  return (
    <Suspense fallback={<LoadingSpinner />}>
      <HeavyComponent />
    </Suspense>
  );
}
```

### 2.4. Progressive Image Loading

```javascript
class ProgressiveImage extends Component {
  state = { loadedSrc: null }

  componentDidMount() {
    this.loadImage(this.props.src);
  }

  loadImage = src => {
    const image = new Image();
    image.src = src;
    image.onload = () => {
      this.setState({ loadedSrc: src });
    };
  }

  render() {
    const { loadedSrc } = this.state;
    const { placeholder, alt } = this.props;

    return (
      <img
        src={loadedSrc || placeholder}
        alt={alt}
        className={loadedSrc ? loaded : loading}
      />
    );
  }
}
```

---

## 3. Useful Resources

- [MDN - Lazy Loading](https://developer.mozilla.org/en-US/docs/Web/Performance/Lazy_loading)
- [web.dev - Lazy Loading Guide](https://web.dev/lazy-loading/)
- [Intersection Observer API](https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API)

---

## 4. Practice Problems

### Problem 1

- **Description**: Implement a lazy loading image gallery with blur-up effect.

- **Solution**:

```jsx
function ImageGallery() {
  const [images, setImages] = useState([]);
  const imageRef = useRef();

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            const img = entry.target;
            const fullSrc = img.dataset.src;
            img.src = fullSrc;
            img.classList.add(loaded);
            observer.unobserve(img);
          }
        });
      },
      { rootMargin: 50px }
    );

    const currentImageRef = imageRef.current;
    if (currentImageRef) {
      observer.observe(currentImageRef);
    }

    return () => {
      if (currentImageRef) {
        observer.unobserve(currentImageRef);
      }
    };
  }, []);

  return (
    <div className="gallery">
      {images.map((image, index) => (
        <img
          key={index}
          ref={imageRef}
          src={image.thumbnailUrl}
          data-src={image.fullUrl}
          alt={image.alt}
          className="gallery-image"
        />
      ))}
    </div>
  );
}
```

### Problem 2

- **Description**: Create a lazy loading route configuration for a React application.

- **Solution**:

```jsx
import { lazy, Suspense } from react;
import { BrowserRouter as Router, Route, Switch } from react-router-dom;

const routes = [
  {
    path: /,
    component: lazy(() => import(./pages/Home)),
  },
  {
    path: /about,
    component: lazy(() => import(./pages/About)),
  },
  {
    path: /contact,
    component: lazy(() => import(./pages/Contact)),
  },
];

function App() {
  return (
    <Router>
      <Suspense fallback={<div>Loading...</div>}>
        <Switch>
          {routes.map(({ path, component: Component }) => (
            <Route key={path} path={path}>
              <Component />
            </Route>
          ))}
        </Switch>
      </Suspense>
    </Router>
  );
}
```

---

## 5. Questions & Further Study

- Question 1: How do you determine the optimal threshold for lazy loading?
- Question 2: What are the SEO implications of lazy loading content?

> Additional Notes: Explore advanced lazy loading techniques like predictive loading based on user behavior.

---

## 6. Reflection

- What did I learn from studying this topic? Lazy loading is a powerful optimization technique that requires careful consideration of user experience and performance trade-offs.
- How confident do I feel about this topic now? Comfortable with implementation, but need more practice with advanced patterns and edge cases.
- What should I review next? Explore more advanced lazy loading patterns and their impact on Core Web Vitals.
