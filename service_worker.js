(function(global) {
    'use strict';

    importScripts('sw_toolbox.js');

    toolbox.router.get('/mathedit/', toolbox.cacheFirst);
    toolbox.router.get('/mathedit/#/gist/:gist', toolbox.networkFirst);
    toolbox.router.get('/mathedit/fonts/(.*)', toolbox.cacheFirst);
    toolbox.router.get('/mathedit/main.dart.js', toolbox.cacheFirst);

    toolbox.router.default = global.toolbox.networkFirst;

    global.addEventListener('install', function(event) {
        event.waitUntil(global.skipWaiting())
    });

    global.addEventListener('activate', function(event){
        event.waitUntil(global.clients.claim())
    });

})(self);