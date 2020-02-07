<template>
    <!-- Main content -->
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h2>Category List</h2>

              <div class="card-tools">
                  <router-link to="add-category" class="btn btn-primary">Add New Category</router-link> <!-- router link -->
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example2" class="table table-bordered table-hover text-center">
                <thead>
                <tr>
                  <th>SL</th>
                  <th>Category Name</th>
                  <th>Date</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="(category,index) in getAllCategory" :key="category.id">
                  <td>{{index+1}}</td>
                  <td>{{ category.category_name }}</td>
                  <td>{{category.created_at | timeformat}}</td>
                  <td>
                      <!-- <router-link :to="`/edit-category/${category.id}`" class="btn btn-warning mr-1">Edit</router-link> --> <!--or, --> 
                      <router-link :to="'/edit-category/'+category.id" class="btn btn-warning mr-1">Edit</router-link>
                      
                      <a href="#" @click.prevent="deleteCategory(category.id)" class="btn btn-danger">Delete</a>
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
    mounted() {
      return this.$store.dispatch("allCategory") //the data in list updated without reload
    },
    computed: {
        getAllCategory(){
          return this.$store.getters.getCategory
            
        }
    },
    methods: {
      deleteCategory(id){
        
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
                        //-------------- in video lecture the part is that after- deleteCategory(id){--------------- 
                          axios.get('/category/'+id) //when the request has passed then go next step
                              .then(()=>{

                                this.$store.dispatch("allCategory") 
                            //after delete- the data in list updated without reload

                                //For Success Alert Message
                                Toast.fire({
                                    icon: 'success',
                                    title: 'Category Deleted Successfully'
                                })
                            })
                        //------------------------------------------ E  N D----------------------------------------
                      }
                  })

      }
    },

}
</script>

<style scoped>

</style>>


   