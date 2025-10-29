<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Event;
use App\Jobs\SendEmailJob;
use App\Models\Role;
use App\Models\Participant;
use Illuminate\Support\Str;
use App\Models\Organization;
use Illuminate\Http\Request;
use App\Jobs\SendRejectEmailJob;
use App\Models\EventFacilitator;
use App\Jobs\SendApprovedEmailJob;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Jobs\SendFacilitatorPasswordJob;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password as RulesPassword;
use App\Http\Controllers\Api\BaseController as BaseController;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $roles = Role::where(['is_archive' => 'false', 'Status' => 1])->where('id','!=',1)->orderBy('id', 'DESC')->get();
        return view('front.role.view', compact('roles'));
    }
    public function trash()
    {
        $roles = Role::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.role.trash', compact('roles'));
    }
    public function restore($id)
    {
        $roles_restore = Role::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $roles = Role::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.role.archive', compact('roles'));
    }
    public function toggleArchive($id)
    {
        $roles = Role::find($id);
        if ($roles->is_archive == 'true') {
            $roles->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $roles->is_archive = 'true';
            $mxg = "Archive";
        }
        $roles->save();
        return back()->with('success', 'Role ' . $mxg . ' Successfully');
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
                'role_name' => 'required|unique:roles,RoleName',
                'permissions' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $role = new Role;
            $role->RoleName = $request->role_name;
            $role->Permission = $request->permissions;
            $role->CreatedBy = Auth::user()->id;
            $role->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Role Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\role  $role
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $role_edit = Role::where('id', $request->id)->first();
        return view('front.role.add', compact('role_edit'));
    }
    public function showForm(Request $request)
    {
        return view('front.role.add');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Role $role)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'role_name' => 'required',
                'permissions' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $role_update = Role::find($id);
            $role_update->RoleName = $request->role_name;
            $role_update->Permission = $request->permissions;
            $role_update->UpdatedBy = Auth::user()->id;
            $role_update->save();
            
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('role.view')->with('success', 'Role Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\role  $role
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $role_delete = Role::find($id)->delete();
        return back()->with('success', 'Role Trash Successfully');
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
            $role_bulk_delete = Role::find($id)->delete();
        }
        return back()->with('success', 'Roles Deleted Successfully');
    }
}
