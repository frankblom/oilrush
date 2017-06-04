<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Cache;

class Guest
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
        $login = session('login');
        if($login == null){
            return $next($request);
        }

        if($login->type == "country"){
            return redirect("/countries/{$login->id}");
        }else{
            return redirect("/sources/{$login->id}");
        }
    }
}
