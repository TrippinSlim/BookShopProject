<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Product;
use Hash;
use Session;

class CustomAuthController extends Controller
{
    public function login(){
        return view("auth.login");
    }
    public function registration(){
        return view("auth.registration");
    }
    public function registerUser(Request $request){
        $request->validate([
            'name'=>'required',
            'email'=>'required|email|unique:users',
            'password'=>'required|min:5|max:12'
        ]);
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $res = $user->save();
        if($res){
            return back()->with('success','You have been registered');
        }else{
            return back()->with('fail','Something went wrong');
        }
    }
    public function loginUser(Request $request)
    {
        $request->validate([
            'email'=>'required|email',
            'password'=>'required|min:5|max:12'
        ]);
        $user = User::where('email','=',$request->email)->first();
        if($user){
            if(Hash::check($request->password,$user->password)){
                $request->session()->put('loginId', $user->id);
                
                return redirect('index');
            }else{
                return back()->with('fail','Password is incorrect');
            }
        }else{
            return back()->with('fail','This email is not registered');
        }
    }
    
    public function logout()
    {
        if (session()->has('loginId')) {
            session()->pull('loginId');
            return redirect('index');
        }
    }

    public function information($id)
    {
        if (session()->has('loginId')) {
            $data = User::where('id', '=' ,session()->get('loginId'))->first();
        }
        return view('auth.information', compact('data'));
    }

    public function saveinformation(Request $request)
    {
        $id = $request->id;
        User::where('id', '=', $id);
    }
    public function index()
    {
        $data2 = array();
        if (session()->has('loginId')) {
            $data2 = User::where('id', '=' ,session()->get('loginId'))->first();
        }
        $data = Product::join('authors', 'products.bookauthorID', 'authors.bookauthorID')->join('category', 'products.bookcategoryID', 'category.bookcategoryID')->get();
        return view('index', compact('data','data2'));
    }
    public function userinfoupdate(Request $request)
    {
        $id=$request->id;
        User::where('id', '=', $id)->update(
        [
        
            'name'=>$request->name,
            'email'=>$request->email,        
        ]
        );
        return redirect()->back()->with('success', 'Product Updated Successfully');
    }
}
