

require('./bootstrap');
window.Vue = require('vue');  // you can use this

Vue.component('admin-main', require('./components/admin/AdminMaster.vue').default); //'admin-main' this type of name must be small letter


//---------------------------- V-form ----------------------------

import { Form, HasError, AlertError } from 'vform'

window.Form = Form; //for using globaly that means can use any file  

Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)



//---------------------------- Sweetalert2 ----------------------------

import Swal from 'sweetalert2'  //https://sweetalert2.github.io/#frameworks-integrations
window.Swal = Swal;  //for using globaly that means can use with any file

//Aleart Script
const Toast = Swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000,
  timerProgressBar: true,
  onOpen: (toast) => {
    toast.addEventListener('mouseenter', Swal.stopTimer)
    toast.addEventListener('mouseleave', Swal.resumeTimer)
  }
})

// Toast.fire({    //-------------->>> this aleart is shown globally if Reload, thats why comment in
//   icon: 'success',
//   title: 'Successfully Done'
// })

window.Toast = Toast //for using globaly that means can use with any file

//Sweetalert2 --x--



//---------------------------- Support Moment Js ---------------------

import {filter} from './filter' 
//This file is separated because of using different time formate


//---------------------------- Vue Router ----------------------------

import VueRouter from 'vue-router'
Vue.use(VueRouter) 

import {routes} from './routes';  //'routes' name should be same, see bellow (16 line)

const router = new VueRouter({
    routes, // short for `routes: routes`
    // mode:'history' //by using this '#' is not show in url 
    mode:'hash' //by using this '#' is show in url 
  })

                
//---------------------------- Support Vuex ----------------------------

//import Vue from 'vue' //or, 

import Vuex from 'vuex'
Vue.use(Vuex) 

import storeData from "./store/index";

const store = new Vuex.Store(
  storeData
)


const app = new Vue({
    el: '#app',
    router, //can access all router after put this here 
    store
});

