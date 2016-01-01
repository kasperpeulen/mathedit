(function(global) {
    'use strict';

    importScripts('sw-toolbox.js');

    toolbox.router.get('/mathedit/', toolbox.networkFirst);
    toolbox.router.get('/mathedit/#/gist/:gist', toolbox.networkFirst);
    toolbox.router.get('/mathedit/font/(.*)', toolbox.networkFirst);
    toolbox.router.get('/mathedit/main.dart.js', toolbox.networkFirst);

    global.toolbox.router.default = global.toolbox.networkFirst;

    global.addEventListener('install', function(event) {
        event.waitUntil(global.skipWaiting())
    });

    global.addEventListener('activate', function(event){
        event.waitUntil(global.clients.claim())
    });

})(self);