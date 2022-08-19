'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"main.dart.js": "4dd6c82dd9307a199315322e37e8b85c",
"assets/AssetManifest.json": "efd5b655358ba32836b22b37798a7272",
"assets/assets/experience_data.json": "283ff9dd836cfd31c9089c0c733ef4db",
"assets/assets/images/work/ryb_mock_cropped.png": "b8776b3610bb8276199d6addfeaeee13",
"assets/assets/images/work/ryb_mock_full.png": "43ab3d90b5de6efe49be9a73deb80375",
"assets/assets/images/work/cgi-logo-rounded.png": "86784185a04189708f6d914b17b67091",
"assets/assets/images/work/pr_coffee_coding.jpg": "2390a93f1070c0bab9bef7821ff8b237",
"assets/assets/images/work/really_wild_logo.png": "897fd824f70935f51431389b020acd7a",
"assets/assets/images/work/pr_logo_small.png": "07c30f6134800ad2c3b78a24225ac09c",
"assets/assets/images/work/equal_employer_approved.png": "f68c782f918089b91e0efbeb6f9aa6ed",
"assets/assets/images/work/cgi-cyber-security-triad.png": "98f35bc9bb3534b5a208ca38a6d37287",
"assets/assets/images/qualification/ms_logo.png": "b28d23e7c6b7c52eec6771e0e82b6685",
"assets/assets/images/work_art.png": "7c1d67387610640c3d582e15b76c2844",
"assets/assets/images/education/swansea_university_logo_crest_white.png": "1223acbc0520b859ecbb77909e6160e3",
"assets/assets/images/education/uol_logo_crest.png": "0dce5f099051273f0554cc544f942792",
"assets/assets/images/education/the_mentor_circle_logo.png": "540d76432674f33bd284ef2dbc553274",
"assets/assets/images/education/swansea_university_logo_crest.png": "eb4605f27874a8b081afc89e3cc6b3a9",
"assets/assets/images/personal_art.png": "c24f8e3e85f895c083c4420b2976a1ca",
"assets/assets/images/project/takeaway_coffee_icon.png": "cd0b1840ab34f5976a593e4b4e622b18",
"assets/assets/images/project/coffee-cup-feature.jpg": "e41b956de8b140369a06860256c256a5",
"assets/assets/images/project/coffee_app_mocks_cropped.png": "63ae6fdd45e7597572a4b09b958a5295",
"assets/assets/images/j-logo.png": "a21c96d33cd7bc70a31d53a6e0df3844",
"assets/assets/svgs/tiktok_icon.svg": "721e71c81f57aef91e70637fdc2f80c6",
"assets/assets/svgs/youtube_icon.svg": "140bc89e487a2e28d35591fc8a47bb6a",
"assets/assets/svgs/github2_icon.svg": "a217270f88c7a4f12a02bfa92599cc2c",
"assets/assets/svgs/work_art.svg": "7f643b44044fe0e72d83bfdc8731f704",
"assets/assets/svgs/linkedin_icon.svg": "45f7f72b07fe3715e31a669233c6d5d2",
"assets/assets/svgs/github1_icon.svg": "c0a32ad65a60be02bed0738b02f1078c",
"assets/assets/svgs/personal_art.svg": "4c558a11d88e3bfdaa477623455d25f7",
"assets/assets/svgs/instagram_icon.svg": "37faf902d96bf83b5635c6956940df01",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "d5d1c1f415bc5789e21332bf828fbeb7",
"index.html": "02a3dcf76b4459637a09746ac518264d",
"/": "02a3dcf76b4459637a09746ac518264d",
"favicon.png": "153b7693126bf886ee3b333eb7552398",
"version.json": "c420e205d8eac4ccea99913b4a50bfa7",
"manifest.json": "4d2a074e955647542596586cbde41715",
"icons/apple-touch-icon.png": "5bffe66e9eefd9db202b1a0fbbd16695",
"icons/android-chrome-512x512.png": "767465fcebc8f648553d549835dcd362",
"icons/android-chrome-192x192.png": "b18fa16d8cdcfd30262fa6ac8123eef2"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
