# Code Splitting

**Date**: 2024/10/27
**Topic**: Code Splitting
**Tags**: #optimization #webpack #performance #javascript

---

## 1. Key Concepts

- [x] Route-based splitting: Loading code based on current route
- [x] Component-based splitting: Loading components on demand
- [x] Dynamic imports: Using import() syntax for lazy loading
- [x] Bundle analysis: Understanding and optimizing bundle size
- [x] Webpack configuration: Setting up code splitting
- [x] Performance metrics: Measuring impact of code splitting

> Summary: Code splitting is a technique to break down code into smaller chunks that can be loaded on demand, improving initial load time and overall performance.

---

## 2. Detailed Notes

### 2.1. Route-Based Splitting

Using React Router with lazy loading:

```jsx
import { lazy, Suspense } from react;
import { Route, Switch } from react-router-dom;

const Home = lazy(() => import(./routes/Home));
const About = lazy(() => import(./routes/About));
const Dashboard = lazy(() => import(./routes/Dashboard));

function App() {
  return (
    <Suspense fallback={<LoadingSpinner />}>
      <Switch>
        <Route exact path="/" component={Home} />
        <Route path="/about" component={About} />
        <Route path="/dashboard" component={Dashboard} />
      </Switch>
    </Suspense>
  );
}
```

### 2.2. Component-Based Splitting

```jsx
const HeavyComponent = lazy(() => import(./HeavyComponent));

function MyComponent() {
  const [showHeavy, setShowHeavy] = useState(false);

  return (
    <div>
      <button onClick={() => setShowHeavy(true)}>Load Heavy Component</button>
      {showHeavy && (
        <Suspense fallback={<LoadingSpinner />}>
          <HeavyComponent />
        </Suspense>
      )}
    </div>
  );
}
```

### 2.3. Webpack Configuration

```javascript
// webpack.config.js
module.exports = {
  output: {
    filename: [name].[contenthash].js,
    chunkFilename: [name].[contenthash].chunk.js
  },
  optimization: {
    splitChunks: {
      chunks: all,
      minSize: 20000,
      minChunks: 1,
      maxAsyncRequests: 30,
      maxInitialRequests: 30,
      cacheGroups: {
        vendors: {
          test: /[\\/]node_modules[\\/]/,
          priority: -10
        },
        default: {
          minChunks: 2,
          priority: -20,
          reuseExistingChunk: true
        }
      }
    }
  }
};
```

---

## 3. Useful Resources

- [Webpack Documentation - Code Splitting](https://webpack.js.org/guides/code-splitting/)
- [React Documentation - Code Splitting](https://reactjs.org/docs/code-splitting.html)
- [Web.dev - Code Splitting Guide](https://web.dev/reduce-javascript-payloads-with-code-splitting/)

---

## 4. Practice Problems

### Problem 1

- **Description**: Implement code splitting for a React application with multiple routes and heavy components.

- **Solution**:

```jsx
// App.js
import { lazy, Suspense } from react;
import { Route, Switch } from react-router-dom;

const Dashboard = lazy(() => import(./routes/Dashboard));
const Analytics = lazy(() => import(./routes/Analytics));
const Settings = lazy(() => import(./routes/Settings));

function App() {
  return (
    <div>
      <Suspense 
        fallback={
          <div className="loading-spinner">Loading...</div>
        }
      >
        <Switch>
          <Route path="/dashboard" component={Dashboard} />
          <Route path="/analytics" component={Analytics} />
          <Route path="/settings" component={Settings} />
        </Switch>
      </Suspense>
    </div>
  );
}
```

### Problem 2

- **Description**: Configure Webpack for optimal code splitting with vendor chunk separation.

- **Solution**:

```javascript
// webpack.config.js
module.exports = {
  optimization: {
    splitChunks: {
      cacheGroups: {
        vendor: {
          test: /[\\/]node_modules[\\/]/,
          name: vendors,
          chunks: all,
          priority: 20
        },
        common: {
          name: common,
          minChunks: 2,
          chunks: async,
          priority: 10,
          reuseExistingChunk: true,
          enforce: true
        }
      }
    }
  }
};
```

---

## 5. Questions & Further Study

- Question 1: How do you determine the optimal chunk size for your application?
- Question 2: What are the trade-offs between different code splitting strategies?

> Additional Notes: Explore advanced techniques like preloading and prefetching chunks.

---

## 6. Reflection

- What did I learn from studying this topic? Code splitting is crucial for optimizing large applications, but requires careful consideration of splitting points and loading strategies.
- How confident do I feel about this topic now? Comfortable with basic implementation, but need more practice with advanced optimization techniques.
- What should I review next? Dive deeper into bundle analysis tools and optimization strategies for specific frameworks.
