<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use App\Country;
use App\Source;

class HomeController extends Controller
{

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        return view('login');
    }

    public function login(Request $request){
        $code = $request->input('code');

        if($code == "ADMINADMINADMIN"){
            $source = Source::first();
            $source->type = "admin";
            session(['login' => $source]);
            // Cache::forever('login', $source);
            return redirect("/sources/{$source->id}");
        }



        $country = Country::where('code',$code)->first();
        if($country != null){
            $country->type = "country";
            session(['login' => $country]);
            return redirect("/countries/{$country->id}");
        }

        $source = Source::where('code',$code)->first();
        if($source != null){
            $source->type = "source";
            session(['login' => $source]);
            return redirect("/sources/{$source->id}");
        }

        return redirect('/')->with('error', 'Invalid code');
    }
}
