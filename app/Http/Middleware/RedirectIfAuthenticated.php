<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Cache;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if(Cache::has('login')){
            $d = Cache::get('login');
            if($d->type == "country"){
                return redirect("/countries/{$d->id}");
            }else{
                return redirect("/sources/{$d->id}");
            }
        }

        return $next($request);
    }
}
