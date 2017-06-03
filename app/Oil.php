<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Oil extends Model
{
    public $table = "oil";
    public $timestamps = false;

	/**
	* Get the post that owns the comment.
	*/
	public function country()
	{
		return $this->belongsTo('App\Country', 'country_id');
	}

	/**
	* Get the post that owns the comment.
	*/
	public function source()
	{
		return $this->belongsTo('App\Source', 'source_id');
	}
}
