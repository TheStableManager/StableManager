/**
 * The workboxSW.precacheAndRoute() method efficiently caches and responds to
 * requests for URLs in the manifest.
 * See https://goo.gl/S9QRab
 */
self.__precacheManifest = [].concat(self.__precacheManifest || []);
workbox.precaching.precacheAndRoute(self.__precacheManifest, {});

workbox.core.setCacheNameDetails({
  prefix: 'stablemanager',
  suffix: 'v1',
});

workbox.routing.registerRoute(
  ({url}) => url.pathname.startsWith('/img/'),
  new workbox.strategies.CacheFirst()
);

workbox.routing.registerRoute(
  /^https:\/\/git.homelabblog.com\/api\/v4\/feature_flags\/unleash\/17\/features/,
  new workbox.strategies.NetworkFirst()
);

self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting();
  }
});

/* self.addEventListener('install', (event) => {
  const urls = [
    '/',
  ];
  const cacheName = workbox.core.cacheNames.runtime;
  event.waitUntil(caches.open(cacheName).then((cache) => cache.addAll(urls)));
}); */