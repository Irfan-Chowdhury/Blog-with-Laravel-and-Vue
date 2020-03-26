<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\Category;
class PostController extends Controller
{
    public function all_post()
    {
        $posts = Post::all();
        // return $posts;
        return response()->json([
            'posts' => $posts
        ],200);
    }
}
