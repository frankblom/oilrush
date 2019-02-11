<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Country;
use App\Source;
use App\Oil;


class AdminController extends Controller
{
	public function __construct(){
        // $l = Cache::get('login');
        $l = session('login');
        if($l['type'] != "admin"){
            return redirect("/sources/{$l['id']}");
        }
    }

    public function admin(){
    	$countries = Country::all();
    	$sources = Source::all();
    	$score = Country::leftJoin('oil', 'oil.country_id', '=', 'countries.id')
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
				->orderBy('amount','DESC')
				->get();

    	return view('admin',array(
    		'score' => $score,
    		'sources' => $sources
    	));
    }

    public function action(Request $request){
    	switch ($request->input('action')) {
    		case 'update':
    			$this->updateSources($request->except(['_token','action']));
    			break;
    		case 'END':
    			$this->clearSources();
    			$this->endOil();
    			break;
    		case 'random':
    			$this->randSource();

    			break;
    	}

    	return redirect("/AD");
    }

    private function clearSources(){
    	Source::where('lpm','>',0)->update(['lpm'=>0,'owner_id'=>NULL]);
    }

    private function endOil(){
    	Oil::where('end',NULL)->update(['end'=>DB::raw('NOW()')]);
    }

    private function randSource(){
    	$sources = Source::all();
    	foreach ($sources as $s) {
    		$s->update(['lpm'=>rand(1,5)]);
    	}
    }

    private function updateSources($data){
    	foreach ($data as $id => $value) {
    		Source::where('id',$id)->update(['lpm'=>$value]);
    	}
    }

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
