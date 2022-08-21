<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;
use Hash;
use Session;
use Illuminate\ Filesystem \ Filesystem;

class ProductController extends Controller
{
    public function index(){
        $data = Product::join('authors', 'products.bookauthorID', 'authors.bookauthorID')->join('category', 'products.bookcategoryID', 'category.bookcategoryID')->get();
        $data2 = array();
        if (session()->has('loginId')) {
            $data2 = User::where('id', '=' ,session()->get('loginId'))->first();
        }
        //return $data;
        return view('admin-product',compact('data', 'data2'));

    }
    
    public function add(){
        return view('add');
    }
    public function save(Request $request)
    {   

        $id=$request->bookID;
        $name=$request->name;
        $price=$request->price;
        $details=$request->details;
        $image1=$request->image1;
        $author=$request->author;
        $category=$request->category;

        $prd= new Product();
        $prd->bookID = $id;
        $prd->bookname =$name;
        $prd->bookprice = $price;
        $prd->bookdetail = $details;
        $prd->bookimage = $image1;
        $prd->bookauthorID = $author;
        $prd->bookcategoryID = $category;
        $prd->save();

        return redirect()->back()->with('success', 'Product Added Successfully!');
    }
    public function edit($id)
    {
        $data=Product::where('bookID', '=', $id)->first();
        return view('edit', compact('data'));
    }
    public function update(Request $request)
    {   
        $id=$request->bookID;
        

        Product::where('bookID', '=', $id)->update(
        [
        
            'bookname'=>$request->bookname,
            'bookprice'=>$request->bookprice,
            'bookdetail'=>$request->bookdetails,
            'bookimage'=>$request->bookimage1,
            'bookauthorID'=>$request->bookauthor,
            'bookcategoryID'=>$request->bookcategory
        
        ]
        );
        return redirect()->back()->with('success', 'Product Updated Successfully');
    }
    public function delete($id){
        Product::where('bookID', '=', $id)->delete();
        return redirect()->back()->with('success', 'Product Deleted Successfully');
    }
}


