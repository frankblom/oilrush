<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Country;
use App\Source;
use App\Oil;

class SourceController extends Controller
{
    public function show($id){
        $l = session('login');
        if($l['type'] != "admin" && $l['type'] != "source"){
            return redirect("/countries/{$l['id']}");
        }

        if($l['id'] != $id && $l['type'] != "admin"){
            return redirect("/sources/{$l['id']}");
        }

    	$s = Source::find($id);
    	$countries = Country::all();

    	return view('source',array(
			'source' => $s,
			'countries' => $countries,
		));
    }

    public function update($id, Request $r){
        $l = session('login');
        if($l['type'] != "admin" || $l['type'] != "source"){
            return redirect("/countries/{$l['id']}");
        }

        if($l['id'] != $id && $l['type'] != "admin"){
            return redirect("/sources/{$l['id']}");
        }

    	$newcountryID = $r->input('country');
    	$newcountry = Country::find($newcountryID);
    	$source = Source::find($id);

    	if($newcountry == null || $newcountry->id == $source->owner_id){
    		return redirect()->route('show-source',["id"=>$id]);
    	}

    	$oil = Oil::where('source_id',$source->id)
    				->where('country_id', $source->owner_id)->first();

    	// close the oil input
		if($oil != null){
			$oil->end = DB::raw('NOW()');
			$oil->save();
		}

		//update the owner
    	$source->owner_id = $newcountry->id;
    	$source->save();

    	// build new oil
		$new = new Oil();
		$new->country_id = $newcountry->id;
		$new->source_id = $source->id;
		$new->lpm = $source->lpm;
		$new->start = DB::raw('NOW()');
		$new->save();

    	return redirect()->route('show-source',["id"=>$id]);
    }
}
