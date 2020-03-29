<template>
    <div id="singleblog">
        <section id="inner-headline">
            <div class="container">
                <div class="row">
                    <div class="span4">
                        <div class="inner-heading">
                        <h2>Post right sidebar</h2>
                        </div>
                    </div>
                    <div class="span8">
                        <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
                        <li><a href="#">Blog</a><i class="icon-angle-right"></i></li>
                        <li class="active">Blog post right sidebar</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <section id="content">
            <div class="container">
                <div class="row">
                    <div class="span8">
                        <article>
                            <div class="row">
                                <div class="span8">
                                <div class="post-image">
                                    <div class="post-heading">
                                    <!-- <h3><a href="#">Example single post title here {{this.$route.params.id}}</a></h3> --> <!--First check that we have get data by this -->
                                    <h3><a href="#">{{getSingleBlogPost.title}}</a></h3>
                                    </div>
                                    <img :src="`Upload_Image/${getSingleBlogPost.photo}`" alt="" />  <!--Remember about qutaion (``)-->
                                </div>
                                <p>{{getSingleBlogPost.description}}</p>
                                <div class="bottom-article">
                                    <ul class="meta-post">
                                    <!-- <li v-if="getSingleBlogPost.user"><i class="icon-user"></i><a href="#">{{getSingleBlogPost.user.name}}</a></li> -->
                                    <li><i class="icon-user"></i><a href="#">{{getSingleBlogPost.user.name}}</a></li>
                                    <!-- <li v-if="getSingleBlogPost.category"><i class="icon-folder-open"></i><a href="#">{{getSingleBlogPost.category.category_name}}</a></li> -->
                                    <li><i class="icon-folder-open"></i><a href="#">{{getSingleBlogPost.category.category_name}}</a></li>
                                    </ul>
                                </div>
                                </div>
                            </div>
                        </article>
                    </div>
                    <!-- <BlogSidebar/> -->
                    <BlogSidebar></BlogSidebar>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
    import BlogSidebar from "./BlogSidebar.vue" //as like include   
    export default {
        name:"SingleBlog",

        components:{    //blogpost and post both are same 
            BlogSidebar //already import & for the <BlogSidebar></BlogSidebar> 
        },

        mounted(){ //== single-post: step-1 ==
            this.$store.dispatch('getPostById',this.$route.params.id) //then go index.js
        },

        computed:{
            getSingleBlogPost(){ //== single-post: step-6 == 
                return this.$store.getters.getSinglePost // from index.js of "== single-post: step-5 ==" of index.js 
          }
        },
        methods:{
        },
       
    }
</script>

<style lang="scss" scoped>

</style>