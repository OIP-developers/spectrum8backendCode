<?php

namespace App\Http\Controllers\Api;

use App\Models\Faq;

use App\Models\IsWatch;
use App\Models\Setting;
use App\Models\Facilitator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Api\BaseController as BaseController;

class SettingController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    //  Assessment Functions


    public function index(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'device_id' => 'required',
            ]);
            if ($validator->fails()) {
                return $this->sendError('Validation Error.', $validator->errors(), 400);
            }
            $device = IsWatch::where('device_id', $request->device_id)->first();
            $logo = Setting::where(['is_archive' => 'false', 'Status' => 1])->first();
            if (isset($logo)) {
                if (!isset($device)) {
                    $new_device = new IsWatch;
                    $new_device->device_id = $request->device_id;
                    $new_device->save();

                    $device = IsWatch::where('device_id', $new_device->device_id)->first();
                }
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
            $res = [$logo,$device];
        } catch (\Exception $ex) {
            DB::rollback();
            return response()->json(['success' => false, 'message' => $ex->getMessage()], 500);
        }
        DB::commit();
        return $this->sendResponse($res, 'Data Fetched successfully.', 200);
    }

    public function faqData()
    {
        try {
            $faq = Faq::where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$faq->isEmpty()) {
                return $this->sendResponse($faq, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function tutorialWatch(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'device_id' => 'required',
                'is_watch' => 'required',
            ]);
            if ($validator->fails()) {
                return $this->sendError('Validation Error.', $validator->errors(), 400);
            }
            $find_device = IsWatch::where('device_id', $request->device_id)->first();
            if (isset($find_device)) {
                $find_device->is_watch = $request->is_watch;
                $find_device->save();
                $res = IsWatch::where("id",$find_device->id)->first();
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $ex) {
            DB::rollback();
            return response()->json(['success' => false, 'message' => $ex->getMessage()], 500);
        }
        DB::commit();
        return $this->sendResponse($res, 'Tutorial Watch Successfully .', 200);
    }




    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
}
