<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\Category;
use Auth;
class PostController extends Controller
{
    public function all_post()
    {
        // $posts = Post::all();
        // return $posts;

        $posts = Post::with('user','category')->orderBy('id','DESC')->get(); //'user' & 'category' come from Post Model
        return response()->json([
            'posts' => $posts
        ],200);
    }

    public function add_post(Request $request)
    {
        $this->validate($request,[ 
            'title' => 'required|min:3|max:50',
            'description' => 'required',
            'category_id' => 'required'
        ]);

        $post = new Post();
        $post->user_id = Auth::user()->id;
        $post->category_id = $request->category_id;
        $post->title = $request->title;
        $post->description = $request->description;
        $post->save();
    }
}
