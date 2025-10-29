<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\Role;
use Illuminate\Support\Facades\Auth;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Request;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string[]|null  ...$guards
     * @return mixed
     */
    public function handle($request, Closure $next,  $guard = null)
    {
        // $guards = empty($guards) ? [null] : $guards;

        // foreach ($guards as $guard) {
        //     if (Auth::guard($guard)->check()) {
        //         return redirect(RouteServiceProvider::HOME);
        //     }
        // }
        if (Auth::check() && Request::route()->getName() == 'login') {
            $role = Auth::user()->role_id;
            $role_data = Role::where('id', $role)->first();
            if (in_array('assessment_result_read', $role_data->Permission)) {
                // return redirect()->route('organization.view');
                return redirect()->route('result.view');
            }
            if (in_array('user_read', $role_data->Permission) && !in_array('assessment_result_read', $role_data->Permission)) {
                return redirect()->route('users.view');
            }
            if (in_array('lookup_read', $role_data->Permission) && !in_array('assessment_result_read', $role_data->Permission) && !in_array('group_read', $role_data->Permission)) {
                return redirect()->route('class.view');
            }
            if (in_array('group_read', $role_data->Permission) && !in_array('assessment_result_read', $role_data->Permission)) {
                return redirect()->route('group.view');
            }
        }
        if (Auth::guard($guard)->check()) {
            //return redirect(RouteServiceProvider::HOME);
            $role = Auth::user()->role_id;
            $role_data = Role::where('id', $role)->first();
            switch ($role_data) {
                case in_array('assessment_result_read', $role_data->Permission):
                    return route('result.view');
                    break;
                case in_array('user_read', $role_data->Permission) && !in_array('assessment_result_read', $role_data->Permission):
                    return route('users.view');
                    break;
                case in_array('lookup_read', $role_data->Permission) && !in_array('assessment_result_read', $role_data->Permission) && !in_array('group_read', $role_data->Permission):
                    return route('class.view');
                    break;
                case in_array('group_read', $role_data->Permission) && !in_array('assessment_result_read', $role_data->Permission):
                    return route('group.view');
                    break;
                default:
                    return route('login');
                    break;
            }
        }

        return $next($request);
    }
}
