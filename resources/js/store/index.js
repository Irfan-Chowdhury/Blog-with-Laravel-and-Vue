export default {
    state:{
        category:[],
        post:[], //--postList-step:4--  || use for "postList-step:3" 
        blogpost:[], //blogpost and post both are same || ==PostsByCategoty:Step-5 ==
        singlepost:[], //== single-post: step-4 ==
        allcategory:[], //  ==Show-Categories-For-Visitor: Step-4==
        // postsByCategory:[],
    },

    getters:{
        getCategory(state){
            return state.category
        },
        getPost(state){ //--postList-step:5 -- || then goto List.vue || in video wrote 'getAllPost'
            return state.post 
        },
        getBlogPost(state){ // goto BlogPost.vue ||blogpost and post both are same || ==PostsByCategoty:Step-6 == 
            return state.blogpost
        },
        getSinglePost(state){ //== single-post: step-5 ==
            return state.singlepost 
        },
        getCategories(state){ // ==Show-Categories-For-Visitor: Step-5==  || then go to BlogSidebae.vue in  "==Show-Categories-For-Visitor: Step-6=="
            return state.allcategory
        },
        // getPostsByCategory(state){ // 
        //     return state.postsByCategory
        // }
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
                    context.commit('posts',response.data.posts) //in video wrote 'allPost' instead of || here the 'posts' of 'response.data.posts' is the value of - 'posts'  ('posts' => $posts [the left]) from Postcontroller & use for retrive data through this.
                })
        },
        allBlogPost(context){  //blogpost and post both are same 
            axios.get('/blogpost') //match with route in web.php
                .then((response)=>{
                    //console.log(response.data) //just checking
                    context.commit('blogposts',response.data.blogposts) // here the 'blogposts' of 'response.data.blogposts' is the value of - 'blogposts'  ('blogposts' => $blogposts [the left]) from BlogPostcontroller & use for retrive data through this.
                })
        },
        getPostById(context,id){  //== single-post: step-2 == || in video wrote "payload" instead of "id"
            axios.get('/single-post/'+id) //match with "/single-post" in route of web.php
            .then((response)=>{
                //console.log(response.data) //just checking
                context.commit('singlePost',response.data.single_post) // here the 'single_post' of 'response.data.single_post' is the value of - 'single_post'  ('single_post' => $post [the left]) from BlogPostcontroller & use for retrive data through this.
            })
        },
        allCategories(context){ //  ==Show-Categories-For-Visitor: Step-2== 
            axios.get('/all-category')
                .then((response)=>{
                    context.commit('allcategories',response.data.all_category) // here the 'all_category' of 'response.data.all_category' is the value of - 'all_category'  ('all_category' => $post [the left]) from the method "get_all_category" of BlogPostcontroller & use for retrive data through this.
                })
        },
        getPostsByCategoryId(context,payload){ // ==PostsByCategoty:Step-3 == || Here "Payload" means "Id"
            axios.get('/posts-by-category/'+payload)
                .then((response)=>{
                    context.commit('postsByCategoryId',response.data.posts_by_category)
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
            return state.blogpost = data //এখানে blogpost হলো উপরের 4 লাইনের blogpost:[] টা । blogpost এ গিয়ে data  ঢুকবে/এসাইন হবে
        },
        singlePost(state,data){ //== single-post: step-3 ==
            return state.singlepost = data // here the  "state.singlepost" = "state:{ singlepost:[] }" in top || "data" = response.data.post
        },
        allcategories(state,data){  // ==Show-Categories-For-Visitor: Step-3==
            return state.allcategory = data
        },
        // postsByCategoryId(state,data){  // //==PostsByCategoty:Step-4 ==
        //     return state.postsByCategory = data 
        // }        
        postsByCategoryId(state,payload){  //==PostsByCategoty:Step-4 ==
            return state.blogpost = payload 
        }        
    },



}