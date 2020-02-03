<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */
use App\User;
// ---------------------
use App\Category; //must careful to add these Models name, if you use all factories in here
use App\Post;

/* [Optional]
|--------------------------------------------------------------------------
| you can use saperatly all the factory by typing bellow command
|---------------------------------------------------------------------------
| php artisan make:factory CategoryFactory --model=Category
| php artisan make:factory PostFactory --model=Post
|
| then put there the all the neccessary info like "User"
|
/* 


use Illuminate\Support\Str;
use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(User::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'email_verified_at' => now(),
        'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
        'remember_token' => Str::random(10),
    ];
});

$factory->define(Category::class, function (Faker $faker) {
    return [
        'category_name' => $faker->unique()->name,
    ];
});

$factory->define(Post::class, function (Faker $faker) {
    return [
        'user_id' =>rand(1,10),
        'category_id' =>rand(1,10),
        'comment_id' =>rand(1,10),
        'title' => $faker->sentence,
        'description' => $faker->paragraph,
        'photo' => $faker->imageUrl,
    ];
});


// Search in google by typing "Laravel Factory"
