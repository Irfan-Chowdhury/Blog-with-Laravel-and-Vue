<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;

class CategoryController extends Controller
{
    public function __construct() //we can use middleware in every class but this is not good practice in large project
    {
        $this->middleware('auth');
    } 

    public function add_category(Request $request)
    {
        //return $request->all(); //for testing in console

        $this->validate($request,[
            'category_name' => 'unique:categories|required|min:3|max:50'
        ]);

        $category = New Category();
        $category->category_name = $request->category_name;
        $category->save();

        return ['message'=>'ok'];
    }

    public function all_category()
    {
        $categories = Category::all();
        return response()->json([
            'categories' =>$categories
        ],200);  
    }

    public function delete_category($id)
    {
        // return $id;
        $category = Category::find($id);
        $category->delete();
    }

    public function edit_category($id)
    {
        // return $id; //for checking
        $category = Category::find($id);
        return response()->json([
            'category' => $category
        ],200);
    }

    public function update_category(Request $request, $id) // skip it in this commit
    {
        $this->validate($request,[
            'category_name' => 'unique:categories|required|min:3|max:50'
        ]);

        //return $id; //for testing
        $category = Category::find($id);
        $category->category_name = $request->category_name;
        $category->save();
    }   

    public function delete_selected_category($ids)
    {
        $all_id = explode(',',$ids); //Console এ চেক করলে 1,2,3 কমা(,) হয়ে আসে । ওটা থেকে দূর করার জন্য explode ইউজ করা হয় যাতে সেগুলা array হয়ে 123 এভাবে নে 
        foreach($all_id as $id)
        {
            // echo $id;
            $category = Category::find($id); //all_id Array ডাটার প্রতিবার একটি করে id ধরে ডিলিট হচ্ছে 
            $category->delete();
        } 
    }
}
