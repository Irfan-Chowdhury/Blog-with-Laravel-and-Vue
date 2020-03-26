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
                  <!-- {{getAllPost}} -->
                  <td>{{index+1}}</td>
                  <td v-if="post.user">{{post.user.name}}</td> <!--প্রথমে post.user নামে কিছু আছে কিনা চেক করবে (এই কন্ডিশনটা না লিখলে এরর শো করবেনা)-->
                  <td v-if="post.category">{{post.category.category_name}}</td> <!--same as like post.user-->
                  <td>{{post.title |shortlength(20,'...')}}</td>
                  <td>{{post.description | shortlength(40,'...')}}</td>  <!-- goto filter.js || first 30 character & then show ... -->
                  <td><img :src="post.photo" alt="" srcset="" height="80px" width="80"></td>
                  <td>                      
                      <a href="#" class="btn btn-warning mr-1">Edit</a>
                      <a href="#" class="btn btn-danger">Delete</a>
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
        mounted(){
          this.$store.dispatch('allPost') //--postList-step:1 -- || 'allPost' goto action in index.js || in video write 'getAllPost'
        },
        computed:{
          getAllPost(){ //--postList-step:6 --  || from index.js 'postList-step-5' || in video wrote 'allPost'
            return this.$store.getters.getPost // in video wrote 'getAllPost'
          }
        },
        methods:{

        }
    }
</script>

<style scoped>

</style>