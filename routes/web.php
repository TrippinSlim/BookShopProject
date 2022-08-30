<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CustomAuthController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\TemplateController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('admin-product',[ProductController::class,'index']);
Route::get('admin-account',[AdminController::class,'index']);

Route::get('add',[ProductController::class,'add']);
Route::get('save',[ProductController::class,'save']);
Route::get('edit/{id}',[ProductController::class,'edit']);
Route::post('update',[ProductController::class,'update']);
Route::get('delete/{id}',[ProductController::class,'delete']);

Route::get('delete/{id}',[AdminController::class,'userdelete']);

Route::get('index',[CustomAuthController::class,'index']);
Route::post('userinfoupdate',[CustomAuthController::class,'userinfoupdate']);

Route::get('/login',[CustomAuthController::class,'login']);
Route::get('/registration',[CustomAuthController::class,'registration']);
Route::post('/register-user',[CustomAuthController::class,'registerUser'])->name('register-user');
Route::post('login-user',[CustomAuthController::class,'loginUser'])->name('login-user');

Route::get('/logout',[CustomAuthController::class,'logout']);


Route::get('/information/{id}',[CustomAuthController::class, 'information']);
Route::post('userinfoupdate',[CustomAuthController::class,'userinfoupdate']);

Route::get('admin-author',[AuthorController::class,'index']);
Route::get('add-author',[AuthorController::class,'add']);
Route::get('save',[AuthorController::class,'save']);
Route::get('edit-author/{id}',[AuthorController::class,'edit']);
Route::post('update',[AuthorController::class,'update']);
Route::get('delete/{id}',[AuthorController::class,'delete']);
