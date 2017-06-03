<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    protected $table = "countries";
    public $timestamps = false;

    /**
     * Get the comments for the blog post.
     */
    public function oil()
    {
        return $this->hasMany('App\Oil');
    }
}
