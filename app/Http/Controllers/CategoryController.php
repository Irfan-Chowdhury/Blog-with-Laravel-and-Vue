<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;

class CategoryController extends Controller
{
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
}
