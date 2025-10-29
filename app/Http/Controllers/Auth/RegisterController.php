<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use App\Models\Organization;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);
    }
    public function OrganizationRegister(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:255',
                'email' => 'required|unique:users',
                'password' => 'required|min:8',
                'abbreviation' => 'required|max:255',
                'address' => 'required',
                'city' => 'required|max:255',
                'state' => 'required|max:255',
                'postal_code' => 'required|max:30',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'role_id' => 2,
                'password' => Hash::make($request->password),
            ]);
            $user_id = $user->id;

            $organization_detail = new Organization;
            $organization_detail->Name = $request->name;
            $organization_detail->Abbr = $request->abbreviation;
            $organization_detail->Address = $request->address;
            $organization_detail->City = $request->city;
            $organization_detail->StateProvince = $request->state;
            $organization_detail->PostalCode = $request->postal_code;
            $organization_detail->OrgEmail = $request->email;
            $organization_detail->CreatedBy = $user_id;
            $organization_detail->IsOrgAdmin = "true";
            $organization_detail->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('error', $e->getMessage())
                ->withInput();
        }
        DB::commit();
        return back()->with('success', 'Organization Register Successfully');
    }
}
