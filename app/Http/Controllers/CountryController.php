<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Country;
use App\Source;
use App\Oil;

class CountryController extends Controller
{
    public function show($id){
        $l = session('login');
        if($l['type'] != "admin" && $l['type'] != "country"){
            return redirect("/sources/{$l['id']}");
        }

        if($l['id'] != $id && $l['type'] != "admin"){
            return redirect("/countries/{$l['id']}");
        }

        $c = Country::find($id);
    	$s = Source::with('owner')->get();
        $score = Oil::where('country_id',$c->id)
            ->select(DB::raw("SUM(
                oil.lpm * TIMESTAMPDIFF(MINUTE,oil.start,
                (
                    CASE 
                    WHEN oil.end IS NULL
                    THEN NOW()
                    ELSE oil.end
                    END
                ))) AS `amount`
                "))
            ->groupBy('country_id')
            ->pluck('amount')->first();

        return view('country',array(
            'sources' => $s,
            'country' => $c,
            'score' => $score
        ));

    	
    }

}
