
import AdminHome from './components/admin/AdminHome.vue'
import ExampleComponent from './components/ExampleComponent.vue'

export const routes = [
    {
        path:'/home',  //this is url path
        component:AdminHome //must be use same name with import's name
    },
    {
        path:'/post',  //this is url path
        component:ExampleComponent //must be use same name with import's name
    },
]