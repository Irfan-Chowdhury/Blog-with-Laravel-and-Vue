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
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="(category,index) in getAllCategory" :key="category.id">
                  <td>{{index+1}}</td>
                  <td>{{ category.category_name }}</td>
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
    mounted() {
      return this.$store.dispatch("allCategory")
    },
    computed: {
        getAllCategory(){
          return this.$store.getters.getCategory
            
        }
    },
    methods: {
      
    },

}
</script>

<style scoped>

</style>>


   