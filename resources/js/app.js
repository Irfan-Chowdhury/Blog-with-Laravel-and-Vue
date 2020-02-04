

require('./bootstrap');

window.Vue = require('vue'); 
//import Vue from 'vue' //or you can use this

import VueRouter from 'vue-router'
Vue.use(VueRouter) 


Vue.component('example-component', require('./components/ExampleComponent.vue').default);

const routes = [  //16,22 routes name should be same
    // { path: '/foo', component: Foo },
    // { path: '/bar', component: Bar }
  ]

const router = new VueRouter({
    routes, // short for `routes: routes`
    mode:'history' //by using this '#' is not show in url 
  })

const app = new Vue({
    el: '#app',
    router //can access all router after put this here  
});


//1. command: npm run watch
//2. app.js
//3. ExampleComponent.vue
//4. adminmaster.blade.php