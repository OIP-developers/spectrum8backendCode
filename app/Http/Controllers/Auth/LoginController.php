<?php

namespace App\Http\Controllers\Auth;

use App\Models\Role;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    // protected $redirectTo = RouteServiceProvider::HOME;
    public function redirectTo()
    {
        // $role = Auth::user()->role_id;

        // switch ($role) {
        //     case 0:
        //         return route('result.view');
        //         break;
        //     case 1:
        //         return route('result.view');
        //         break;
        //     case 2:
        //         return route('users.view');
        //         break;
        //     case 3:
        //         return route('users.view');
        //         break;
        //     case 4:
        //         return route('users.view');
        //         break;
        //     case 5:
        //         return route('result.view');
        //         break;
        //     case 6:
        //         return route('result.view');
        //         break;
        //     case 7:
        //         return route('result.view');
        //         break;
        //     case 8:
        //         return route('result.view');
        //         break;
        //     case 9:
        //         return route('class.view');
        //         break;
        //     case 10:
        //         return route('group.view');
        //         break;
        //     case 11:
        //         return route('result.view');
        //         break;
        //     default:
        //         return route('login');
        //         break;


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
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
}
