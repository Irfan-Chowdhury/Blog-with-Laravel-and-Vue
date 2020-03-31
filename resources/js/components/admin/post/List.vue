<template>
    <!-- Main content -->
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h2>Post List</h2>

              <div class="card-tools">
                  <router-link to="/add-post" class="btn btn-primary">Add New Post</router-link> <!-- router link -->
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example2" class="table table-bordered table-hover text-center">
                <thead>
                <tr>
                            <!-- ==== Post Delete using CheckBox Start ======== -->
                  <th>
                    <select name="" v-model="select" id="" @change="deleteSelect()" class="form-control"> 
                        <option value="">Select</option>
                        <option value="">Delete Selected Item</option>
                    </select><br>
                    <input type="checkbox" @click.prevent="selectAll" v-model="all_select">
                    <span v-if="all_select==false">Check All</span>
                    <span v-if="all_select==true">Uncheck All</span>
                  </th>
                               <!-- ==== Post Delete using CheckBox End ======== -->                  
                  <th>SL</th>
                  <th>User</th>
                  <th>Category</th>
                  <th>Title</th>
                  <th>Description</th>
                  <th>Photo</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="(post,index) in getAllPost" :key="post.id" >

                                    <!-- ==== Check Box Start ======== -->
                  <td><input type="checkbox" v-model="postItem" :value="post.id"></td> 
                                     <!-- ==== Check Box Start ======== -->
                  
                  <!-- {{getAllPost}} -->
                  <td>{{index+1}}</td>
                  <td v-if="post.user">{{post.user.name}}</td> <!--প্রথমে post.user নামে কিছু আছে কিনা চেক করবে (এই কন্ডিশনটা না লিখলে এরর শো করবেনা)-->
                  <td v-if="post.category">{{post.category.category_name}}</td> <!--same as like post.user-->
                  <td>{{post.title |shortlength(20,'...')}}</td> <!-- goto filter.js || first 20 character & show the dot dot('...') -->
                  <td>{{post.description | shortlength(40,'...')}}</td>  
                  <!-- <td><img :src="post.photo" alt="" srcset="" height="80px" width="80"></td> --> <!--Check post controller-->
                  <td><img :src="ourImage(post.photo)" alt="" srcset="" height="80px" width="80"></td>
                  <td>
                      <router-link :to="'/edit-post/'+post.id" class="btn btn-info text-light mr-1">Edit</router-link>                      
                      <a href="#" @click.prevent="deletePost(post.id)" class="btn btn-danger">Delete</a>
                  </td>
                  <!-- <td>Delete</td> -->
                </tr>
                </tbody>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->

          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
</template>

<script>
    export default {
        name:"List",

        data(){
          return{
            postItem:[],
            select:'',
            all_select:false //initial stage it will be false (before select item)
          }
        },

        mounted(){
          this.$store.dispatch('allPost') //--postList-step:1 -- || 'allPost' goto action in index.js || in video write 'getAllPost'
        },

        computed:{
          getAllPost(){ //--postList-step:6 --  || from index.js 'postList-step-5' || in video wrote 'allPost'
            return this.$store.getters.getPost // in video wrote 'getAllPost'
          }
        },

        methods:{
          ourImage(img){ //--postList-step:7 --
            return "Upload_Image/"+img;
          },

          deletePost(id)
          {
            //Alert Message
            Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                  }).then((result) => {
                    if (result.value) {
                      //----------------------------------- Start --------------------------------- 
                        axios.get('/delete-post/'+id) //match with route in web.php || when the request has passed then go next step
                            .then(()=>{
                              this.$store.dispatch("allPost") //after delete- the data in list updated without reload
                          
                              //For Success Alert Message
                              Toast.fire({
                                  icon: 'success',
                                  title: 'Post Deleted Successfully'
                              })
                          })
                      //------------------------------------------ E  N D----------------------------------------
                    }
                })
          },

          deleteSelect()
          {
            // alert(this.postItem)

            // Alert Message
              Swal.fire({
                      title: 'Are you sure to delete ?',
                      text: "You won't be able to revert this!",
                      icon: 'warning',
                      showCancelButton: true,
                      confirmButtonColor: '#3085d6',
                      cancelButtonColor: '#d33',
                      confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {
                        if (result.value) {

                          // ---- According to video - Main Part Start ---
                          axios.get('/delete-selected-post/'+this.postItem)
                            .then(()=>{
                              this.$store.dispatch('allPost') 
                              this.postItem = [] //after deleting of selected id then the dropdown will be nll
                              //For Success Alert Message
                              Toast.fire({
                                    icon: 'success',
                                    title: 'Selected Post Deleted Successfully'
                                })
                            })
                          // ---- According to video - Main Part End ---
                  }
              })
          },

          selectAll()
          {
            if (this.all_select==false) 
            {
                this.all_select = true // সিলেক্ত করলে উপরে False এসাইনটা True হয়ে যাবে ।
                for(var post in this.getAllPost){ // "var post" দিয়ে post ডিক্লার করছে ।। "getAllPost" উপরের "mounted->getAllPost()" থেকে কল করা   
                    this.postItem.push(this.getAllPost[post].id) // "this.postItem" উপরের "data->postItem" থেকে কল  || "getAllpost[post].id" এই মেথডের ভিতরে post->id টা নিচ্ছে   
                }
            }
            else
            {
              this.all_select = false // সিলেক্ত না করলে উপরে False এসাইনটা False ই থাকবে ।
              this.postItem = [] //if click uncheck then all selected item will be null/Uncheck
            }
              
              // alert(this.postItem)
          },
        }
    }
</script>

<style scoped>

</style>