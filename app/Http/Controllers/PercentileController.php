<?php

namespace App\Http\Controllers;

use App\Models\Grade;
use App\Models\Assessment;
use App\Models\Percentile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class PercentileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $percentiles = Percentile::join('assessments','percentiles.assessment_id','=','assessments.id')
        // ->join('grades','percentiles.grade_id','=','grades.id')
        // ->select('assessments.Name as assessment','grades.name as grade','percentiles.*')
        // ->get();
        if (Auth::user()->id == 1) {
            $percentiles = Percentile::where('is_archive', 'false')->where("CreatedBy", Auth::user()->id)->with('assessment', 'grade')->orderBy('id', 'DESC')->get();
        } else {
            $complete_data = [Auth::user()->id, 1];
            $percentiles = Percentile::where('is_archive', 'false')->whereIn("CreatedBy", $complete_data)->with('assessment', 'grade')->orderBy('id', 'DESC')->get();
        }
        // dd($percentiles);
        return view('front.percentiles.view', compact('percentiles'));
    }

    public function trash()
    {
        $percentiles = Percentile::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.percentiles.trash', compact('percentiles'));
    }
    public function restore($id)
    {
        $percentiles_restore = Percentile::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $percentiles = Percentile::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.percentiles.archive', compact('percentiles'));
    }
    public function toggleArchive($id)
    {
        $percentiles = Percentile::find($id);
        if ($percentiles->is_archive == 'true') {
            $percentiles->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $percentiles->is_archive = 'true';
            $mxg = "Archive";
        }
        $percentiles->save();
        return back()->with('success', 'Percentile ' . $mxg . ' Successfully');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'assessment' => 'required',
            'grade' => 'required',
            'percent' => 'required',
            'gender' => 'required',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $percentiles = new Percentile;
        $percentiles->assessment_id = $request->assessment;
        $percentiles->grade_id = $request->grade;
        $percentiles->percent = $request->percent;
        $percentiles->CreatedBy = Auth::user()->id;
        if ($request->gender == 0) {
            $percentiles->gender = "Male";
        } elseif ($request->gender == 1) {
            $percentiles->gender = "Female";
        } else {
            $percentiles->gender = "Both";
        }
        $percentiles->save();
        return redirect()->route('percentile.view')->with('success', 'Percentile Add Successfully');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\percentile  $percentile
     * @return \Illuminate\Http\Response
     */
    public function show(percentile $percentile)
    {
        $assessments = Assessment::where("CreatedBy", Auth::user()->id)->where('status', 0)->orderBy('id', 'DESC')->get();
        $grades = Grade::where("CreatedBy", Auth::user()->id)->orderBy('id', 'DESC')->get();
        return view('front.percentiles.add', compact('assessments', 'grades'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\percentile  $percentile
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $assessments = Assessment::where("CreatedBy", Auth::user()->id)->where('status', 0)->orderBy('id', 'DESC')->get();
        $grades = Grade::where("CreatedBy", Auth::user()->id)->orderBy('id', 'DESC')->get();
        $percentiles_edit = Percentile::where('id', $request->id)->first();
        return view('front.percentiles.add', compact('percentiles_edit', 'assessments', 'grades'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\percentile  $percentile
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, percentile $percentile)
    {

        $validator = Validator::make($request->all(), [
            'assessment' => 'required',
            'grade' => 'required',
            'percent' => 'required',
            'gender' => 'required',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $id = $request->id;
        $percentiles_update = Percentile::find($id);
        $percentiles_update->assessment_id = $request->assessment;
        $percentiles_update->grade_id = $request->grade;
        $percentiles_update->percent = $request->percent;
        if ($request->gender == 0) {
            $percentiles_update->gender = "Male";
        } elseif ($request->gender == 1) {
            $percentiles_update->gender = "Female";
        } else {
            $percentiles_update->gender = "Both";
        }
        $percentiles_update->save();
        return redirect()->route('percentile.view')->with('success', 'Percentile Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\percentile  $percentile
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $percentiles_delete = Percentile::find($id)->delete();
        return back()->with('success', 'Percentile Trash Successfully');
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
            $percentile_bulk_delete = Percentile::find($id)->delete();
        }
        return back()->with('success', 'Percentiles Deleted Successfully');
    }
}
