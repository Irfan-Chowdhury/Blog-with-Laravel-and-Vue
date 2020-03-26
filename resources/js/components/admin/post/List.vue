<template>
    <!-- Main content -->
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h2>Post List</h2>

              <div class="card-tools">
                  <a href="#" class="btn btn-primary">Add New Post</a> <!-- router link -->
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
                  <td>{{post.user_id}}</td>
                  <td>{{post.category_id}}</td>
                  <td>{{post.title}}</td>
                  <td>{{post.description}}</td>
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