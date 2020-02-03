<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        /* [ Option-1:]
        |----------------------------------------------------------
        | have 2 facilties, 
        | you can seed on sepecific seeder
        |=========================================================
        | Command: php artisan db:seed --class=NameTableSeeder 
        |=========================================================
        | Or 
        | can seed all seeder 
        |=========================================================
        | Command: php artisan db:seed
        |=========================================================
        |
        */

        //for all
        $this->call(UsersTableSeeder::class); 
        $this->call(CategoriesTableSeeder::class);
        $this->call(PostsTableSeeder::class);



        /* [ Option-2:]
        |----------------------------------------------------------------
        | have only 1 facility, can seed all seeder  
        |=========================================================
        | Command: php artisan db:seed
        |=========================================================
        |
        */

        //for all, but this is not good practice

        // factory(App\User::class,10)->create();
        // factory(App\Category::class,10)->create();
        // factory(App\Post::class,10)->create();

    }
}
