

require('./bootstrap');

window.Vue = require('vue'); 
//import Vue from 'vue' //or you can use this

import VueRouter from 'vue-router'
Vue.use(VueRouter) 

import {routes} from './routes';  //'routes' name should be same, see bellow (16 line)

Vue.component('admin-main', require('./components/admin/AdminMaster.vue').default); //'admin-main' this type of name must be small letter

//V-form
import { Form, HasError, AlertError } from 'vform'

window.Form = Form; //for using globaly that means can use any file  

Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)
//V-form --x--

const router = new VueRouter({
    routes, // short for `routes: routes`
    mode:'history' //by using this '#' is not show in url 
  })

const app = new Vue({
    el: '#app',
    router //can access all router after put this here  
});

