<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Country;
use App\Source;
use App\Oil;


class AdminController extends Controller
{
    public function score()
    {
    	$top = Country::leftJoin('oil', 'oil.country_id', '=', 'countries.id')
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
				->groupBy(array('countries.id' ,'countries.name','countries.flag'))
				->orderBy('amount', 'desc')
				->pluck('amount')
				->first();

    	$c = Country::leftJoin('oil', 'oil.country_id', '=', 'countries.id')
    			->select(DB::raw("SUM(
				oil.lpm * TIMESTAMPDIFF(MINUTE,oil.start,
				(
					CASE 
					WHEN oil.end IS NULL
					THEN NOW()
					ELSE oil.end
					END
				))) AS `amount`,
				countries.id,
				countries.name,
				countries.flag
				"))
				->groupBy(array('countries.id' ,'countries.name','countries.flag'))
				->orderBy('countries.name')
				->get();

    	return view('score',[
    		'countries' => $c,
    		'top' => ($top < 1000 ? 1000 : $top),
    		]);
    }
}
