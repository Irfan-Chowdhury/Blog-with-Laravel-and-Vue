<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\Category;
use Auth;
use Image;
use File;
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
            'title'       => 'required|min:3|max:50',
            'description' => 'required',
            'category_id' => 'required',
            'photo'       => 'required'
        ]);

        //--- Image Intervention Start ---

        $stringPosition = strpos($request->photo,';'); //ধরি "data:image/jpeg;" ; এর আগ পর্যন্ত পজিশন নিবে মানে = "data:image/jpeg"
        $subString      = substr($request->photo,0,$stringPosition); //ঐ photo এর 0 to stringPosition পর্যন্ত স্ট্রিং জোড়া দিবে
        $extention      = explode('/',$subString)[1]; // "[0]=> data:image" / "[1]=>jpeg" আর এখানে যাস্ট extention টাই নিবে ।
        $name           = time().".".$extention;      // randomly(number) generate a unique name with extention
        $upload_path    = public_path()."/Upload_Image/";
        $image          = Image::make($request->photo)->resize(200,200); 
        $image->save($upload_path.$name);             // the photos upload into "Upload_Image" folder
        
        //--- Image Intervention End ---


        $post              = new Post();
        $post->user_id     = Auth::user()->id;
        $post->category_id = $request->category_id;
        $post->title       = $request->title;
        $post->description = $request->description;
        // $post->photo       = "Upload_Image/".$name;  //shortcut & check post-list's comment of image line
        $post->photo       = $name; //good practice
        $post->save();
    }

    public function delete_post($id)
    {
        $post = Post::find($id);

        $image_path = public_path()."/Upload_Image/";
        $image      = $image_path . $post->photo; //concate

        // if (File::exists($image)) //must be declare "use File" in top 
        // {
        //     File::delete($image);
        // }
        if (file_exists($image)) {
            @unlink($image);
        }
        $post->delete();
    }

    public function edit_post($id)
    {
        // return $id; //for checking
        $post = Post::find($id);
        return response()->json([
            'post' => $post
        ],200);
    }

    public function update_post(Request $request, $id)
    {
        $this->validate($request,[ 
            'title'       => 'required|min:3|max:50',
            'description' => 'required',
            'category_id' => 'required',
            // 'photo'       => 'required'
        ]);

        $post = Post::find($id);
        

        if ($request->photo!=$post->photo) 
        {   
            $stringPosition = strpos($request->photo,';'); //ধরি "data:image/jpeg;" ; এর আগ পর্যন্ত পজিশন নিবে মানে = "data:image/jpeg"
            $subString      = substr($request->photo,0,$stringPosition); //ঐ photo এর 0 to stringPosition পর্যন্ত স্ট্রিং জোড়া দিবে
            $extention      = explode('/',$subString)[1]; // "[0]=> data:image" / "[1]=>jpeg" আর এখানে যাস্ট extention টাই নিবে ।
            $name           = time().".".$extention;      // randomly(number) generate a unique name with extention
            $upload_path    = public_path()."/Upload_Image/";
            $image          = Image::make($request->photo)->resize(200,200); 
            $database_image = $upload_path.$post->photo;
            $image->save($upload_path.$name); 

            if (file_exists($database_image)) 
            {
                @unlink($database_image); 
            }
        }
        else 
        {
            $name = $post->photo;
        }

        $post->user_id     = Auth::user()->id;
        $post->category_id = $request->category_id;
        $post->title       = $request->title;
        $post->description = $request->description;
        $post->photo       = $name; 
        $post->update();
    }
}
