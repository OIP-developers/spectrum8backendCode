<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use App\Mail\UserMail;
use App\Jobs\UserMailJob;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function index()
    {
        $users = User::where(['is_archive' => 'false', 'Status' => 1])->where('id', '!=', Auth::user()->id)->orderBy('id','DESC')->get();
        return view('front.users.view', compact('users'));
    }
    public function trash()
    {
        $users = User::onlyTrashed()->orderBy('id','DESC')->get();
        return view('front.users.trash', compact('users'));
    }
    public function restore($id)
    {
        $users_restore = User::withTrashed()->find($id)->restore();
        $user_find = User::where('id',$id)->first();
        $user_data = [
            "name" =>  $user_find->name,
            "email" =>  $user_find->email,
            "sender_email" =>  'muhammad.hannan@oip.com.pk',
            "password" =>  null,
            "created_at" =>   $user_find->created_at,
            "updated_at" =>   $user_find->updated_at,
            "deleted_at" =>  $user_find->deleted_at,
            "type" =>  "Restore"
        ];
        // dispatch(new UserMailJob($user_data));
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $users = User::where('is_archive', 'true')->orderBy('id','DESC')->get();
        return view('front.users.archive', compact('users'));
    }
    public function toggleArchive($id)
    {
        $users = User::find($id);
        if ($users->is_archive == 'true') {
            $users->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $users->is_archive = 'true';
            $mxg = "Archive";
        }
        $users->save();

        $user_find = User::where('id',$id)->first();
        $user_data = [
            "name" =>  $user_find->name,
            "email" =>  $user_find->email,
            "sender_email" =>  'muhammad.hannan@oip.com.pk',
            "password" =>  null,
            "created_at" =>   $user_find->created_at,
            "updated_at" =>   $user_find->updated_at,
            "deleted_at" =>  $user_find->deleted_at,
            "type" =>  $mxg
        ];
        // dispatch(new UserMailJob($user_data));

        return back()->with('success', 'User ' . $mxg . ' Successfully');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:30',
                'email' => 'required|unique:users|email|max:100',
                'password' => 'required|min:8',
                'confirm_password' => 'required|same:password',
                "role" => "required"
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $user = new User;
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = Hash::make($request->password);
            $user->role_id = $request->role;
            $user->CreatedBy = Auth::user()->id;
            $user->save();

            $user_find = User::where('id',$user->id)->first();
            $user_data = [
                "name" =>  $user_find->name,
                "email" =>  $user_find->email,
                "sender_email" =>  'muhammad.hannan@oip.com.pk',
                "password" =>  $request->password,
                "created_at" =>   $user_find->created_at,
                "updated_at" =>   $user_find->updated_at,
                "deleted_at" =>  $user_find->deleted_at,
                "type" =>  "Added"
            ];
            // Mail::to($user_data['sender_email'])->send(new UserMail($user_data));

            // dispatch(new UserMailJob($user_data));

        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'User Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $user_edit = User::where('id', $request->id)->first();
        $roles = Role::where('id', "!=" , 1)->orderBy('RoleName','ASC')->get();
        return view('front.users.add', compact('user_edit','roles'));
    }
    public function showForm()
    {
        $roles = Role::where('id', "!=" , 1)->orderBy('RoleName','ASC')->get();
        return view('front.users.add', compact('roles'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:30',
                'password' => 'required|min:8',
                'confirm_password' => 'required|same:password',
                "role" => "required"
            ]);
            $users = User::find($request->id);
            if ($users->email == $request->email) {
                $validator = Validator::make($request->all(), [
                    'email' => 'required|email',
                ]);
            } else {
                $validator = Validator::make($request->all(), [
                    'email' => 'required|unique:users|email|max:100',
                ]);
            }

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $user_update = User::find($id);
            $user_update->name = $request->name;
            $user_update->email = $request->email;
            $user_update->password = Hash::make($request->password);
            $user_update->role_id = $request->role;
            $user_update->UpdatedBy = Auth::user()->id;
            $user_update->save();

            $user_find = User::where('id',$id)->first();
            $user_data = [
                "name" =>  $user_find->name,
                "email" =>  $user_find->email,
                "sender_email" =>  'muhammad.hannan@oip.com.pk',
                "password" =>  $request->password,
                "created_at" =>   $user_find->created_at,
                "updated_at" =>   $user_find->updated_at,
                "deleted_at" =>  $user_find->deleted_at,
                "type" =>  "Updated"
            ];
            // dispatch(new UserMailJob($user_data));

        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('users.view')->with('success', 'User Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $user_delete = User::find($id)->delete();
        $user_find = User::withTrashed()->find($id);
        $user_data = [
            "name" =>  $user_find->name,
            "email" =>  $user_find->email,
            "sender_email" =>  'muhammad.hannan@oip.com.pk',
            "password" =>  null,
            "created_at" =>   $user_find->created_at,
            "updated_at" =>   $user_find->updated_at,
            "deleted_at" =>  $user_find->deleted_at,
            "type" =>  "Deleted"
        ];
        // dispatch(new UserMailJob($user_data));
        return back()->with('success', 'User Trash Successfully');
    }

    public function bulkDelete(Request $request)
    {

        $rules = [
            'bulk_action' => 'required',
        ];

        $customMessages = [
            'required' => 'Select Atleast One Record'
        ];

        $this->validate($request, $rules, $customMessages);

        foreach ($request->bulk_action as $id) {
            $user_bulk_delete = User::find($id)->delete();
        }
        return back()->with('success', 'Users Deleted Successfully');
    }
}
