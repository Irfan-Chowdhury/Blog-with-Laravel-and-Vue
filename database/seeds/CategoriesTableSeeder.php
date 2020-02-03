<?php

use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Category::class,10)->create();
    }
}

/*
| you can seed on a specific seeder by typing bellow the command
|----------------------------------------------------------------
| php artisan db:seed --class=CategoriesTableSeeder
|----------------------------------------------------------------
*/ 
