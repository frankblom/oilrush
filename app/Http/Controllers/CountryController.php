<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Country;
use App\Source;
use App\Oil;

class CountryController extends Controller
{
    public function show($id){
    	// $c = Country::join('oil', 'countries.id', '=', 'oil.country_id');
    				// ->leftJoin('countries', "oil.country_id", '=','countries.id')
    				// ->whereNull('oil.end')
    				// ->groupBy(array('sources.id','countries.name'))
    				// ->select(array('sources.id as source.id', 'countries.name'))
    // 				->select(DB::raw("SUM(
				// oil.lpm * TIMESTAMPDIFF(MINUTE,oil.start,
				// (
				// 	CASE 
				// 	WHEN oil.end IS NULL
				// 	THEN NOW()
				// 	ELSE oil.end
				// 	END
				// ))) AS `amount`,
				// sources.id as source,
				// countries.name as country
				// "))->groupBy(array('sources.id' ,'countries.name'))
    				// ->get();


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
