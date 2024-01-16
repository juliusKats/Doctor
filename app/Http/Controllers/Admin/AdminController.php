<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Admins;

class AdminController extends Controller
{
    public function dashboard()
    {


        return view('admin.dashboard');
    }

    public function login(Request $request)
    {
        if($request->isMethod('post')){
            $data=$request->all();
            $validated=$request->validate([
                'email'=>['required','email'],
                'password'=>['required']
            ]);

            if(Auth::guard('admins')->attempt(['email'=>$data['email'],'password'=>$data['password'],'status'=>1]))
            {

                return redirect()->route('admindashboard')->with('success', 'You have been logged in');
            }
            else{
                return back()->withErrors([
                    'email'=>'Your Provided Credentials do not match',
                ])->onlyInput('email');
            }

        }
        return view('admin.login');
    }
    public function logout(){
//    public function logout(Request $request){
//        Auth::logout();
//        $request->session()->invalidate();
//        $request->session()->regenerateToken();
        Auth::guard('admins')->logout();

        return redirect()->route('login')->with('success','You have logged out Successfully');
    }


}