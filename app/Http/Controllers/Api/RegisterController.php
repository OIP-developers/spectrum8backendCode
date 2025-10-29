<?php

namespace App\Http\Controllers\Api;

use Log;
use Exception;
use App\Models\User;
use App\Models\Device;
use App\Mail\sendEmail;
use App\Models\License;
use App\Models\Facilitator;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\GroupFacilitator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;


use Illuminate\Support\Facades\Password;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password as RulesPassword;
use App\Http\Controllers\Api\BaseController as BaseController;

class RegisterController extends BaseController
{
    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'confirm_password' => 'required|same:password',
        ]);

        if ($validator->fails()) {

            return $this->sendError('Validation Error.', $validator->errors(), 400);
        }

        $input = $request->all();
        $input['password'] = Hash::make($input['password']);
        $input['role_id'] = 1;
        $user = User::create($input);
        $success['token'] =  $user->createToken('MyApp')->plainTextToken;
        $success['name'] =  $user->name;

        return $this->sendResponse($success, 'User register successfully.');
    }

    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors(), 400);
        }

        try {

            $user = Facilitator::where('email', $request->email)->first();
            if ($user == null) {
                return ["message" => 'Incorrect Email.'];
            }
            if (Hash::check($request->password, $user->Password) == false) {
                return ["message" => 'Incorrect Password.'];
            }
            if (isset($user)) {
                $license = License::where('OrganizationID',$user->OrganizationID)->with('license_type')->first();
                if(!isset($license)){
                    return ["message" => 'Organization License Not Found!'];
                }
                // $number_of_devices = Device::where('facilitator_id', $user->id)->get();
                // if(count($number_of_devices) >= $user->number_of_devices_login){
                // if(count($number_of_devices) >= $license->license_type->number_of_devices_login){
                //     return ["message" => 'login quota exceed.'];
                // }
                $group_check = GroupFacilitator::where('FacilitatorID', $user->id)->first();
                if ($group_check == null) {
                    return ["message" => 'Please! Assign Group'];
                    // return $this->sendError('Invalid.', ['error' => 'Please! Assign Group'],400);
                }
                // dd(Auth::guard('api'));
                // if (Auth::guard('api')->attempt(['Email' => $request->email, 'Password' => $request->password])) {
                if (Hash::check($request->password, $user->Password)) {
                    $license = License::where('OrganizationID',$user->OrganizationID)->first();
                    if(!isset($license)){
                        return ["message" => 'Organization License Not Found!'];
                    }
                    if($license->is_expire == "true"){
                        return ["message" => 'Organization License Expire!'];
                    }                    
                    // $user = Auth::user();
                    $success['token'] =  $user->createToken('MyApp')->plainTextToken;
                    $success['id'] =  $user->id;
                    $success['Firstname'] =  $user->Firstname;
                    $success['Lastname'] =  $user->Lastname;
                    $success['email'] =  $user->Email;
                    $success['show_video'] =  $user->show_video;
                    // $success['number_of_devices_login'] =  $user->number_of_devices_login;
                    return $this->sendResponse($success, ['success' => 'Facilitator login successfully.'], 200);
                } else {
                    return $this->sendError('Unauthorised.', ['error' => 'Unauthorised'], 400);
                }
            } else {
                return $this->sendError('Unauthorised.', ['error' => 'Unauthorised'], 400);
            }
        } catch (\Exception $ex) {
            return response()->json(['success' => false, 'message' => $ex->getMessage()], 500);
        }
    }



    public function forgotPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);

        $status = Password::sendResetLink(
            $request->only('email')
        );

        if ($status == Password::RESET_LINK_SENT) {
            return [
                'status' => __($status)
            ];
        }
    }

    public function reset(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required',
            'password_confirmation' => 'required|min:8|same:password',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors(), 400);
            // return response()->json([
            //     'message'=> "All Fields Are Mendatory"
            // ]);
        }
        try {
            $status = User::where('email', $request->email)->first();
            if (isset($status)) {
                $status->password = Hash::make($request->password);
                $status->save();
                if ($status->save()) {
                    return $this->sendResponse($status, 'Password Updated successfully .', 200);
                } else {
                    return $this->sendError('SomeThing went wrong', ['error' => 'Password Not Updated.']);
                }
            }
        } catch (\Exception $ex) {
            return $ex;
            return $this->sendError($ex->getMessage(), ['error' => '404']);
        }

        // dd($request->all());
        // $status = Users::where('email',$request->email)->first();
        // $status = Password::reset(
        //     $request->only('email', 'password', 'password_confirmation'),
        //     function ($user) use ($request) {
        //         $user->forceFill([
        //             'password' => Hash::make($request->password),
        //             'remember_token' => Str::random(60),
        //         ])->save();

        //         $user->tokens()->delete();

        //         event(new PasswordReset($user));
        //     }
        // );

        // if ($status == Password::PASSWORD_RESET) {
        //     return response([
        //         'message'=> 'Password reset successfully'
        //     ],200);
        // }

        // return response([
        //     'message'=> __($status)
        // ], 500);

    }

    public function requestOtp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors(), 400);
        }

        try {
            $otp = rand(1000, 9999);
            //Log::info("otp = ".$otp);
            // $otp = 1234;
            $success = Facilitator::where('email', $request->email)->update(['otp' => $otp]);

            if ($success) {

                $details = [
                    'title' => 'Spectrum Forgot Password OTP',
                    'body' => 'Your OTP is : ' . $otp
                ];

                Mail::to($request->email)->send(new sendEmail($details));
                return $this->sendResponse($success, 'OTP sent successfully', 200);
                //return response(["status" => 200, "success" => "OTP sent successfully"]);
            } else {
                return $this->sendError('Unauthorised.', ['error' => 'email not matched'], 500);
                //return response(["status" => 401, 'success' => 'Invalid email']);
            }
        } catch (\Exception $ex) {
            return $this->sendError($ex->getMessage(), ['error' => '404']);
        }
    }


    public function verifyOtp(Request $request)
    {

        $success  = Facilitator::where(['email' => $request->email, 'otp' => $request->otp])->first();
        if ($success) {
            auth()->login($success, true);
            Facilitator::where('email', $request->email)->update(['otp' => null]);
            $accessToken = auth()->user()->createToken('authToken')->accessToken;
            return $this->sendResponse($success, 'otp matched success fully');
            //return response(["status" => 200, "success" => "opt matched success fully", 'user' => auth()->user(), 'access_token' => $accessToken]);
        } else {
            return $this->sendError('otp.', ['error' => 'otp not matched'], 500);
            //return response(["status" => 401, 'success' => 'Invalid otp code']);
        }
    }


    public function reset_password(Request $request)
    {
        try {
            $input = $request->all();

            $validator = Validator::make($request->all(), [
                'password' => 'required|min:8',
                'password_confirmation' => 'same:password',
            ]);

            if ($validator->fails()) {
                return $this->sendError('Validation Error.', $validator->errors(), 400);
                // return $validator->errors()->first();
            }

            $success = Facilitator::where('email', $request->email)->update([
                'password' => Hash::make($input['password']),
            ]);

            return $this->sendResponse(
                $success,
                'password changed successfully.'
            );
        } catch (\Exception $ex) {
            return $ex;
        }
    }
}
