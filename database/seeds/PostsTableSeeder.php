<?php

use Illuminate\Database\Seeder;

class PostsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Post::class,10)->create();
    }
}

/*
| you can seed on a specific seeder by typing bellow the command
|----------------------------------------------------------------
| php artisan db:seed --class=PostsTableSeeder
|----------------------------------------------------------------
*/ 