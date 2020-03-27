<template>
    <div class="container">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="mt-5 card card-primary">
                    <div class="card-header">
                        <h3 class="card-title text-center">Add New Post</h3>
                    </div>
                    <form role="form" @submit.prevent="addNewPost()" enctype="multipart/form-data">
                        <div class="card-body">

                            <div class="form-group">
                                <label for="title">Title</label>
                                <input name="title" v-model="form.title" type="text" id="title" class="form-control"  :class="{ 'is-invalid': form.errors.has('title')}"  placeholder="Type Post Title">
                                <has-error :form="form" field="title"></has-error>
                            </div>

                            <div class="form-group">
                                <label for="description">Description</label>
                                <markdown-editor v-model="form.description" :class="{ 'is-invalid': form.errors.has('description')}"></markdown-editor>  <!--website এ v-model জায়গায় :options লিখা আছে-->
                                <has-error :form="form" field="description"></has-error>
                            </div>

                            <div class="form-group">
                                <label for="category_id">Category</label>
                                <select v-model="form.category_id" name="category_id" class="form-control" id="categoryId" :class="{ 'is-invalid': form.errors.has('category_id')}">
                                    <option>--Select Category--</option>
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
            <div class="col-md-1"></div>
        
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
                    category_id:'--Select Category--',
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
                //console.log(event)
                let file = event.target.files[0]; //'let' is use in ES6 instead of 'var'
                //console.log(file)
                if (file.size>1048576) //1MB = 1048576
                { 
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'File Size should be less then 1MB',
                        //footer: '<a href>Why do I have this issue?</a>'
                    })
                } 
                else 
                {
                    let reader = new FileReader();
                    reader.onload = event => { //ES6 formate 
                        this.form.photo = event.target.result  //from.photo এটা হল উপরে যে data()->{form->photo:''} লিখছি সেটা ।
                        console.log(event.target.result)
                    };
                    reader.readAsDataURL(file); //Don't use 'reader.readAsText(file)' because sometime get file extention may create problem 
                }
                
                // File Reader: https://developer.mozilla.org/en-US/docs/Web/API/FileReader/onload
           },

           addNewPost()
           {
               //console.log(this.form.description)
               
                this.form.post('/add-post')
                .then(({ data }) => { //data টা না লিখলেও সমস্যা নাই, console এ টেস্টিং এর জন্য দেয়া হইছিল  
                    // console.log(data) // check in console
                    this.$router.push('/post-list') //redirect into category-list after save

                    //For Success Alert Message     
                    Toast.fire({
                        icon: 'success',
                        title: 'Post Added Successfully'
                    })
                })
           }
        },
    }
</script>

<style lang="scss" scoped>

</style>