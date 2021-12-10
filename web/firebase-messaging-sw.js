importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyD6MAhwnvSl9DFPSZpLBFFGdgBVZc5nOJM",
    authDomain: "webnotify-a17f7.firebaseapp.com",
    projectId: "webnotify-a17f7",
    storageBucket: "webnotify-a17f7.appspot.com",
    messagingSenderId: "899279418860",
    appId: "1:899279418860:web:aa9d5aa17b63fd64183cc9",
    measurementId: "${config.measurementId}"
});
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
    console.log("onBackgroundMessage", m);
});