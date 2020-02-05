
import AdminHome from './components/admin/AdminHome.vue'
import CategoryList from './components/admin/category/List.vue'
import AddCategory from './components/admin/category/New.vue'

export const routes = [
    {
        path:'/home',  //this is url path
        component:AdminHome //must be use same name with import's name
    },

    {
        path:'/category-list',
        component:CategoryList
    },

    {
        path:'/add-category',
        component:AddCategory
    }
]