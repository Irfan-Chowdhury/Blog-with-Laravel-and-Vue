//This file is separated because of using different time formate

import Vue from 'vue' //Vue have to defined

// var moment = require('moment'); //or,
import moment from 'moment'


Vue.filter('timeformat',(arg)=>{
    return moment(arg).format("MMM Do YYYY") //Feb 3rd 2020
})


//Post
Vue.filter('shortlength',function (text,length,suffix) { //from List.vue 
    return text.substring(0,length)+suffix ; //0 to length(40) character & 'suffix' indicate '...'
})