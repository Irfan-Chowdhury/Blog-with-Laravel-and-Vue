<template>
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="mt-5 card card-primary">
                    <div class="card-header">
                        <h3 class="card-title text-center">Edit Category</h3>
                    </div>
                    <form role="form" >
                        <div class="card-body">
                        <div class="form-group">
                            <label for="category_name">Edit Category Name</label>

                            <input name="category_name" id="category_name" v-model="form.category_name" type="text" class="form-control">
                            <!-- <input name="category_name" type="text" id="category_name" class="form-control"  :class="{ 'is-invalid': form.errors.has('category_name')}"  placeholder="Enter Category Name">
                            <has-error :form="form" field="category_name"></has-error>
                             -->
                        </div>
                        </div>
                        
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-3"></div>
        
        </div>
    </div>
</template>

<script>
export default {
    name:"Edit",
    mounted(){
        // axios.get('editCategory/'+id)  //or,
        axios.get(`/edit-category/${this.$route.params.categoryid}`) //here 'categoryid' from routes.js
        .then((response)=>{
            this.form.fill(response.data.category) //the 'category' from CategoryController-[edit_category] 
        })
    },
    data(){
        return {
            form:new Form({
                category_name:'',
            })
        }
    },
}
</script>

<style scoped>

</style>>

