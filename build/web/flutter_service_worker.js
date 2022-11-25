'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "8a4b8900d70cc33c80b53d5d51ffd659",
"index.html": "ed9f3295d11dc5b4e0d7b3c2839db2d2",
"/": "ed9f3295d11dc5b4e0d7b3c2839db2d2",
"main.dart.js": "4878101b94bc0aa1bc8653b58760b786",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "9010a469ddf5a23f85cbbf2fc28dceb2",
"assets/AssetManifest.json": "3f95a45b9bcb4ed818c75716f17c06be",
"assets/NOTICES": "8d24482074d5b0f23106dcd174600988",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/shaders/ink_sparkle.frag": "909965f4f5a6c934edf2d51801e73a47",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/heberoom/room4.jpg": "984aa9f719801db69558a60541d01db7",
"assets/assets/heberoom/room5.jpg": "1cd19bb1648222e857941129b2173a8f",
"assets/assets/heberoom/room7.jpg": "f74cd2bc34f45c5deb7e6510cbce88c4",
"assets/assets/heberoom/room6.jpg": "fea0889de48e15867206abb42e97e114",
"assets/assets/heberoom/room2.jpg": "16e69dc2ba4297294a89dd5def0f00d6",
"assets/assets/heberoom/room3.jpg": "a1655291533c02692580dd48689c5597",
"assets/assets/heberoom/room1.jpg": "dfd35c03e3db6d4fdc1a40fd78bc32a7",
"assets/assets/pictures/Hebe_symbol_(fixed_width).svg.png": "26cd80777267201cc84fa06449915503",
"assets/assets/pictures/hebecoin.jpg": "5d230b8aabafaceb0ba4740c1155a1fa",
"assets/assets/pictures/hebe.png": "17427f530d7fa99fc35c36f83aecf140",
"assets/assets/pictures/hebe.jpg": "0c2cfc57fef78deb09484a3cf575b944",
"assets/assets/pictures/person.png": "6ede1e25d66c72b4e0ca2e5459cfd8b1",
"assets/assets/pictures/HebeHorizontal.jpg": "7e8cff1bf8a1c729c4831f85211bfa48",
"assets/assets/pictures/hebesymbol.png": "21df80e822d4118734732da2bb10c345",
"assets/assets/backgrounds/greekBackground4.jpeg": "019d0c4143336716e44c55a7e3658ee6",
"assets/assets/backgrounds/greekBackground8.jpeg": "254abb6860f1b7d4cc1271d1a8c085a9",
"assets/assets/backgrounds/greekBackground.jpg": "9a2431abe88a16cd7780f821083cdf94",
"assets/assets/backgrounds/greekBackground5.jpeg": "e689acb88174c6fd8e6a67cec935f4e9",
"assets/assets/backgrounds/greekBackground2.jpeg": "b5e375d8950c8be31344bc1290414a8a",
"assets/assets/backgrounds/greekBackground3.jpeg": "24b8314202a06d66425e291803709651",
"assets/assets/backgrounds/greekBackground1.jpeg": "5d6c84fa9eef70a4c7cfa31b29510306",
"assets/assets/backgrounds/greekBackground6.jpeg": "bc5cf6b35ce36b394072f0ddc46d7e8a",
"assets/assets/backgrounds/greekBackground7.jpeg": "a76f5a4c4d518fdd0abc2e06179350ed",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
