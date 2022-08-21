<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;
use Illuminate\ Filesystem \ Filesystem;

class TemplateController extends Controller
{
    public function index(){
        $data = Product::join('authors', 'products.bookauthorID', 'authors.bookauthorID')->join('category', 'products.bookcategoryID', 'category.bookcategoryID')->get();
        $data2 = array();
        if (session()->has('loginId')) {
            $data2 = User::where('id', '=' ,session()->get('loginId'))->first();
        }
        //return $data;
        return view('index',compact('data', 'data2'));
        
    }
}
