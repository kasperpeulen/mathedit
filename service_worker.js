(function(global) {
    'use strict';

    importScripts('sw_toolbox.js');

    global.toolbox.router.get('/mathedit', toolbox.fastest);
    global.toolbox.router.get('/mathedit/', toolbox.fastest);
    global.toolbox.router.get('/mathedit/#/gist/:gist', toolbox.networkFirst);
    global.toolbox.router.get('/mathedit/fonts/(.*)', toolbox.fastest);
    global.toolbox.router.get('/mathedit/main.dart.js', toolbox.fastest);

    // By default, all requests that don't match our custom handler will use the
    // toolbox.networkFirst cache strategy, and their responses will be stored in
    // the default cache.
    global.toolbox.router.default = global.toolbox.fastest;


    // Boilerplate to ensure our service worker takes control of the page as soon
    // as possible.
    global.addEventListener('install', function(event) {
        event.waitUntil(global.skipWaiting())
    });
    global.addEventListener('activate', function(event){
        event.waitUntil(global.clients.claim())
    });

})(self);