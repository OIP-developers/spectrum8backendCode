<?php

namespace App\Http\Controllers;

use App\Models\Color;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ColorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $colors = Color::where(['is_archive' => 'false', 'Status' => 1])->OrderBy('id','DESC')->get();
        return view('front.color.view', compact('colors'));
    }
    public function trash()
    {
        $colors = Color::onlyTrashed()->get();
        return view('front.color.trash', compact('colors'));
    }
    public function restore($id)
    {
        $colors_restore = Color::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $colors = Color::where('is_archive', 'true')->get();
        return view('front.color.archive', compact('colors'));
    }
    public function toggleArchive($id)
    {
        $colors = Color::find($id);
        if ($colors->is_archive == 'true') {
            $colors->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $colors->is_archive = 'true';
            $mxg = "Archive";
        }
        $colors->save();
        return back()->with('success', 'Color ' . $mxg . ' Successfully');
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
                'name' => 'required|max:15|',
                'desc' => 'required|max:150',
                'sort' => 'required|max:11',
                'code' => 'required|max:10',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $color = new Color;
            $color->Name = $request->name;
            $color->Information = $request->desc;
            $color->Sort = $request->sort;
            $color->WebColor = $request->code;
            $color->CreatedBy = Auth::user()->id;
            $color->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Color Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Color  $color
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $color_edit = Color::where('id', $request->id)->first();
        return view('front.color.add', compact('color_edit'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Color  $color
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Color $color)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:15|',
                'desc' => 'required|max:150',
                'sort' => 'required|max:11',
                'code' => 'required|max:10',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $color_update = Color::find($id);
            $color_update->Name = $request->name;
            $color_update->Information = $request->desc;
            $color_update->Sort = $request->sort;
            $color_update->WebColor = $request->code;
            $color->UpdatedBy = Auth::user()->id;
            $color_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('color.view')->with('success', 'Color Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Color  $color
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $color_delete = Color::find($id)->delete();
        return back()->with('success', 'Color Trash Successfully');
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
            $color_bulk_delete = Color::find($id)->delete();
        }
        return back()->with('success', 'Colors Deleted Successfully');
    }
}
