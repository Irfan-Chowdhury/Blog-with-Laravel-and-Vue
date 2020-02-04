

require('./bootstrap');

window.Vue = require('vue'); 
//import Vue from 'vue' //or you can use this

import VueRouter from 'vue-router'
Vue.use(VueRouter) 

import {routes} from './routes';  //'routes' name should be same, see bellow (16 line)

Vue.component('admin-main', require('./components/admin/AdminMaster.vue').default);

const router = new VueRouter({
    routes, // short for `routes: routes`
    mode:'history' //by using this '#' is not show in url 
  })

const app = new Vue({
    el: '#app',
    router //can access all router after put this here  
});


//1.AdminHome
//2.AdminMaster
//3.app.js
//4.routes
//5.adminmaster.blade.php