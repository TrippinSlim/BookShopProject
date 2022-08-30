<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Author;
use Hash;
use Session;
use Illuminate\ Filesystem \ Filesystem;

class AuthorController extends Controller
{
    public function index(){
        $data2 = array();
        $data = Author::get();
        if (session()->has('loginId')) {
            $data2 = User::where('id', '=' ,session()->get('loginId'))->first();
        }
        return view('admin-author', compact('data', 'data2'));
    }
    public function userdelete($id){
        User::where('id', '=', $id)->delete();
        return redirect()->back()->with('success', 'Deleted successfully');
    }
    public function add(){
        return view('add-author');
    }
    public function save(Request $request)
    {   

        $id=$request->bookauthorID;
        $name=$request->bookauthorname;

        $aut= new Author();
        $aut->bookauthorID = $id;
        $aut->bookauthorname = $name;
        $aut->save();

        return redirect()->back()->with('success', 'Successfully saved!');
    }
    public function edit($id)
    {
        $data=Author::where('bookauthorID', '=', $id)->first();
        return view('edit-author', compact('data'));
    }
    public function update(Request $request)
    {   
        $id= $request->bookauthorID;
        $name= $request->bookauthorname;
        

        Author::where('bookauthorID', '=', $id)->update(
        [
            'bookauthorID'=>$request->bookauthorID,
            'bookauthorname'=>$request->bookauthorname
        ]
        );
        return redirect()->back()->with('success', 'Updated successfully!');
    }
    public function delete($id){
        Author::where('bookauthorID', '=', $id)->delete();
        return redirect()->back()->with('success', 'Deleted successfully!');
    }
}
