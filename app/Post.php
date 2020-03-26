<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    // 1 User have : Many Post || Many Post under : 1 User
    public function user()  
    {
        return $this->belongsTo(User::class);
    }


    // 1 Category have : Many Post || Many Post under : 1 Category
    public function category()  
    {
        return $this->belongsTo(Category::class);
        // return $this->belongsTo(Category::class,'category_id'); //or you can write this line
    }
}
