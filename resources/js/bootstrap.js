window._ = require('lodash');

try {
    require('bootstrap');
} catch (e) {}

/**
 * We'll load the axios HTTP library which allows us to easily issue requests
 * to our Laravel back-end. This library automatically handles sending the
 * CSRF token as a header based on the value of the "XSRF" token cookie.
 */

window.axios = require('axios');

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

/**
 * Echo exposes an expressive API for subscribing to channels and listening
 * for events that are broadcast by Laravel. Echo and event broadcasting
 * allows your team to easily build robust real-time web applications.
 */

// import Echo from 'laravel-echo';

// window.Pusher = require('pusher-js');

// window.Echo = new Echo({
//     broadcaster: 'pusher',
//     key: process.env.MIX_PUSHER_APP_KEY,
//     cluster: process.env.MIX_PUSHER_APP_CLUSTER,
//     forceTLS: true
// });
import Echo from 'laravel-echo';
 
window.Pusher = require('pusher-js');
 
window.Echo = new Echo({
    broadcaster: 'pusher',
    // key: 'Wcbs9w.CsxYNQ:uHtRcafdNc-nEHWjbTjN791dfR0FBm9ls10J2aQBxk4',
    key: 'GB15rw.5ontmA:MBH5BOzcml0w-JEGUwQN39_3YQSD1S9hs4qYu4qOtBY',
    wsHost: 'realtime-pusher.ably.io',
    wsPort: 443,
    disableStats: true,
    encrypted: true,
});