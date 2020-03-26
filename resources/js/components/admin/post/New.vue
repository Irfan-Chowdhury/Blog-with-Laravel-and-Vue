<template>
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="mt-5 card card-primary">
                    <div class="card-header">
                        <h3 class="card-title text-center">Add New Post</h3>
                    </div>
                    <form role="form" enctype="multipart/form-data">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input name="title" v-model="form.title" type="text" id="title" class="form-control"  :class="{ 'is-invalid': form.errors.has('title')}"  placeholder="Type Post Title">
                                <has-error :form="form" field="title"></has-error>
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea name="description" id="description"  rows="3" v-model="form.description" class="form-control"  :class="{ 'is-invalid': form.errors.has('description')}" placeholder="Type Post Description..." ></textarea>
                                <has-error :form="form" field="description"></has-error>
                            </div>
                            <div class="form-group">
                                <label for="category_id">Category</label>
                                <select v-model="form.category_id" name="category_id" class="form-control" id="categoryId" :class="{ 'is-invalid': form.errors.has('category_id')}">
                                    <option value="">--Select Category--</option>
                                    <option v-for="category in getAllCategory" :value="category.id" :key="category.id">{{category.category_name}}</option>
                                  </select>
                                <has-error :form="form" field="category_id"></has-error>
                            </div>
                            <div class="form-group">
                                <label for="photo">Upload Photo</label>
                                <input type="file" @change ="changePhoto($event)" name="photo" class="form-control" :class="{'is-invalid': form.errors.has('photo')}"> <br>
                                <img :src="form.photo" alt="" height="100px" width="100px">
                                <has-error :form="form" field="photo"></has-error>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-2"></div>
        
        </div>
    </div>
</template>

<script>
    export default {
        name: "New",
        data(){ //--Post-Create Step:1--
            return{
                form:new Form({
                    user_id:'',
                    category_id:'',
                    title:'',
                    description:'',
                    photo:'',
                })
            }
        },
        mounted(){ //--Post-Create Step:2-- || this mounted use for data load || we can not CREATE any method in here but can CALL the method from "computed:{}" 
            this.$store.dispatch('allCategory'); //this is load the all category data when stay/click in "Add New Post" page
        },
        computed:{
            getAllCategory(){ //--Post-Create Step:3-- || we just reuse this method
              return this.$store.getters.getCategory   
            }
        },
        methods:{
           changePhoto(event){
            //    console.log(event)

                // var file = event.target.files[0];
                let file = event.target.files[0]; //'let' is use in ES6 instead of 'var'
                
                let reader = new FileReader();
                
                // reader.onload = function(e) {
                reader.onload = event => { //ES6 formate 
                    //console.log(e.target.result)
                    this.form.photo = event.target.result  //from.photo এটা হল উপরে যে data()->{form->photo:''} লিখছি সেটা ।
                };
                reader.readAsDataURL(file); //Don't use 'reader.readAsText(file)' because sometime get file extention may create problem 

                // File Reader: https://developer.mozilla.org/en-US/docs/Web/API/FileReader/onload
           }
        },
    }
</script>

<style lang="scss" scoped>

</style>