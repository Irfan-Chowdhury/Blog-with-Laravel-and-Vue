<template>
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="mt-5 card card-primary">
                    <div class="card-header">
                        <h3 class="card-title text-center">Add New Category</h3>
                    </div>
                    <form role="form" @click.prevent="addCategory()">
                        <div class="card-body">
                        <div class="form-group">
                            <label for="category_name">Category Name</label>
                            <input name="category_name" v-model="form.category_name" type="text" class="form-control" id="category_name" placeholder="Enter Category Name">
                        </div>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
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
    name:"New",
    data(){
        return {
            form:new Form({
                category_name:'',
            })
        }
    },
    methods: {
        addCategory(){
            //console.log('ok') // for check
            this.form.post('/add-category')
            .then(({ data }) => { 
                console.log(data) 
            })
        }
    },
}
</script>

<style scoped>

</style>>