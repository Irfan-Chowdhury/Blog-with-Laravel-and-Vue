export default {
    state:{
        category:[],
        post:[], //--postList-step:4--  || use for "postList-step:3" 
        blogpost:[], //blogpost and post both are same 
    },

    getters:{
        getCategory(state){
            return state.category
        },
        getPost(state){ //--postList-step:5 -- || then goto List.vue || in video wrote 'getAllPost'
            return state.post 
        },
        getBlogPost(state){ //blogpost and post both are same 
            return state.blogpost 
        }
    },

    actions:{
        allCategory(context){
            axios.get('/category') //match with route in web.php
                .then((response)=>{
                    // console.log(response.data.categories) //just checking
                    context.commit('categories', response.data.categories) //from controller
            })
        },
        allPost(context){  //--postList-step:2 -- || the 'allPost' come from List.vue
            axios.get('/post') //match with route in web.php
                .then((response)=>{
                    //console.log(response.data) //just checking
                    context.commit('posts',response.data.posts) //in video wrote 'allPost' instead of || here the 'posts' of 'response.data.posts' is the value of - 'posts'  ('posts' => $posts [the left]) from post controller & use for retrive data through this.
                })
        },
        allBlogPost(context){  //blogpost and post both are same 
            axios.get('/blogpost') //match with route in web.php
                .then((response)=>{
                    //console.log(response.data) //just checking
                    context.commit('blogposts',response.data.blogposts) // here the 'blogposts' of 'response.data.blogposts' is the value of - 'blogposts'  ('blogposts' => $blogposts [the left]) from post controller & use for retrive data through this.
                })
        }
    },

    mutations:{
        categories(state,data){
            return state.category = data
        },
        posts(state,data){  //-- postList-step:3 -- || in video wrote 'allPost'|| in video wrote 'payload' instead of 'data' || এখানে data = response.data.posts
            return state.post = data //এখানে post হলো উপরের 4 লাইনের post:[] টা । post এ গিয়ে data  ঢুকবে/এসাইন হবে
        },
        blogposts(state,data){  // blogpost and post both are same ||  এখানে data = response.data.blogposts
            return state.blogpost = data //এখানে post হলো উপরের 4 লাইনের post:[] টা । post এ গিয়ে data  ঢুকবে/এসাইন হবে
        }
    },



}