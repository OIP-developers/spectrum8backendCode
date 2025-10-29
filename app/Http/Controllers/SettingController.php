<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class SettingController extends Controller
{
    public function index()
    {
        $logos = Setting::where(['is_archive' => 'false', 'Status' => 1])->OrderBy('id', 'desc')->first();
        return view('front.logo.view', compact('logos'));
    }
    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [

            'light_mode_logo' => 'image|mimes:jpeg,jpg,png',
            'dark_mode_logo' => 'image|mimes:jpeg,jpg,png',
            'video' => 'video',


        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $logo = new Setting;

        // $logo->logo = $request->logo;
        $logo->CreatedBy = Auth::user()->id;
        if ($request->hasFile('light_mode_logo')) {
            $files = $request->file('light_mode_logo');
            $image_name = md5(rand(1000, 10000));
            $file_with_ext = strtolower($files->getClientOriginalName());
            $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
            $ext = $files->getClientOriginalExtension();
            $image_full_name = $filename . '_' . time() . '.' . $ext;
            $path = $files->move(public_path('images/logo/'), $image_full_name);
            $logo->light_mode_logo = $image_full_name;
        }
        if ($request->hasFile('dark_mode_logo')) {
            $files = $request->file('dark_mode_logo');
            $image_name = md5(rand(1000, 10000));
            $file_with_ext = strtolower($files->getClientOriginalName());
            $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
            $ext = $files->getClientOriginalExtension();
            $image_full_name = $filename . '_' . time() . '.' . $ext;
            $path = $files->move(public_path('images/logo/'), $image_full_name);
            $logo->dark_mode_logo = $image_full_name;
        }
        if ($request->hasFile('video')) {
            $files = $request->file('video');
            $image_name = md5(rand(1000, 10000));
            $file_with_ext = strtolower($files->getClientOriginalName());
            $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
            $ext = $files->getClientOriginalExtension();
            $image_full_name = $filename . '_' . time() . '.' . $ext;
            $path = $files->move(public_path('images/logo/'), $image_full_name);
            $logo->video = $image_full_name;
        }

        $logo->save();
        return redirect()->route('logo.view')->with('success', 'Logo Add Successfully');
    }

    public function edit(Request $request)
    {
        $logo_edit = Setting::where('id', $request->id)->first();
        return view('front.logo.add', compact('logo_edit'));
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [

            'light_mode_logo' => 'image|mimes:jpeg,jpg,png',
            'dark_mode_logo' => 'image|mimes:jpeg,jpg,png',

        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $id = $request->id;
        $logo_update = Setting::find($id);
        $logo_update->UpdatedBy = Auth::user()->id;
        if (isset($logo_update)) {
            if ($request->hasFile('light_mode_logo')) {
                try {
                    if (file_exists(public_path('images/logo/' . $logo_update->light_mode_logo))) {
                        unlink(public_path('images/logo/' . $logo_update->light_mode_logo));
                    }
                } catch (\Exception $e) {
                    Log::info($e->getMessage());
                }
            }
            if ($request->hasFile('dark_mode_logo')) {
                try {
                    if (file_exists(public_path('images/logo/' . $logo_update->dark_mode_logo))) {
                        unlink(public_path('images/logo/' . $logo_update->dark_mode_logo));
                    }
                } catch (\Exception $e) {
                    Log::info($e->getMessage());
                }
            }
            if ($request->hasFile('video')) {
                try {
                    if (file_exists(public_path('images/logo/' . $logo_update->video))) {
                        unlink(public_path('images/logo/' . $logo_update->video));
                    }
                } catch (\Exception $e) {
                    Log::info($e->getMessage());
                }
            }
        }

        if ($request->hasFile('light_mode_logo')) {
            $files = $request->file('light_mode_logo');
            $image_name = md5(rand(1000, 10000));
            $file_with_ext = strtolower($files->getClientOriginalName());
            $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
            $ext = $files->getClientOriginalExtension();
            $image_full_name = $filename . '_' . time() . '.' . $ext;
            $path = $files->move(public_path('images/logo/'), $image_full_name);
            $logo_update->light_mode_logo = $image_full_name;
        }
        if ($request->hasFile('dark_mode_logo')) {
            $files = $request->file('dark_mode_logo');
            $image_name = md5(rand(1000, 10000));
            $file_with_ext = strtolower($files->getClientOriginalName());
            $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
            $ext = $files->getClientOriginalExtension();
            $image_full_name = $filename . '_' . time() . '.' . $ext;
            $path = $files->move(public_path('images/logo/'), $image_full_name);
            $logo_update->dark_mode_logo = $image_full_name;
        }
        if ($request->hasFile('video')) {
            $files = $request->file('video');
            $image_name = md5(rand(1000, 10000));
            $file_with_ext = strtolower($files->getClientOriginalName());
            $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
            $ext = $files->getClientOriginalExtension();
            $image_full_name = $filename . '_' . time() . '.' . $ext;
            $path = $files->move(public_path('images/logo/'), $image_full_name);
            $logo_update->video = $image_full_name;
        }


        $logo_update->save();
        return redirect()->route('logo.view')->with('success', 'Logo Updated Successfully');
    }

    public function delete($id)
    {
        $logo_delete = Setting::find($id);
        if (isset($logo_delete)) {
            try {
                if (file_exists(public_path("images/logo/" . $logo_delete->logo))) {
                    unlink(public_path("images/logo/" . $logo_delete->logo));
                }
            } catch (\Exception $e) {
                Log::info($e->getMessage());
            }

            Setting::where('id', $id)->delete();
            return back()->with('success', 'Logo Delete Successfully');
        } else {
            return back()->with('error', 'Record not found');
        }
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

        // $validator = Validator::make($request->all(), [
        //     'bulk_action' => 'required',
        // ]);
        // if ($validator->fails()) {
        //     return redirect()->back()->withInput()->withErrors($validator);
        // }
        foreach ($request->bulk_action as $id) {
            $logo_bulk_delete = Setting::find($id);
            if (isset($logo_bulk_delete)) {
                try {
                    if (file_exists(public_path("images/logo/" . $logo_bulk_delete->logo))) {
                        unlink(public_path("images/logo/" . $logo_bulk_delete->logo));
                    }
                } catch (\Exception $e) {
                    Log::info($e->getMessage());
                }

                Setting::where('id', $id)->delete();
                // return back()->with('success', 'Assessment Delete Successfully');
            }
            // else{
            //     return back()->with('error', 'Record not found');
            // }
        }
        return back()->with('success', 'Logos Deleted Successfully');
    }
}
