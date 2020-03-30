// =============== Admin Component =============== 
import AdminHome from './components/admin/AdminHome.vue'

//Category
import CategoryList from './components/admin/category/List.vue'
import AddCategory from './components/admin/category/New.vue'
import EditCategory from './components/admin/category/Edit.vue'

//Post
import PostList from './components/admin/post/List.vue'
import AddPost from './components/admin/post/New.vue'
import EditPost from './components/admin/post/Edit.vue'


// =============== FrontEnd Component =============== 
import PublicHome from './components/public/PublicHome.vue'
import BlogPost from './components/public/blog/BlogPost.vue'
import SingleBlog from './components/public/blog/SingleBlog.vue'




export const routes = [

// =============== Admin Route =============== 

    {
        path:'/home',  //this is url path
        component:AdminHome //must be use same name with import's name
    },

    // Category
    {
        path:'/category-list',
        component:CategoryList
    },
    {
        path:'/add-category',
        component:AddCategory
    },
    {
        path:'/edit-category/:categoryid',
        component:EditCategory
    },

    // Post
    {
        path:'/post-list',
        component:PostList
    },
    {
        path:'/add-post',
        component:AddPost
    },
    {
        path:'/edit-post/:postid',
        component:EditPost
    },


    // =============== Frontend Route =============== 
    {
        path:'/',
        component:PublicHome
    },
    {
        path:'/blog',
        component:BlogPost
    },
    {
        path:'/single-blog/:id', //in video "blog" instead of "single-blog"
        component:SingleBlog
    },
    {
        path:'/categories/:id', 
        component:BlogPost
    },
]