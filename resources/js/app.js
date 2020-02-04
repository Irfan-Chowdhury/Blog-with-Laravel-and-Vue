

require('./bootstrap');

window.Vue = require('vue'); 
//import Vue from 'vue' //or you can use this

import VueRouter from 'vue-router'
Vue.use(VueRouter) 




Vue.component('example-component', require('./components/ExampleComponent.vue').default);



const router = new VueRouter({
    routes // short for `routes: routes`
  })

const app = new Vue({
    el: '#app',
    router //can access all router after put this here  
});
