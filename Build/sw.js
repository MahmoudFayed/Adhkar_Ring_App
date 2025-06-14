const CACHE_NAME = 'Adhkar-PWA-v1.1.2';
const ASSETS_TO_CACHE = [
  '/Adhkar_Ring_App/Build/index.html',
  '/Adhkar_Ring_App/Build/logo.png',
  '/Adhkar_Ring_App/Build/manifest.json',
  '/Adhkar_Ring_App/Build/project.js',
  '/Adhkar_Ring_App/Build/project.wasm',
  '/Adhkar_Ring_App/Build/qtloader.js',
  '/Adhkar_Ring_App/Build/qtlogo.svg',
  '/Adhkar_Ring_App/Build/ringlogo.jpg',
  '/Adhkar_Ring_App/Build/sw.js'
];

// Install Event - Cache critical assets
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(ASSETS_TO_CACHE))
      .then(() => self.skipWaiting())
  );
});

// Activate Event - Clean up old caches
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(keys => 
      Promise.all(
        keys.filter(key => key !== CACHE_NAME).map(key => caches.delete(key))
      )
    )
  );
  self.clients.claim();
});

// Fetch Event - Offline-first strategy
self.addEventListener('fetch', event => {
  const { request } = event;
  
  // Skip cross-origin requests
  if (new URL(request.url).origin !== self.location.origin) {
    return;
  }

  event.respondWith(
    caches.match(request)
      .then(response => {
        // Return cached response or fetch from network
        return response || fetch(request)
          .then(networkResponse => {
            // Don't cache large files like WASM
            if (request.url.includes('.wasm')) return networkResponse;

            // Clone and cache new responses
            const responseClone = networkResponse.clone();
            caches.open(CACHE_NAME).then(cache => {
              cache.put(request, responseClone);
            });
            return networkResponse;
          });
      })
  );
});