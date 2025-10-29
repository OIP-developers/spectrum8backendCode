<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\GradeController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\RegisterController;
use App\Http\Controllers\Api\ApiDashboardController;
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

Route::any('request_otp', [RegisterController::class, 'requestOtp']);
Route::post('verify_otp', [RegisterController::class, 'verifyOtp']);

Route::post('forgot-password', [RegisterController::class, 'forgotPassword']);
Route::any('reset-password', [RegisterController::class, 'reset_password']);

// faq and logo API's

Route::post('/tutorial_watch', [SettingController::class, 'tutorialWatch']);
Route::get('/faqs', [SettingController::class, 'faqData']);
Route::post('/logo', [SettingController::class, 'index']);

// faq and logo API's

Route::middleware('auth:sanctum')->group(function () {

    // device logins API's
    Route::get('/license_valid', [ApiDashboardController::class, 'license_valid']);
    Route::get('/login_devices', [ApiDashboardController::class, 'login_devices']);
    Route::post('/login_count', [ApiDashboardController::class, 'login_count']);
    Route::post('/device_info', [ApiDashboardController::class, 'device_info']);
    Route::post('/remove_device', [ApiDashboardController::class, 'remove_device']);
    // device logins API's

    // Lookups API's

    Route::get('/grade', [ApiDashboardController::class, 'grades']);
    Route::get('/color', [ApiDashboardController::class, 'color']);
    Route::get('/email_type', [ApiDashboardController::class, 'email_type']);
    Route::get('/class', [ApiDashboardController::class, 'class']);
    Route::get('/assessment_type', [ApiDashboardController::class, 'assessment_type']);
    Route::get('/ninty_five', [ApiDashboardController::class, 'ninty_five']);
    Route::get('/ninty_five/data', [ApiDashboardController::class, 'ninty_five_specific']);
    Route::get('/organization_type', [ApiDashboardController::class, 'organization_type']);
    Route::get('/assessment', [ApiDashboardController::class, 'assessment']);
    Route::get('/assessment/{id}', [ApiDashboardController::class, 'assessmentById']);
    Route::get('/assessment_evaluate', [ApiDashboardController::class, 'assessment_evaluate']);
    Route::get('/gender', [ApiDashboardController::class, 'gender']);
    Route::get('/contact', [ApiDashboardController::class, 'contact']);
    Route::get('/contact_type', [ApiDashboardController::class, 'contact_type']);
    Route::get('/event_catagory', [ApiDashboardController::class, 'event_catagory']);
    Route::get('/event_type', [ApiDashboardController::class, 'event_type']);

    // Lookups API's

    // Event Assessment Fetch API's

    Route::get('/event_assessment_fetch', [ApiDashboardController::class, 'EventAssessmentFetch']);

    // Event Assessment Fetch API's

    // Organization API's

    Route::get('/organization', [ApiDashboardController::class, 'organization']);

    // Organization API's

    // Facilitator API's

    Route::get('/facilitator', [ApiDashboardController::class, 'facilitator']);
    Route::get('/facilitator_class', [ApiDashboardController::class, 'facilitator_class']);

    // Facilitator API's

    // Participant API's

    Route::post('/participant', [ApiDashboardController::class, 'participant']);
    Route::get('/participant_email', [ApiDashboardController::class, 'participant_email']);
    Route::get('/participant/{id}', [ApiDashboardController::class, 'ParticipantByID']);
    Route::get('/assessment_results_participant/{id}', [ApiDashboardController::class, 'AssessmentResultByPID']);
    Route::post('/participant_status', [ApiDashboardController::class, 'participant_status']);

    // Participant API's

    // Event API's

    Route::get('/event', [ApiDashboardController::class, 'event']);
    Route::get('/event_assessment', [ApiDashboardController::class, 'event_assessment']);

    // Event API's

    // Assessment Result API's

    Route::post('/assessmentresult/add', [ApiDashboardController::class, 'assessment_result_post']);
    Route::get('/assessmentresult', [ApiDashboardController::class, 'assessment_result']);

    // Assessment Result API's

    // Group API's

    Route::get('/group', [ApiDashboardController::class, 'group']);
    Route::get('/group_filter/{id}', [ApiDashboardController::class, 'group_filter']);
    Route::get('/group_organization', [ApiDashboardController::class, 'group_organization']);
    Route::get('/group_facilitator', [ApiDashboardController::class, 'group_facilitator']);
    Route::get('/group_gender', [ApiDashboardController::class, 'group_gender']);
    Route::get('/group_grade', [ApiDashboardController::class, 'group_grade']);
    Route::get('/group_class', [ApiDashboardController::class, 'group_class']);

    // Group API's



    // change password
    Route::post('password-change', [ProfileController::class, 'change_password']);
    Route::post('get-fcm-token', [ProfileController::class, 'saveToken']);
    Route::post('notification-firebase', [ProfileController::class, 'sendNotification']);
    // start profile API's
    Route::get('profile/{id}', [ProfileController::class, 'index']);
    Route::post('update/{id}', [ProfileController::class, 'update']);
    Route::post('profile-store', [ProfileController::class, 'store']);
    // end profile API's

    //notifaction firebase
    // Route::post('get-fcm-token', [ProfileController::class, 'saveToken']);
    // Route::post('notification-firebase', [ProfileController::class, 'sendNotification']);


    // assessment score get API's
    // Route::get('/assessmentscore',[ApiDashboardController::class,'AssessmentScoreGet']);
    // Route::get('/assessmentscore/assesst_id/{id}',[ApiDashboardController::class,'AssessmentIdScore']);
    // assessment score get API's
    // Route::post('/participants/filter',[ParticipanteController::class,'ParticipantFilter']);





});
Route::post('/participantCount', [ApiDashboardController::class, 'participantCount']);
Route::post('/score_result', [ApiDashboardController::class, 'score_result']);
// Route::get('/event',[ApiDashboardController::class,'eventData']);
Route::post('/percentile', [ApiDashboardController::class, 'percentileData']);
