export default {
    state:{
        category:[],
    },

    getters:{
        getCategory(state){
            return state.category
        }
    },

    actions:{
        allCategory(context){
            axios.get('/category')
                .then((response)=>{
                    // console.log(response.data.categories) //just checking
                    context.commit('categories', response.data.categories) //from controller
            })
        }
    },

    mutations:{
        categories(state,data){
            return state.category = data
        }
    },



}