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
            'category_name' => 'required|min:3|max:50'
        ]);

        $category = New Category();
        $category->category_name = $request->category_name;
        $category->save();

        return ['message'=>'ok'];
    }
}
