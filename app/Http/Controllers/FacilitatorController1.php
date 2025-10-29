<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Jobs\SendEmailJob;
use Illuminate\Http\Request;
use App\Jobs\SendRejectEmailJob;
use App\Jobs\SendApprovedEmailJob;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password as RulesPassword;
use App\Http\Controllers\Api\BaseController as BaseController;

class FacilitatorController extends Controller
{
    public function index(Request $req)
    {
        $users = [4, 5];
        $facilitators = User::wherein('role_id', $users)->where(["CreatedBy" => Auth::user()->id, 'is_archive' => 'false', "is_approved" => 'true'])->with('facilitator_assisstant')->OrderBy('id', "DESC")->get();
        return view('front.facilitate.view', compact('facilitators'));
    }
    public function indexAdmin(Request $req)
    {
        $users = [4, 5];
        $facilitators = User::wherein('role_id', $users)->where(["is_approved" => 'false', 'is_archive' => 'false'])->with('facilitator_assisstant')->OrderBy('id', "DESC")->get();
        return view('front.facilitate.adminView', compact('facilitators'));
    }
    public function approved($id)
    {
        $facilitators = User::find($id);
        $facilitators->is_approved = "true";
        $facilitators->save();
        $facilitator_admin = User::where('id', $facilitators->CreatedBy)->first();
        $details = [
            'email' => $facilitator_admin->email,
            'facilitator_email' => $facilitators->email
        ];

        // $details['email'] = 'muhammad.hannan@oip.com.pk';

        dispatch(new SendApprovedEmailJob($details));

        return back()->with('success', 'Facilitator Approved Successfully');
    }
    public function reject($id)
    {
        $facilitators = User::find($id);
        $facilitators->delete();
        $facilitator_admin = User::where('id', $facilitators->CreatedBy)->first();
        $details = [
            'email' => $facilitator_admin->email,
            'facilitator_email' => $facilitators->email
        ];
        dispatch(new SendRejectEmailJob($details));

        return back()->with('success', 'Facilitator Rejected Successfully');
    }
    public function trash()
    {
        $facilitators = User::onlyTrashed()->where(['CreatedBy' => Auth::user()->id, 'is_approved' => 'true'])->get();
        return view('front.facilitate.trash', compact('facilitators'));
    }
    public function restore($id)
    {
        $facilitators_restore = User::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $facilitators = User::where('is_archive', 'true')->get();
        return view('front.facilitate.archive', compact('facilitators'));
    }
    public function toggleArchive($id)
    {
        $facilitators = User::find($id);
        if ($facilitators->is_archive == 'true') {
            $facilitators->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $facilitators->is_archive = 'true';
            $mxg = "Archive";
        }
        $facilitators->save();
        return back()->with('success', 'Facilitator ' . $mxg . ' Successfully');
    }
    public function add(Request $req)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($req->all(), [
                'name' => 'required|max:30',
                'email' => 'required|unique:users|email|max:100',
                'password' => 'required|min:8',
                'confirm_password' => 'required|same:password',
                "facilitator_id" => "required_if:type,==,assisstant"
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $facilitate = new User;
            $facilitate->name = $req->name;
            $facilitate->email = $req->email;
            $facilitate->password = Hash::make($req->password);
            if ($req->type == 'assisstant') {
                $facilitate->facilitator_id = $req->facilitator_id;
                $facilitate->role_id = 5;
            } else {
                $facilitate->role_id = 4;
            }
            $facilitate->CreatedBy = Auth::user()->id;
            $facilitate->save();

            $details = [
                'email' => 'muhammad.hannan@oip.com.pk',
                'facilitator_email' => Auth::user()->email,
                'approved_email' => $req->email
            ];

            // $details['email'] = 'muhammad.hannan@oip.com.pk';

            dispatch(new SendEmailJob($details));
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('facilitate.view')->with('success', 'Facilitator Add Successfully. Waiting for admin approval');
        //return back()->with('success','Facilitator Add Successfully');
    }
    public function facilitatorAssist()
    {
        $facilitator = User::where(['role_id' => 4, 'CreatedBy' => Auth::user()->id, 'is_approved' => 'true'])->get();
        return view('front.facilitate.add', compact('facilitator'));
    }
    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:100',
            'email' => 'required|email|max:100',
            'password' => 'required|min:8',
            'confirm_password' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $id = $request->id;
        $facilitate_edit = User::find($id);
        $facilitate_edit->name = $request->name;
        $facilitate_edit->email = $request->email;
        $facilitate_edit->password = Hash::make($request->password);
        $facilitate_edit->save();
        return redirect()->route('facilitate.view')->with('success', 'Facilitator Update Successfully');
    }
    public function edit(Request $request)
    {
        $facilitate_edit = User::where('id', $request->id)->first();
        $facilitator = User::where(['role_id' => 4, 'CreatedBy' => Auth::user()->id])->get();
        return view('front.facilitate.add', compact('facilitate_edit', 'facilitator'));
    }
    public function delete($id)
    {
        $facilitate_edit = User::find($id)->delete();
        return back()->with('success', 'Facilitator Trash Successfully');
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
            $facilitate_bulk_delete = User::find($id)->delete();
        }
        return back()->with('success', 'Facilitators Deleted Successfully');
    }
    public function logout(Request $request)
    {
        Auth::logout();
        return redirect('/login');
    }
}
