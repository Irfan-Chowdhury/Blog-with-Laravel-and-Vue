<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Post;
use App\Category;
class BlogController extends Controller
{
    public function get_all_blog_post()
    {
        //blogpost and post both are same 
        $blogposts = Post::with('user','category')->orderBy('id','DESC')->get(); //'user' & 'category' come from Post Model
        return response()->json([
            'blogposts' => $blogposts
        ],200);
    }

    public function getpost_by_id($id)
    {
         $single_post = Post::with('user','category')->where('id',$id)->first(); 
         return response()->json([
             'single_post' => $single_post
         ],200);
    }

    public function get_all_category(){
        $all_category = Category::all();
        return response()->json([
            'all_category'=>$all_category
        ],200);
    }

    public function getPostsByCategoryId($id)
    {
        $posts_by_category = Post::with('user','category')->where('category_id',$id)->orderBy('id','DESC')->get(); //'user' & 'category' come from Post Model
        return response()->json([
            'posts_by_category' => $posts_by_category  //go to index.js
        ],200);
    }

    public function search_post()
    {
        $search = \Request::get('s'); //Scope Resoulation(:) - যদি কোন মেথড স্ট্যাটিক ডিফাইন্ড করা থাকে , সেক্ষেত্রে ডাবল কোলন থেকে সরাসরি ঐ মেথডে এক্সেস করা যায় 
        $posts = Post::with('user','category')
                    ->where('title','LIKE',"%$search%")
                    ->orWhere('description','LIKE',"%$search%")
                    ->get();

        return response()->json([
            'posts' =>$posts
        ],200);


        // Create Problem in bellow line || উপরেরটা-নিচেরটা সেইম । যদি ঐখানে (vue তে) সার্চ NULL ইত্যাদি কাজ না করে, কোন প্রবলেম হয় নিচেরটা লিখা যাবে । 

        // $search = \Request::get('s'); //Scope Resoulation(:) - যদি কোন মেথড স্ট্যাটিক ডিফাইন্ড করা থাকে , সেক্ষেত্রে ডাবল কোলন থেকে সরাসরি ঐ মেথডে এক্সেস করা যায় 
        // if ($search!=null) 
        // {
        //     $posts = Post::with('user','category')
        //             ->where('title','LIKE',"%$search%")
        //             ->orWhere('description','LIKE',"%$search%")
        //             ->get();

        //     return response()->json([
        //         'posts' =>$posts
        //     ],200);
        // }
        // else {
        //     return $this->get_all_blog_post();
        // }
        


    }

}
