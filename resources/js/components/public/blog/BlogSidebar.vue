<template>
    <div id="sidebar">
        <div class="span4">
            <aside class="right-sidebar">
            <div class="widget">
                <form class="form-search">
                <input placeholder="Type something" type="text" class="input-medium search-query">
                <button type="submit" class="btn btn-square btn-theme">Search</button>
                </form>
            </div>
            <div class="widget">
                <h5 class="widgetheading">Categories</h5>
                <!-- ==================== Show Categories Start ============= -->
                <ul class="cat">
                    <li v-for="category in getAllcategory" :key="category.id"><i class="icon-angle-right"></i><a href="#"></a><span> {{category.category_name}}</span></li>
                </ul>
                <!-- ==================== Show Categories End ============= -->
            </div>
            <div class="widget">
                <h5 class="widgetheading">Latest posts</h5>
                <ul class="recent">
                    <li v-for="(blogpost,index) in getAllBlogPost" v-if="index<3" :key="blogpost.id">
                        <img :src="`Upload_Image/${blogpost.photo}`" class="pull-left" height="65px" width="65px" alt="" />
                        <h6><a href="#">{{blogpost.title}}</a></h6>
                        <p>{{blogpost.description |shortlength(100,"...")}}</p>
                    </li>
                </ul>
            </div>
            <div class="widget">
                <h5 class="widgetheading">Popular tags</h5>
                <ul class="tags">
                <li><a href="#">Web design</a></li>
                <li><a href="#">Trends</a></li>
                <li><a href="#">Technology</a></li>
                <li><a href="#">Internet</a></li>
                <li><a href="#">Tutorial</a></li>
                <li><a href="#">Development</a></li>
                </ul>
            </div>
            </aside>
        </div>
    </div>
</template>

<script>
    export default {
        name: "BlogPost",

        mounted(){ //কোন Component Load হওয়র সাথে সাথে mounted load হয় আগে 
            // ভুলেও এডমিনের Method/Route গুলা ইউজ করা যাবেনা কারণ ওগুলা Authenticate মানে লগিন থাকা লাগে
             this.$store.dispatch('allCategories') // ==Show-Categories-For-Visitor: Step-1== || goto "action' in "index.js"
             this.$store.dispatch('allBlogPost') // goto "action' in "index.js"
        },
        computed: {
            getAllcategory(){  // ==Show-Categories-For-Visitor: Step-6==  || from gettters in index.js of " ==Show-Categories-For-Visitor: Step-5=="
              return this.$store.getters.getCategories;
            },
            getAllBlogPost(){ // from index.js 
                return this.$store.getters.getBlogPost // from index.js
          }
        },
    }
</script>

<style lang="scss" scoped>

</style>