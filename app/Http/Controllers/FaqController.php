<?php

namespace App\Http\Controllers;

use App\Models\Faq;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class FaqController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $faq = Faq::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.faq.view', compact('faq'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'question' => 'required',
            'answer' => 'required',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $faq = new Faq;
        $faq->question = $request->question;
        $faq->answer = $request->answer;
        $faq->CreatedBy = Auth::user()->id;
        $faq->save();
        return redirect()->route('faq.view')->with('success', 'Faq Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Faq  $assessment
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $faqs_edit = Faq::where('id', $request->id)->first();
        return view('front.faq.add', compact('faqs_edit'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Faq  $assessment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Faq $assessment)
    {
        $validator = Validator::make($request->all(), [
            'question' => 'required',
            'answer' => 'required',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $id = $request->id;
        $faqs_update = Faq::find($id);
        $faqs_update->question = $request->question;
        $faqs_update->answer = $request->answer;
        $faqs_update->UpdatedBy = Auth::user()->id;
        $faqs_update->save();
        return redirect()->route('faq.view')->with('success', 'Faq Update Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Faq  $assessment
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $faq_delete = Faq::find($id)->delete();
        return back()->with('success', 'Faq Delete Successfully');
    }
}
