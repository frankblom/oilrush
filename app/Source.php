<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Source extends Model
{
    public $table = "sources";
    public $timestamps = false;

    /**
     * Get the comments for the blog post.
     */
    public function oil()
    {
        return $this->hasMany('App\Oil');
    }


    /**
     * Get the comments for the blog post.
     */
    public function owner()
    {
        return $this->hasOne('App\Country', 'id', 'owner_id');
    }
}
