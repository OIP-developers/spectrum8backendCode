<?php

namespace App\Http\Controllers\api;

use App\Models\User;
use App\Models\Customer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Api\BaseController;

class ProfileController extends BaseController
{
    //

    public function index($id)
    {

        $content = User::where('id', $id)->first();
        if (!empty($content)) {
            return $this->sendResponse($content, 'Profile record show successfully.');
        } else {
            return $this->sendError('Invalid Date.', ['error' => 'No data Found']);
        }
    }
    public function update(Request $request, $id)
    {

        try {

            $user = User::find($id);

            $user->name = $request->first_name;
            $user->save();
            return $this->sendResponse($user, 'Profile Record Updated successfully.');
            //return $imageName;
        } catch (\Exception $e) {
            return $e;
        }
    }
    public function change_password(Request $request)
    {


        try {
            $input = $request->all();
            //dd($input);
            $validator = Validator::make($request->all(), [

                'old_password' => 'required',
                'password' => 'required',
                'confirm_password' => 'required|same:password',
            ]);

            if ($validator->fails()) {

                return $this->sendError('Validation Error.', $validator->errors(), 400);
            }

            $success = User::where('id', $request->user_id)->update(['password' =>  bcrypt($input['password'])]);

            return $this->sendResponse($success, 'password changed successfully.');
        } catch (\Exception $ex) {

            return $ex;
        }
    }
    public function updateadmin()
    {
        $admin_data = User::where(['id' => Auth::user()->id])->first();
        // dd($admin_data);
        return view('front.admin.update', compact('admin_data'));
    }

    public function updatedadmin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:100',
            'new_pass' => 'required|min:6|max:50',
        ]);

        if ($validator->fails()) {

            return redirect()->back()->withInput()->withErrors($validator);
        }
        $admin_updated = User::find($request->id);
        if (!Hash::check($request->current_pass, Auth::user()->password)) {
            // The passwords matches
            return back()->with("error", "Your current password does not matches.");
        }
        $admin_updated->name = $request->input('name');
        // $admin_updated->email = $request->input('email');
        $admin_updated->password = Hash::make($request->new_pass);
        $admin_updated->update();

        return back()->with("success", 'Admin Updated successfully.');
    }


    //firebase notifacation
    public function saveToken(Request $request)
    {

        User::where('id', $request->id)
            ->update([
                'device_token' => $request->token
            ]);
        return response()->json(['token saved successfully.']);
    }
    public function sendNotification(Request $request)
    {

        $firebaseToken = User::whereNotNull('device_token')->pluck('device_token')->all();

        $SERVER_API_KEY = 'AAAAhh51txU:APA91bGretz2ZfW856F4G9xmhhuKMqJwsD6q17zETg_YkZAT2frb1A7WT6-mogBjnrcFKALS07BMu_e_botArXlVOJ-wHf61hWA6Sgb_woNuIWwlJ45PpooCcmcgAR0OmfpE0njD2nIX';

        $data = [
            "registration_ids" =>   $firebaseToken,
            "notification" => [
                "title" => "specturm notificatio",
                "body" => "notifcation for assigment",
            ]
        ];
        $dataString = json_encode($data);

        $headers = [
            'Authorization: key=' . $SERVER_API_KEY,
            'Content-Type: application/json',
        ];

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

        $response = curl_exec($ch);

        return response()->json($response);
    }
}
