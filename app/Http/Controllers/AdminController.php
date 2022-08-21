<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Hash;
use Session;

class AdminController extends Controller
{

    public function index()
    {
        $data = User::get();
        $data2 = array();
        if (session()->has('loginId')) {
            $data2 = User::where('id', '=' ,session()->get('loginId'))->first();
        }

        return view('admin-account', compact('data', 'data2'));
    }
    public function userdelete($id){
        User::where('id', '=', $id)->delete();
        return redirect()->back()->with('success', 'User Deleted Successfully');
    }
}
