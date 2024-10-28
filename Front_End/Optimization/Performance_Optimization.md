# Front-End Performance Optimization

**Date**: 2024/10/27
**Topic**: Performance Optimization
**Tags**: #optimization #performance #web-vitals #best-practices

---

## 1. Key Concepts

- [x] Core Web Vitals: LCP, FID, CLS metrics
- [x] Asset optimization: Images, fonts, and other resources
- [x] Caching strategies: Browser and application-level caching
- [x] Bundle optimization: Reducing JavaScript bundle size
- [x] Critical rendering path: Optimizing initial page load
- [x] Performance monitoring: Tools and metrics

> Summary: Front-end performance optimization involves various techniques to improve loading speed, interactivity, and visual stability of web applications.

---

## 2. Detailed Notes

### 2.1. Core Web Vitals

1. Largest Contentful Paint (LCP):

```javascript
new PerformanceObserver((entryList) => {
  for (const entry of entryList.getEntries()) {
    console.log('LCP candidate:', entry.startTime, entry);
  }
}).observe({ entryTypes: ['largest-contentful-paint'] });
```

2. First Input Delay (FID):

```javascript
new PerformanceObserver((entryList) => {
  for (const entry of entryList.getEntries()) {
    const delay = entry.processingStart - entry.startTime;
    console.log('FID:', delay);
  }
}).observe({ entryTypes: ['first-input'] });
```

3. Cumulative Layout Shift (CLS):

```javascript
new PerformanceObserver((entryList) => {
  for (const entry of entryList.getEntries()) {
    console.log('Layout shift:', entry);
  }
}).observe({ entryTypes: ['layout-shift'] });
```

### 2.2. Asset Optimization

1. Image Optimization:

```html
<!-- Responsive images -->
<img
  srcset="small.jpg 300w,
          medium.jpg 600w,
          large.jpg 900w"
  sizes="(max-width: 320px) 280px,
         (max-width: 640px) 580px,
         800px"
  src="fallback.jpg"
  alt="Optimized image"
>
```

2. Font Loading:

```css
/* Font display optimization */
@font-face {
  font-family: 'MyFont';
  src: url('myfont.woff2') format('woff2');
  font-display: swap;
}
```

### 2.3. Caching Strategies

1. Service Worker:

```javascript
// service-worker.js
const CACHE_NAME = 'v1';
const urlsToCache = [
  '/',
  '/styles/main.css',
  '/scripts/main.js'
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(urlsToCache))
  );
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => response || fetch(event.request))
  );
});
```

2. Browser Caching:

```nginx
# Nginx configuration
location /static/ {
    expires 1y;
    add_header Cache-Control "public, no-transform";
}
```

### 2.4. Bundle Optimization

1. Tree Shaking:

```javascript
// webpack.config.js
module.exports = {
  mode: 'production',
  optimization: {
    usedExports: true,
    minimize: true
  }
};
```

2. Dynamic Imports:

```javascript
const MyComponent = () => {
  const [module, setModule] = useState(null);

  useEffect(() => {
    import('./heavy-module')
      .then(mod => setModule(mod.default));
  }, []);

  return module ? <module /> : <Loading />;
};
```

---

## 3. Useful Resources

- [Web Vitals](https://web.dev/vitals/)
- [PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/)
- [Lighthouse](https://developers.google.com/web/tools/lighthouse)
- [WebPageTest](https://www.webpagetest.org/)

---

## 4. Practice Problems

### Problem 1

- **Description**: Implement a performance monitoring solution using the Performance API.

- **Solution**:

```javascript
class PerformanceMonitor {
  constructor() {
    this.metrics = {};
    this.initObservers();
  }

  initObservers() {
    // LCP Observer
    new PerformanceObserver((entryList) => {
      const entries = entryList.getEntries();
      this.metrics.lcp = entries[entries.length - 1];
    }).observe({ entryTypes: ['largest-contentful-paint'] });

    // FID Observer
    new PerformanceObserver((entryList) => {
      const entries = entryList.getEntries();
      this.metrics.fid = entries[0];
    }).observe({ entryTypes: ['first-input'] });

    // CLS Observer
    let clsValue = 0;
    new PerformanceObserver((entryList) => {
      for (const entry of entryList.getEntries()) {
        if (!entry.hadRecentInput) {
          clsValue += entry.value;
        }
      }
      this.metrics.cls = clsValue;
    }).observe({ entryTypes: ['layout-shift'] });
  }

  getMetrics() {
    return this.metrics;
  }
}

const monitor = new PerformanceMonitor();
```

### Problem 2

- **Description**: Create a responsive image loading strategy with lazy loading and blur-up effect.

- **Solution**:

```jsx
function OptimizedImage({ src, placeholder, alt }) {
  const [loaded, setLoaded] = useState(false);
  const imgRef = useRef();

  useEffect(() => {
    if (imgRef.current && imgRef.current.complete) {
      setLoaded(true);
    }

    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          const img = entry.target;
          const fullSrc = img.dataset.src;
          img.src = fullSrc;
          observer.unobserve(img);
        }
      },
      { rootMargin: '50px' }
    );

    if (imgRef.current) {
      observer.observe(imgRef.current);
    }

    return () => {
      if (imgRef.current) {
        observer.unobserve(imgRef.current);
      }
    };
  }, []);

  return (
    <div className="image-container">
      <img
        ref={imgRef}
        src={placeholder}
        data-src={src}
        alt={alt}
        className={`image ${loaded ? 'loaded' : 'loading'}}`}
        onLoad={() => setLoaded(true)}
      />
      <div className="placeholder" style={{ backgroundImage: `url(${placeholder})` }} />
    </div>
  );
}
```

---

## 5. Questions & Further Study

- Question 1: How do you balance performance optimization with development velocity?
- Question 2: What are the trade-offs between different caching strategies?

> Additional Notes: Explore advanced optimization techniques like HTTP/2 Server Push and predictive prefetching.

---

## 6. Reflection

- What did I learn from studying this topic? Performance optimization is a complex topic that requires understanding of various browser APIs, metrics, and optimization techniques.
- How confident do I feel about this topic now? Comfortable with basic optimizations, but need more practice with advanced techniques and real-world scenarios.
- What should I review next? Dive deeper into performance budgets and automated performance monitoring systems.
