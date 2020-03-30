<template>
    <div> <!--In Vue can not suppor double div such- <div></div> & <div></div>, so always use nested like- <div><div> </div></div> || or <span></span>-->
        <section id="inner-headline">
            <div class="container">
                <div class="row">
                <div class="span4">
                    <div class="inner-heading">
                    <h2>Blog left sidebar {{this.$route.params.id}}</h2>
                    </div>
                </div>
                <div class="span8">
                    <ul class="breadcrumb">
                    <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
                    <li><a href="#">Blog</a><i class="icon-angle-right"></i></li>
                    <li class="active">Blog with left sidebar</li>
                    </ul>
                </div>
                </div>
            </div>
        </section>
        <section id="content">
            <div class="container">
                <div class="row">
                <div class="span8">
                    <article v-for="blogpost in getAllBlogPost" :key="blogpost.id">
                        <div class="row">
                            <div class="span8">
                            <div class="post-image">
                                <div class="post-heading">
                                <!-- <h3><a href="#">This is an example of slider post format</a></h3> -->
                                <h3>{{blogpost.title}}</h3>
                                </div>
                                <!-- <img :src="ourImage(blogpost.photo)" alt="" />  --> <!-- Optional . We can use given bellow-->
                                <img :src="`Upload_Image/${blogpost.photo}`" alt="" />
                            </div>
                            <p>{{blogpost.description | shortlength(340,'...')}}</p> <!--goto filter.js || first 500 character & show the dot dot('...')-->
                            <div class="bottom-article">
                                <ul class="meta-post">
                                <li><i class="icon-calendar"></i><a href="#">{{blogpost.created_at | timeformat}}</a></li>
                                <li v-if="blogpost.user"><i class="icon-user"></i><a href="#">{{blogpost.user.name}}</a></li>
                                <li v-if="blogpost.category"><i class="icon-folder-open"></i><a href="#">{{blogpost.category.category_name}}</a></li>
                                <li><i class="icon-comments"></i><a href="#">4 Comments</a></li>
                                </ul>
                                <router-link :to="'/single-blog/'+blogpost.id" class="pull-right">Continue reading <i class="icon-angle-right"></i></router-link>
                                <!-- <a href="#" class="pull-right">Continue reading <i class="icon-angle-right"></i></a> -->
                            </div>
                            </div>
                        </div>
                    </article>
                    
                    <div id="pagination">
                    <span class="all">Page 1 of 3</span>
                    <span class="current">1</span>
                    <a href="#" class="inactive">2</a>
                    <a href="#" class="inactive">3</a>
                    </div>
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
        name: "BlogPost",
        components:{    //blogpost and post both are same 
            BlogSidebar //already import & for the <BlogSidebar></BlogSidebar> 
        },
        mounted(){
            this.$store.dispatch('allBlogPost') //blogpost and post both are same  || 'allBlogPost' goto action in index.js 
            // this.getAllPostsByCategory(); // ==PostsByCategoty:Step-1 ==
        },
        computed:{
            getAllBlogPost(){ //blogpost and post both are same  || from index.js 
                return this.$store.getters.getBlogPost // from index.js
          }
        },
        methods:{
        //     ourImage(img){ //--postList-step:7 --   // ---- Optional -----
        //         return "Upload_Image/"+img;
        //   },
          getAllPostsByCategory(){ //==PostsByCategoty:Step-2 ==
              if (this.$route.params.id!=null) 
              {
                  this.$store.dispatch('getPostsByCategoryId',this.$route.params.id);
              }
              else
              {
                  this.$store.dispatch('allBlogPost')
              }
          }
        },
        watch:{  //|| Use for - quickly change into "Categories"-"Blog" /or/ "Blog"-"Categories" in Sidebar | Sidebar এ Categories এ ক্লিক করলে পোস্ট ঐ অনুসারে পোস্ট দেখাবে । আবার "Blog" এ ক্লিক করলে Blog এ নিয়ে আসবে । watch ব্যবহার না করলে Category wise Posts দেখালে "Blog" এ ক্লিক করলে তখন কাজ করবেনা ।   
            $route(to,from){ //==PostsByCategoty:Step-7 == 
                this.getAllPostsByCategory();
            }
        },

    }
</script>

<style lang="scss" scoped>
</style>