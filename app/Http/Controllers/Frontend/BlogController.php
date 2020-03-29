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

    // public function category_visitor()
    // {
    //     $categories_visitor = Category::all();
    //     return response()->json([
    //         'categories_visitor' =>$categories_visitor
    //     ],200);  
    // }
    public function get_all_category(){
        $all_category = Category::all();
        return response()->json([
            'all_category'=>$all_category
        ],200);
    }
}
