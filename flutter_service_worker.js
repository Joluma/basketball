'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "manifest.json": "ea5fd30652764c60e3155ca4ac75de79",
"version.json": "916f80b367358ac5435c9810f3bbdcad",
"icons/Icon-512.png": "de36748ae251d4049ac1b84d935ca42c",
"icons/Icon-192.png": "fc3302068b7f2eda1e609b1a734ef5d4",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"favicon.png": "5d36b3d9b18774517f65b33662981ecb",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"index.html": "5689353e0887e79ddf9acd9822039083",
"/": "5689353e0887e79ddf9acd9822039083",
"main.dart.js": "5ff40a9f47a632c003c6f00158c02c38",
"assets/NOTICES": "47eca904ef21f94d08ceca0a961e0f46",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fixtures/mock-response.json": "007e4c9bcce7e90619708edb80fd4546",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.json": "b22cb051360a8beea398953b752130d2",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/prod.env": "b0914a51c24aecc6d886a267a0897bcd",
"assets/assets/images/team-logos/159.png": "8f34e2dca5cb739b8ea0094a2187f640",
"assets/assets/images/team-logos/136.png": "5f2bf339ed431e58896e29c5bc26f683",
"assets/assets/images/team-logos/147.png": "2403618c5395e1195181035d2839df8c",
"assets/assets/images/team-logos/145.png": "dbfdbf08b4281f10c85306ddce37ed4a",
"assets/assets/images/team-logos/152.png": "a999b90be48482ce1e2f38996330aa49",
"assets/assets/images/team-logos/134.png": "14866366e8a43941c08ea054200088a6",
"assets/assets/images/team-logos/160.png": "bcb639bae84111a343d95c1b44a2df1a",
"assets/assets/images/team-logos/140.png": "be3faf2860e8728f04c98f08ac1d02a2",
"assets/assets/images/team-logos/139.png": "391a903120fa02956bcf9858ec04191c",
"assets/assets/images/team-logos/151.png": "e71062e3b37bf61f91b9d40289f4a76f",
"assets/assets/images/team-logos/156.png": "6b3ccba868bf1c978ef45e6d431ef587",
"assets/assets/images/team-logos/161.png": "c9e99c0788d623412910f94b5dc809a2",
"assets/assets/images/team-logos/157.png": "17099821a0daeb5abda786c0ff8e4c46",
"assets/assets/images/team-logos/144.png": "03ed5d05c4247cdd174796d7f93df1a1",
"assets/assets/images/team-logos/158.png": "723ae0ac18732055463c4e8568f5a3fb",
"assets/assets/images/team-logos/148.png": "c4454a11400b098a41da36dcb877079f",
"assets/assets/images/team-logos/155.png": "9cb7e1033d8a81edf7a2fc4542e185bc",
"assets/assets/images/team-logos/154.png": "d091c0caeaeabd3e44e1d9a99f3db542",
"assets/assets/images/team-logos/138.png": "75fba47e67ac3cb814c46b369618b730",
"assets/assets/images/team-logos/135.png": "ee1a20673a1d9998d0eaf96f85d7612f",
"assets/assets/images/team-logos/141.png": "69d823faf37eef533dc9df109367626c",
"assets/assets/images/team-logos/143.png": "f38fa1a8bb86317203ba907f58b491ac",
"assets/assets/images/team-logos/133.png": "e3f2b05fdb6536e39709ba4acbd0051a",
"assets/assets/images/team-logos/150.png": "cc2409737dc123429d87e54ab1f6f100",
"assets/assets/images/team-logos/142.png": "609ed13095fa8c5b3f21d9950e455a9b",
"assets/assets/images/team-logos/153.png": "6cfc4195edd2d81775804dba48409809",
"assets/assets/images/team-logos/146.png": "9e09bd60442fcea475a431cf3074295f",
"assets/assets/images/team-logos/149.png": "8b12d32db5844c8f127cd8b5386b3334",
"assets/assets/images/team-logos/132.png": "2e6daf51ba7d2c33a5ae28450c78e63b",
"assets/assets/images/team-logos/137.png": "f5abdb403becc9c5916ca92fd1d76f17"
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
