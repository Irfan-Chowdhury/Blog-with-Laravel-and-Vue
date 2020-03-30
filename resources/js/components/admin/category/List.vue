<template>
    <!-- Main content -->
      <div class="row justify-content-around">
        <div class="col-8">
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
                            <!-- ==== Category Delete using CheckBox Start ======== -->
                  <th>
                    <select name="" v-model="select" id="" @change="deleteSelect()" class="form-control"> 
                        <option value="">Select</option>
                        <option value="">Delete Selected Item</option>
                    </select><br>
                    <input type="checkbox" @click.prevent="selectAll" v-model="all_select">
                    <span v-if="all_select==false">Check All</span>
                    <span v-if="all_select==true">Uncheck All</span>
                  </th>
                               <!-- ==== Category Delete using CheckBox End ======== -->

                  <th>SL</th>
                  <th>Category Name</th>
                  <th>Date</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="(category,index) in getAllCategory" :key="category.id">

                                    <!-- ==== Check Box Start ======== -->
                  <td><input type="checkbox" v-model="categoryItem" :value="category.id"></td> 
                                     <!-- ==== Check Box Start ======== -->

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

    data(){
      return{
        categoryItem:[],
        select:'',
        all_select:false //initial stage it will be false (before select item)
      }
    },

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

      },

      deleteSelect(){
        //Alert Message
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
                      axios.get('/delete-selected-category/'+this.categoryItem)
                        .then(()=>{
                          this.$store.dispatch("allCategory") 
                          this.categoryItem = [] //after deleting of selected id then the dropdown will be nll
                          //For Success Alert Message
                          Toast.fire({
                                icon: 'success',
                                title: 'Category Deleted Successfully'
                            })
                        })
                      // ---- According to video - Main Part End ---
              }
          })
      },

      selectAll(){
        if (this.all_select==false) 
        {
            this.all_select = true // সিলেক্ত করলে উপরে False এসাইনটা True হয়ে যাবে ।
            for(var category in this.getAllCategory){ // "var category" দিয়ে category ডিক্লার করছে ।। "getAllCategory" উপরের "mounted->getAllCategory()" থেকে কল করা   
                this.categoryItem.push(this.getAllCategory[category].id) // "this.categoryItem" উপরের "data->categoryItem" থেকে কল  || "getAllCategory[category].id" এই মেথডের ভিতরে Category->id টা নিচ্ছে   
            }
        }
        else
        {
          this.all_select = false // সিলেক্ত না করলে উপরে False এসাইনটা False ই থাকবে ।
          this.categoryItem = [] //if click uncheck then all selected item will be null/Uncheck
        }
          
          // alert(this.categoryItem)
      },
    },

}
</script>

<style scoped>

</style>>


   