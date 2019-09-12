# Service Workers

## General Information
- A service worker's life cycle is completely separate from the rest of the web page.
- We need a server with HTTPS to user a service worker
  - It will also work on `localhost` domains during development
- A simplified service worker life cycle goes as follows
  1. Install
    - A service worker must be registered from the web page.
      - This will start the install step in the background
      - Typically, we'll cash some static assets during the start step
  2. Activat or Error
  3. Idle
  4. Fetch / Message
    - Might be terminated

## Register a Service Worker
- In order to use a service worker, we must first register it
  - Registration will complete if it finds the `sw.js` file in the domain root
    - It's important to put that file in the root, so the service worker's scope will be the entire domain
  - It doesn't hurt to register the service worker on every page load, since the browser will figure out if it's already registered or not
```javascript
if ('serviceWorker' in navigator) {
  window.addEventListener('load', function() {
    navigator.serviceWorker.register('/sw.js').then(function(registration) {
      // Registration was successful
      console.log('ServiceWorker registration successful with scope: ', registration.scope);
    }, function(err) {
      // registration failed :(
      console.log('ServiceWorker registration failed: ', err);
    });
  });
}
```

## Install a Service Worker
- We can add an event listener to handle the service worker `install` event

```javascript
self.addEventListener('install', function(event) {
  // Perform install steps
});
```

- We'll use the install callback to cache relevant files, then check to make sure caching was successful
  - Below, the service worker will only be installed if _all_ required files are successfully cached
  - We could set up other tasks in the `install` callback, or even skip it altogether

```javascript
var CACHE_NAME = 'my-site-cache-v1';
var urlsToCache = [
  '/',
  '/styles/main.css',
  '/script/main.js'
];

self.addEventListener('install', function(event) {
  // Perform install steps
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(function(cache) {
        console.log('Opened cache');
        return cache.addAll(urlsToCache);
      })
  );
});
```

## Fetch via a Service Worker
- Once installed, our service worker will begin receving fetch events whenever our user navigates or refreshes
  - We can choose what to tasks to perform by listening for a `fetch` event
  - In our example, we'll use this event to find any cached results the service worker created during install

```javascript
self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.match(event.request)
      .then(function(response) {
        // Cache hit - return response
        if (response) {
          return response;
        }
        return fetch(event.request);
      }
    )
  );
});
```

## Updating a Service Worker
- Service workers also facilitate a simple update process, if we need to change the logic contained in that file. Do so with the following steps:
  1. Replace the `sw.js` file from our application root with an updated version
  2. The browser will sense the file has changed
  3. The `install` event will be fired next time our user navigates to our page
  4. Once the new one is installed, our old service worker file will be killed, relinquishing control to the new one

## Service Worker Life Cycle
- The life cycle of a service worker is the most complex aspect to understand
- The cycle supports the following functionality
  1. Makes offline-first possible
  2. Allows new service workers to ready themselves, without disturbing the current one
  3. Ensures page scope is consistently controlled by the same service worker
    - and that only one version is running at a time
      - This is important, since otherwise two tabs could represent two separate versions of our site

### Initial Service Worker Installation
1. `install` event is fired first, and is only fired once
2. `installEvent.waitUntil()` signals duration of install, then handles success of failure
3. Service worker starts receiving other events, like `fetch` and `push`, once installation successfully completes, and worker enters `active` state
  - We'll need to refresh the page for our `fetch` event to go thru our service worker

### Order of Events
1. `.register()`
  - Downloads the service worker
2. `install`
  - Our chance to cache everything we need to control the client
  - The promise we pass to `event.waitUntil()` informs the browser install has completed
  - If our promise rejects, the browser throws away our service worker
3. `activate`
  - Will fire once our worker is ready to control clients, and handle functional events
    * `push` & `sync`, for example, will be fired from here


## Proper Service Worker Registrations
* In order to avoid degrading our users' first visit experience, certain steps must be kept in mind
  - Typically, we should defer registration of our service worker until after the initial page is loaded
* A generic boilerplate service worker registration goes as follows
  - This goes against best practice, since it potentially ties up an extra thread, which may not be idle. This could lead to a noticeable increase in page load time, particularly on underpowered mobile devices
```javascript
if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('/service-worker.js');
}
```

* We could easily improve this flow by waiting for the page `load` event to fire
  - The effectiveness of this solution also depends on the page, and what we execute right after it loads
    * If, for example, we play an animation right after `load`, it could cause that animation to appear choppy on slower devices
```javascript
if ('serviceWorker' in navigator) {
  window.addEventListener('load', function() {
    navigator.serviceWorker.register('/service-worker.js');
  });
}
```

## High-Performance Service Worker Loading
- Since service workers have the potential to enhance performance on our page, adherence to the below tips can ensure we achieve the best possible performance.
  - Nagivation requests refer to any time we enter a URL into the browser's location bar, interactive with `window.location`, or click a link from one web page to another
    * Even interacting with an `<iframe>` represents a navigation request
  - To acheive best performace, we want to actively bypass the network for navigations, relying on cached data instead
  - If we have a sing page app, for example, we could use the following code to retrieve our application shell `html` from the cache

```javascript
// Not shown: install and activate handlers to keep app-shell.html
// cached and up to date.
self.addEventListener('fetch', event => {
  if (event.request.mode === 'navigate') {
    // Always respond to navigations with the cached app-shell.html,
    // regardless of the underlying event.request.url value.
    event.respondWith(caches.match('app-shell.html'));
  }
});
```

## Common Issues
- When installation fails, it can be hard to know why it didn't worker
  - Checking the Chrome inspector [here](chrome://inspect/#service-workers) can indicate whether or not it was installed successfully
  - We can debug the issue in Chrome via the following steps
    1. Go [here](chrome://serviceworker-internals)
    2. Check "Open DevTools window and pause JavaScript execution on service worker startup for debugging"
    3. Put a `debugger` statement at the top of our `install` event
    4. Debug to deduce the issue
- Fetching a resource from a third-party URL will fail by default
  - We can overcome this by specifying the `no-cors` option in our request
  return new Request(urlToPrefetch, { mode: 'no-cors' });
    - `return new Request(urlToPrefetch, { mode: 'no-cors' });`

## References
- [Service Worker Docs](https://developers.google.com/web/fundamentals/primers/service-workers/)
- [GitHub Pages are great for testing service-workers](https://pages.github.com/)

## Chrome Dev Tool Links
- [Check Enabled Service Workers in Chrome](chrome://inspect/#service-workers)
- [View Service Worker Details in Chrome (Legacy)](chrome://serviceworker-internals)

