<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class IsAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // if (auth()->check() && (auth()->user()->role_id == 0 || auth()->user()->role_id == 1 || auth()->user()->role_id == 2 || auth()->user()->role_id == 3 || auth()->user()->role_id == 4 || auth()->user()->role_id == 5 || auth()->user()->role_id == 6 || auth()->user()->role_id == 7 || auth()->user()->role_id == 8 || auth()->user()->role_id == 9 || auth()->user()->role_id == 10 || auth()->user()->role_id == 11)) {
        if (auth()->check()) {
            // if((auth()->user()->role_id == 4 || auth()->user()->role_id == 5) && auth()->user()->is_approved == 'false'){
            //     Auth::logout();
            //     return back()->with('error',"Wait For Admin Approval");
            // }else{
            return $next($request);
            // }
        }
        else{
            return redirect()->route('login');
        }
        Auth::logout();
        return back()->with('error', "You don't have admin access.");
    }
}
