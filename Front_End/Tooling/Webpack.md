# Webpack Overview

**Date**: 2024/10/25
**Topic**: Webpack
**Tags**: #tooling #javascript #webpack #bundler

---

## 1. Key Concepts

- [x] Module Bundling: Combines many modules into a few bundled assets
- [x] Loaders: Transform files before adding to the dependency graph
- [x] Plugins: Perform wider range of tasks like bundle optimization, asset management and injection of environment variables
- [x] Code Splitting: Splits code into various bundles which can then be loaded on demand or in parallel

> Summary: Webpack is a static module bundler for modern JavaScript applications, creating a dependency graph of modules and generating optimized bundles.

---

## 2. Detailed Notes

### 2.1. Introduction to Webpack

- **Definition**: Webpack is a static module bundler that processes applications and creates a dependency graph, generating one or more bundles.
- **Why it's important**: It solves the problem of complex dependency management and optimizes assets for production.
- **Use cases**: Single Page Applications (SPAs), complex front-end applications, and projects requiring advanced asset management.

### 2.2. Examples

```javascript
// webpack.config.js
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: './src/index.js',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env', '@babel/preset-react']
          }
        }
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader']
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/index.html'
    })
  ]
};

// Using code splitting
import('./module').then(module => {
  // Do something with the module
});
```

Explanation of the examples:
- The first block shows a basic webpack configuration file.
- It includes loaders for JavaScript (using Babel) and CSS.
- The HtmlWebpackPlugin is used to generate an HTML file.
- The last block demonstrates dynamic imports for code splitting.

### 2.3. Challenges and Considerations

- Configuration Complexity: Webpack configurations can become complex for large projects.
- Performance: Large projects may have longer build times.
- Learning Curve: Understanding loaders, plugins, and optimization techniques requires time.

---

## 3. Useful Resources

- [Webpack Official Documentation](https://webpack.js.org/)
- [Webpack Academy](https://webpack.academy/)
- [SurviveJS - Webpack Book](https://survivejs.com/webpack/)

---

## 4. Practice Problems

### Problem 1

- **Description**: Create a webpack configuration that handles both JavaScript and SCSS files, and generates source maps for development.

```javascript
// webpack.config.js
const path = require('path');

module.exports = {
  // Your configuration here
};
```

- **Solution**:

```javascript
const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
  mode: 'development',
  entry: './src/index.js',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js'
  },
  devtool: 'source-map',
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: 'babel-loader'
      },
      {
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
          'sass-loader'
        ]
      }
    ]
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: 'styles.css'
    })
  ]
};
```

### Problem 2

- **Description**: Implement code splitting in a webpack configuration to create separate bundles for vendor libraries and application code.
- **Solution**:

```javascript
const path = require('path');

module.exports = {
  entry: './src/index.js',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].[contenthash].js'
  },
  optimization: {
    splitChunks: {
      chunks: 'all',
      cacheGroups: {
        vendor: {
          test: /[\\/]node_modules[\\/]/,
          name: 'vendors',
          chunks: 'all'
        }
      }
    }
  }
};
```

---

## 5. Questions & Further Study

- Question 1: How does webpack's tree shaking feature work, and what are its limitations?
- Question 2: What are the best practices for optimizing webpack build performance in large projects?

> Additional Notes: Explore advanced webpack features like Module Federation for micro-frontends architecture.

---

## 6. Reflection

- What did I learn from studying this topic? Webpack is a powerful tool that offers extensive customization and optimization options for modern web development.
- How confident do I feel about this topic now? Comfortable with basic configurations, but need more practice with advanced features and performance optimization.
- What should I review next? Dive deeper into webpack's performance optimization techniques and explore how it integrates with different front-end frameworks.

