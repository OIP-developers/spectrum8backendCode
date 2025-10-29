<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\GradeController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\RegisterController;
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\ParticipanteController;
use App\Http\Controllers\Api\SettingController;
use App\Http\Controllers\HomeController;


//use Illuminate\Support\Str;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('register', [RegisterController::class, 'register']);
Route::post('/login', [RegisterController::class, 'login']);

Route::post('/check',[DashboardController::class,'test']);




// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::any('request_otp', [RegisterController::class, 'requestOtp']);
Route::post('verify_otp', [RegisterController::class, 'verifyOtp']);

Route::post('forgot-password', [RegisterController::class, 'forgotPassword']);
Route::any('reset-password', [RegisterController::class, 'reset_password']);

Route::middleware('auth:sanctum')->group( function () {
    // change password
    Route::post('password-change', [ProfileController::class, 'change_password']);
    Route::post('get-fcm-token', [ProfileController::class, 'saveToken']);
    Route::post('notification-firebase', [ProfileController::class, 'sendNotification']);
    // start profile API's
    Route::get('profile/{id}',[ProfileController::class,'index']);
    Route::post('update/{id}',[ProfileController::class,'update']);
    Route::post('profile-store',[ProfileController::class,'store']);
    // end profile API's

//notifaction firebase
    // Route::post('get-fcm-token', [ProfileController::class, 'saveToken']);
    // Route::post('notification-firebase', [ProfileController::class, 'sendNotification']);
    // start assessment API's

    Route::get('/assessment',[DashboardController::class,'index']);
    Route::get('/assessment/{id}',[DashboardController::class,'show']);
    // Route::post('/assessment/add',[DashboardController::class,'store']);
    // Route::put('/assessment/update/{id}',[DashboardController::class,'update']);
    // Route::delete('/assessment/del/{id}',[DashboardController::class,'destroy']);

    Route::post('/addAssessmentScore',[DashboardController::class,'addAssessmentScore']);
    // end assessment API's

    // assessment score get API's
    Route::get('/assessmentscore',[DashboardController::class,'AssessmentScoreGet']);
    Route::get('/assessmentscore/assesst_id/{id}',[DashboardController::class,'AssessmentIdScore']);
    // assessment score get API's

     // assessment result get API's

     Route::get('/facilitator/instruction/',[DashboardController::class,'instruction_get']);
     // assessment result get API's

    // Group API's

    Route::get('/grade',[DashboardController::class,'gradeData']);
    Route::get('/group',[DashboardController::class,'groupData']);
    Route::get('/color',[DashboardController::class,'colorData']);
    // End  Group API's


    // Start Participant API's

    Route::post('/participant',[ParticipanteController::class,'store']);
    Route::post('/get-participant',[ParticipanteController::class,'getParticipant']);
    Route::post('/participant/show',[ParticipanteController::class,'ParticipantIndex']);
    Route::get('/participant/data',[ParticipanteController::class,'ParticipantData']);

    // End Participant API's
    Route::get('/assessments/test',[ParticipanteController::class,'Assessment_test']);
    Route::post('/participants/filter',[ParticipanteController::class,'ParticipantFilter']);


    Route::post('/assessmentresult/add',[DashboardController::class,'AssessmentResultPost']);
    Route::get('/assessmentresult',[DashboardController::class,'AssessmentResultGet']);



});
Route::post('/participantCount',[DashboardController::class,'participantCount']);
Route::post('/score_result',[DashboardController::class,'score_result']);
Route::post('/participant_status',[ParticipanteController::class,'participant_status']);
Route::get('/event',[DashboardController::class,'eventData']);
Route::post('/percentile',[DashboardController::class,'percentileData']);
Route::get('/faqs',[DashboardController::class,'faqData']);
Route::get('/logo',[SettingController::class,'index']);
