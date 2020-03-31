<div align="center">
  
# Laravel-Vue.js Blog Project

</div>

<p align="center"><img src="https://miro.medium.com/max/640/1*FPKwlbwrWYmQ49FmMXu4Ug.png"></p>

## Here the things were used in this blog

- Vue Router with Laravel(Using for routing).
- Vue filter
- Vuex with Laravel (Used for state management)
- Install AdminLTE 3 (Template used for admin panel)
- Font Awesome 5 on Laravel (Used for admin panel icon)
- V-form validation with Laravel (Used for form validation)
- Relational Database with Laravel (Used for Maintainance DB)
- Axios and Ajax Request (Passing request for fetch and crud operation)
- Use Moment js on Laravel (Used for formating date time)
- Use Sweetalert2 (Used for flash message)
- Image intervation with Laravel (Used for image resize)
- Use lodash
- And so on

## Important commands related this project

- Laravel Install - **_composer create-project --prefer-dist laravel/laravel blog "5.8.*"_**
- NPM Install - **_npm install_**
- AdminLTE 3 - **_npm install admin-lte --save_**
- Database Migration - **_php artisan migrate_**
- Seeding - **_php artisan db:seed_**
- Install Vue Router - **_npm install vue-router_**
- for compile Vue - **_npm run watch_**
- v-form - **_npm i axios vform_**
- Sweet Aleart - **_npm install sweetalert2_**
- Vuex Install - **_npm install vuex --save_**
- Moment Js - **_npm install moment --save_**
- Mark Down Editor - **_npm install v-markdown-editor_** || please visit: https://vuejsexamples.com/
- Font-Awesome - **_npm install --save @fortawesome/fontawesome-free_** 
- Image Intervention - **_composer require intervention/image_**  || and then publish configuration in Laravel - **_php artisan vendor:publish --provider="Intervention\Image\ImageServiceProviderLaravelRecent"_** || please visit:: http://image.intervention.io/getting_started/installation
- Please check all package in "package.json"

## After clone or download this project, please follow the instructions

- Clone the repository with **_git clone https://github.com/Irfan-Chowdhury/Blog-with-Laravel-and-Vue.git_**
- Run **_cd Blog-with-Laravel-and-Vue_**
- Copy **.env.example** file to **.env** and edit **Database** credentials there
- Run **_composer install_**
- Run **_php artisan key:generate_**
- Run **_php artisan migrate_**
- Run **_php artisan db:seed_** [Optional] 
- Run **_npm install_**
- Run **_npm run watch_**
- Run **_php artisan serve_**