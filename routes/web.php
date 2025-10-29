<?php

use App\Http\Middleware\IsAdmin;
use App\Models\AssessmentResults;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FaqController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ColorController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\GradeController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\GenderController;
use App\Http\Controllers\ClassesController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\licenseController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\EmailTypeController;
use App\Http\Controllers\EventTypeController;
use App\Http\Controllers\NintyFiveController;
use App\Http\Controllers\AssessmentController;
use App\Http\Controllers\GroupClassController;
use App\Http\Controllers\GroupGradeController;
use App\Http\Controllers\PercentileController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\ContactTypeController;
use App\Http\Controllers\FacilitatorController;
use App\Http\Controllers\GroupGenderController;
use App\Http\Controllers\licenseTypeController;
use App\Http\Controllers\ParticipantController;
use App\Http\Controllers\OrganizationController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\EventCatagoryController;
use App\Http\Controllers\AssessmentTypeController;
use App\Http\Controllers\EventAssessmentController;
use App\Http\Controllers\ParticipantTypeController;
use App\Http\Controllers\FacilitatorClassController;
use App\Http\Controllers\GroupFacilitatorController;
use App\Http\Controllers\OrganizationTypeController;
use App\Http\Controllers\ParticipantEmailController;
use App\Http\Controllers\AssessmentResultsController;
use App\Http\Controllers\AssessmentScoringController;
use App\Http\Controllers\GroupOrganizationController;
use App\Http\Controllers\AssessmentEvaluateController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// Route::get('/', function () {
//     return view('auth.login');
// });
Route::get('/', function () {
  return redirect('/login');
});

Route::get('admin/home', [HomeController::class, 'adminHome'])->name('admin.home')->middleware('is_admin');
Route::view('/register', 'auth.register')->name('organization_show');
Route::post('/submitRegisteration', [RegisterController::class, 'OrganizationRegister'])->name('organization_register');

Route::middleware('is_admin')->group(function () {

  Route::view('/dashboard', 'front.dashboard')->name('dashboard');

  // role
  Route::get('/role', [RoleController::class, 'index'])->name('role.view');
  Route::get('/role/admin', [RoleController::class, 'indexAdmin'])->name('role.view.admin');
  Route::get('/role/add', [RoleController::class, 'showForm'])->name('role.form');
  Route::get('/role/trash', [RoleController::class, 'trash'])->name('role.trash');
  Route::get('/role/restore/{id}', [RoleController::class, 'restore'])->name('role.restore');
  Route::get('/role/archive/{id}', [RoleController::class, 'toggleArchive'])->name('role.toggle.archive');
  Route::get('/role/archive', [RoleController::class, 'archive'])->name('role.archive');
  Route::post('/add/role', [RoleController::class, 'add'])->name('role.add');
  Route::get('/role/edit/{id}', [RoleController::class, 'edit'])->name('role.edit');
  Route::post('/update/role', [RoleController::class, 'update'])->name('role.update');
  Route::get('/role/delete/{id}', [RoleController::class, 'delete'])->name('role.delete');
  Route::get('/role/approved/{id}', [RoleController::class, 'approved'])->name('role.approved');
  Route::get('/role/reject/{id}', [RoleController::class, 'reject'])->name('role.reject');
  Route::get('/role/bulk', [RoleController::class, 'bulkDelete'])->name('role.bulk_delete');
  Route::get('/role/find_event', [RoleController::class, 'find_event'])->name('role.find_event');
  // role

  // facilitator
  Route::get('/facilitator', [FacilitatorController::class, 'index'])->name('facilitator.view');
  Route::get('/facilitator/admin', [FacilitatorController::class, 'indexAdmin'])->name('facilitator.view.admin');
  Route::get('/facilitator/add', [FacilitatorController::class, 'showForm'])->name('facilitator.form');
  Route::get('/facilitator/trash', [FacilitatorController::class, 'trash'])->name('facilitator.trash');
  Route::get('/facilitator/restore/{id}', [FacilitatorController::class, 'restore'])->name('facilitator.restore');
  Route::get('/facilitator/archive/{id}', [FacilitatorController::class, 'toggleArchive'])->name('facilitator.toggle.archive');
  Route::get('/facilitator/archive', [FacilitatorController::class, 'archive'])->name('facilitator.archive');
  Route::post('/add/facilitator', [FacilitatorController::class, 'add'])->name('facilitator.add');
  Route::get('/facilitator/edit/{id}', [FacilitatorController::class, 'edit'])->name('facilitator.edit');
  Route::post('/update/facilitator', [FacilitatorController::class, 'update'])->name('facilitator.update');
  Route::get('/facilitator/delete/{id}', [FacilitatorController::class, 'delete'])->name('facilitator.delete');
  Route::get('/facilitator/approved/{id}', [FacilitatorController::class, 'approved'])->name('facilitator.approved');
  Route::get('/facilitator/reject/{id}', [FacilitatorController::class, 'reject'])->name('facilitator.reject');
  Route::get('/facilitator/bulk', [FacilitatorController::class, 'bulkDelete'])->name('facilitator.bulk_delete');
  Route::get('/facilitator/find_event', [FacilitatorController::class, 'find_event'])->name('facilitator.find_event');
  // facilitator

  // assessments
  Route::get('/assessment', [AssessmentController::class, 'index'])->name('assessment.view');
  Route::get('/assessment/trash', [AssessmentController::class, 'trash'])->name('assessment.trash');
  Route::get('/assessment/restore/{id}', [AssessmentController::class, 'restore'])->name('assessment.restore');
  Route::get('/assessment/archive/{id}', [AssessmentController::class, 'toggleArchive'])->name('assessment.toggle.archive');
  Route::get('/assessment/archive', [AssessmentController::class, 'archive'])->name('assessment.archive');
  Route::get('/assessment/add', [AssessmentController::class, 'showForm'])->name('assessment.form');
  Route::post('/add/assessment', [AssessmentController::class, 'add'])->name('assessment.add');
  Route::get('/assessment/edit/{id}', [AssessmentController::class, 'edit'])->name('assessment.edit');
  Route::post('/update/assessment', [AssessmentController::class, 'update'])->name('assessment.update');
  Route::get('/assessment/delete/{id}', [AssessmentController::class, 'delete'])->name('assessment.delete');
  Route::get('/assessment/bulk', [AssessmentController::class, 'bulkDelete'])->name('assessment.bulk_delete');
  Route::get('/assessment/status', [AssessmentController::class, 'status'])->name('change_status_assessment');

  Route::get('/assessment/instruction/add', [AssessmentController::class, 'instruction_form'])->name('instruction.form');
  Route::get('/assessment/instruction', [AssessmentController::class, 'instruction_index'])->name('instruction.view');

  Route::get('/instruction/trash', [AssessmentController::class, 'instructiontrash'])->name('instruction.trash');
  Route::get('/instruction/restore/{id}', [AssessmentController::class, 'instructionrestore'])->name('instruction.restore');
  Route::get('/instruction/archive/{id}', [AssessmentController::class, 'instructionToggleArchive'])->name('instruction.toggle.archive');
  Route::get('/instruction/archive', [AssessmentController::class, 'instructionArchive'])->name('instruction.archive');

  Route::post('/assessment/instruction/submit', [AssessmentController::class, 'instruction_add'])->name('instruction.add');
  Route::get('/instruction/edit/{id}', [AssessmentController::class, 'instruction_edit'])->name('instruction.edit');
  Route::post('/update/instruction', [AssessmentController::class, 'instruction_update'])->name('instruction.update');
  Route::get('/instruction/delete/{id}', [AssessmentController::class, 'instruction_delete'])->name('instruction.delete');
  Route::get('/instruction/bulk', [AssessmentController::class, 'instruction_bulkDelete'])->name('instruction.bulk_delete');
  // assessments

  // assessment_type
  Route::get('/assessment_type', [AssessmentTypeController::class, 'index'])->name('assessment_type.view');
  Route::get('/assessment_type/trash', [AssessmentTypeController::class, 'trash'])->name('assessment_type.trash');
  Route::get('/assessment_type/restore/{id}', [AssessmentTypeController::class, 'restore'])->name('assessment_type.restore');
  Route::get('/assessment_type/archive/{id}', [AssessmentTypeController::class, 'toggleArchive'])->name('assessment_type.toggle.archive');
  Route::get('/assessment_type/archive', [AssessmentTypeController::class, 'archive'])->name('assessment_type.archive');
  Route::view('/assessment_type/add', 'front.assessment_type.add')->name('assessment_type.form');
  Route::post('/add/assessment_type', [AssessmentTypeController::class, 'add'])->name('assessment_type.add');
  Route::get('/assessment_type/edit/{id}', [AssessmentTypeController::class, 'edit'])->name('assessment_type.edit');
  Route::post('/update/assessment_type', [AssessmentTypeController::class, 'update'])->name('assessment_type.update');
  Route::get('/assessment_type/delete/{id}', [AssessmentTypeController::class, 'delete'])->name('assessment_type.delete');
  Route::get('/assessment_type/bulk', [AssessmentTypeController::class, 'bulkDelete'])->name('assessment_type.bulk_delete');
  Route::get('/assessment_type/status', [AssessmentTypeController::class, 'status'])->name('change_status_assessment_type');

  // assessment_type

  // assessment_evaluate
  Route::get('/assessment_evaluate', [AssessmentEvaluateController::class, 'index'])->name('assessment_evaluate.view');
  Route::get('/assessment_evaluate/trash', [AssessmentEvaluateController::class, 'trash'])->name('assessment_evaluate.trash');
  Route::get('/assessment_evaluate/restore/{id}', [AssessmentEvaluateController::class, 'restore'])->name('assessment_evaluate.restore');
  Route::get('/assessment_evaluate/archive/{id}', [AssessmentEvaluateController::class, 'toggleArchive'])->name('assessment_evaluate.toggle.archive');
  Route::get('/assessment_evaluate/archive', [AssessmentEvaluateController::class, 'archive'])->name('assessment_evaluate.archive');
  Route::get('/assessment_evaluate/add', [AssessmentEvaluateController::class, 'showForm'])->name('assessment_evaluate.form');
  Route::post('/add/assessment_evaluate', [AssessmentEvaluateController::class, 'add'])->name('assessment_evaluate.add');
  Route::get('/assessment_evaluate/edit/{id}', [AssessmentEvaluateController::class, 'edit'])->name('assessment_evaluate.edit');
  Route::post('/update/assessment_evaluate', [AssessmentEvaluateController::class, 'update'])->name('assessment_evaluate.update');
  Route::get('/assessment_evaluate/delete/{id}', [AssessmentEvaluateController::class, 'delete'])->name('assessment_evaluate.delete');
  Route::get('/assessment_evaluate/bulk', [AssessmentEvaluateController::class, 'bulkDelete'])->name('assessment_evaluate.bulk_delete');
  Route::get('/assessment_evaluate/status', [AssessmentEvaluateController::class, 'status'])->name('change_status_assessment_evaluate');

  // assessment_evaluate

  // contact_type
  Route::get('/contact_type', [ContactTypeController::class, 'index'])->name('contact_type.view');
  Route::get('/contact_type/trash', [ContactTypeController::class, 'trash'])->name('contact_type.trash');
  Route::get('/contact_type/restore/{id}', [ContactTypeController::class, 'restore'])->name('contact_type.restore');
  Route::get('/contact_type/archive/{id}', [ContactTypeController::class, 'toggleArchive'])->name('contact_type.toggle.archive');
  Route::get('/contact_type/archive', [ContactTypeController::class, 'archive'])->name('contact_type.archive');
  Route::view('/contact_type/add', 'front.contact_type.add')->name('contact_type.form');
  Route::post('/add/contact_type', [ContactTypeController::class, 'add'])->name('contact_type.add');
  Route::get('/contact_type/edit/{id}', [ContactTypeController::class, 'edit'])->name('contact_type.edit');
  Route::post('/update/contact_type', [ContactTypeController::class, 'update'])->name('contact_type.update');
  Route::get('/contact_type/delete/{id}', [ContactTypeController::class, 'delete'])->name('contact_type.delete');
  Route::get('/contact_type/bulk', [ContactTypeController::class, 'bulkDelete'])->name('contact_type.bulk_delete');
  Route::get('/contact_type/status', [ContactTypeController::class, 'status'])->name('change_status_contact_type');

  // contact_type

  // contact
  Route::get('/contact', [ContactController::class, 'index'])->name('contact.view');
  Route::get('/contact/trash', [ContactController::class, 'trash'])->name('contact.trash');
  Route::get('/contact/restore/{id}', [ContactController::class, 'restore'])->name('contact.restore');
  Route::get('/contact/archive/{id}', [ContactController::class, 'toggleArchive'])->name('contact.toggle.archive');
  Route::get('/contact/archive', [ContactController::class, 'archive'])->name('contact.archive');
  Route::get('/contact/add', [ContactController::class, 'showForm'])->name('contact.form');
  Route::post('/add/contact', [ContactController::class, 'add'])->name('contact.add');
  Route::get('/contact/edit/{id}', [ContactController::class, 'edit'])->name('contact.edit');
  Route::post('/update/contact', [ContactController::class, 'update'])->name('contact.update');
  Route::get('/contact/delete/{id}', [ContactController::class, 'delete'])->name('contact.delete');
  Route::get('/contact/bulk', [ContactController::class, 'bulkDelete'])->name('contact.bulk_delete');
  Route::get('/contact/status', [ContactController::class, 'status'])->name('change_status_contact');

  // contact

  // users
  Route::get('/users', [UserController::class, 'index'])->name('users.view');
  Route::get('/users/trash', [UserController::class, 'trash'])->name('users.trash');
  Route::get('/users/restore/{id}', [UserController::class, 'restore'])->name('users.restore');
  Route::get('/users/archive/{id}', [UserController::class, 'toggleArchive'])->name('users.toggle.archive');
  Route::get('/users/archive', [UserController::class, 'archive'])->name('users.archive');
  Route::get('/users/add', [UserController::class, 'showForm'])->name('users.form');
  Route::post('/add/users', [UserController::class, 'add'])->name('users.add');
  Route::get('/users/edit/{id}', [UserController::class, 'edit'])->name('users.edit');
  Route::post('/update/users', [UserController::class, 'update'])->name('users.update');
  Route::get('/users/delete/{id}', [UserController::class, 'delete'])->name('users.delete');
  Route::get('/users/bulk', [UserController::class, 'bulkDelete'])->name('users.bulk_delete');
  Route::get('/users/status', [UserController::class, 'status'])->name('change_status_user');

  // users

  // event_type
  Route::get('/event_type', [EventTypeController::class, 'index'])->name('event_type.view');
  Route::get('/event_type/trash', [EventTypeController::class, 'trash'])->name('event_type.trash');
  Route::get('/event_type/restore/{id}', [EventTypeController::class, 'restore'])->name('event_type.restore');
  Route::get('/event_type/archive/{id}', [EventTypeController::class, 'toggleArchive'])->name('event_type.toggle.archive');
  Route::get('/event_type/archive', [EventTypeController::class, 'archive'])->name('event_type.archive');
  Route::get('/event_type/add', [EventTypeController::class, 'showForm'])->name('event_type.form');
  Route::post('/add/event_type', [EventTypeController::class, 'add'])->name('event_type.add');
  Route::get('/event_type/edit/{id}', [EventTypeController::class, 'edit'])->name('event_type.edit');
  Route::post('/update/event_type', [EventTypeController::class, 'update'])->name('event_type.update');
  Route::get('/event_type/delete/{id}', [EventTypeController::class, 'delete'])->name('event_type.delete');
  Route::get('/event_type/bulk', [EventTypeController::class, 'bulkDelete'])->name('event_type.bulk_delete');
  Route::get('/event_type/status', [EventTypeController::class, 'status'])->name('change_status_event_type');

  // event_type

  // organization_type
  Route::get('/organization_type', [OrganizationTypeController::class, 'index'])->name('organization_type.view');
  Route::get('/organization_type/trash', [OrganizationTypeController::class, 'trash'])->name('organization_type.trash');
  Route::get('/organization_type/restore/{id}', [OrganizationTypeController::class, 'restore'])->name('organization_type.restore');
  Route::get('/organization_type/archive/{id}', [OrganizationTypeController::class, 'toggleArchive'])->name('organization_type.toggle.archive');
  Route::get('/organization_type/archive', [OrganizationTypeController::class, 'archive'])->name('organization_type.archive');
  Route::view('/organization_type/add', 'front.organization_type.add')->name('organization_type.form');
  Route::post('/add/organization_type', [OrganizationTypeController::class, 'add'])->name('organization_type.add');
  Route::get('/organization_type/edit/{id}', [OrganizationTypeController::class, 'edit'])->name('organization_type.edit');
  Route::post('/update/organization_type', [OrganizationTypeController::class, 'update'])->name('organization_type.update');
  Route::get('/organization_type/delete/{id}', [OrganizationTypeController::class, 'delete'])->name('organization_type.delete');
  Route::get('/organization_type/bulk', [OrganizationTypeController::class, 'bulkDelete'])->name('organization_type.bulk_delete');
  Route::get('/organization_type/status', [OrganizationTypeController::class, 'status'])->name('change_status_organization_type');

  // organization_type

  // email_type
  Route::get('/email_type', [EmailTypeController::class, 'index'])->name('email_type.view');
  Route::get('/email_type/trash', [EmailTypeController::class, 'trash'])->name('email_type.trash');
  Route::get('/email_type/restore/{id}', [EmailTypeController::class, 'restore'])->name('email_type.restore');
  Route::get('/email_type/archive/{id}', [EmailTypeController::class, 'toggleArchive'])->name('email_type.toggle.archive');
  Route::get('/email_type/archive', [EmailTypeController::class, 'archive'])->name('email_type.archive');
  Route::view('/email_type/add', 'front.email_type.add')->name('email_type.form');
  Route::post('/add/email_type', [EmailTypeController::class, 'add'])->name('email_type.add');
  Route::get('/email_type/edit/{id}', [EmailTypeController::class, 'edit'])->name('email_type.edit');
  Route::post('/update/email_type', [EmailTypeController::class, 'update'])->name('email_type.update');
  Route::get('/email_type/delete/{id}', [EmailTypeController::class, 'delete'])->name('email_type.delete');
  Route::get('/email_type/bulk', [EmailTypeController::class, 'bulkDelete'])->name('email_type.bulk_delete');
  Route::get('/email_type/status', [EmailTypeController::class, 'status'])->name('change_status_email_type');

  // email_type

  // ninty_five
  Route::get('/ninty_five', [NintyFiveController::class, 'index'])->name('ninty_five.view');
  Route::get('/ninty_five/trash', [NintyFiveController::class, 'trash'])->name('ninty_five.trash');
  Route::get('/ninty_five/restore/{assessment_id}/{gender_id}/{grade_id}', [NintyFiveController::class, 'restore'])->name('ninty_five.restore');
  Route::get('/ninty_five/archive/{assessment_id}/{gender_id}/{grade_id}', [NintyFiveController::class, 'toggleArchive'])->name('ninty_five.toggle.archive');
  Route::get('/ninty_five/archive', [NintyFiveController::class, 'archive'])->name('ninty_five.archive');
  Route::get('/ninty_five/add', [NintyFiveController::class, 'showForm'])->name('ninty_five.form');
  Route::post('/add/ninty_five', [NintyFiveController::class, 'add'])->name('ninty_five.add');
  Route::get('/ninty_five/edit/{assessment_id}/{gender_id}/{grade_id}', [NintyFiveController::class, 'edit'])->name('ninty_five.edit');
  Route::post('/update/ninty_five', [NintyFiveController::class, 'update'])->name('ninty_five.update');
  Route::get('/ninty_five/delete/{assessment_id}/{gender_id}/{grade_id}', [NintyFiveController::class, 'delete'])->name('ninty_five.delete');
  Route::get('/ninty_five/bulk', [NintyFiveController::class, 'bulkDelete'])->name('ninty_five.bulk_delete');
  Route::get('/ninty_five/status', [NintyFiveController::class, 'status'])->name('change_status_ninty_five');

  // ninty_five

  // gender
  Route::get('/gender', [GenderController::class, 'index'])->name('gender.view');
  Route::get('/gender/trash', [GenderController::class, 'trash'])->name('gender.trash');
  Route::get('/gender/restore/{id}', [GenderController::class, 'restore'])->name('gender.restore');
  Route::get('/gender/archive/{id}', [GenderController::class, 'toggleArchive'])->name('gender.toggle.archive');
  Route::get('/gender/archive', [GenderController::class, 'archive'])->name('gender.archive');
  Route::view('/gender/add', 'front.gender.add')->name('gender.form');
  Route::post('/add/gender', [GenderController::class, 'add'])->name('gender.add');
  Route::get('/gender/edit/{id}', [GenderController::class, 'edit'])->name('gender.edit');
  Route::post('/update/gender', [GenderController::class, 'update'])->name('gender.update');
  Route::get('/gender/delete/{id}', [GenderController::class, 'delete'])->name('gender.delete');
  Route::get('/gender/bulk', [GenderController::class, 'bulkDelete'])->name('gender.bulk_delete');
  Route::get('/gender/status', [GenderController::class, 'status'])->name('change_status_gender');

  // gender

  // colors
  Route::get('/colors', [ColorController::class, 'index'])->name('color.view');
  Route::view('/colors/add', 'front.color.add')->name('color.form');
  Route::get('/colors/trash', [ColorController::class, 'trash'])->name('color.trash');
  Route::get('/colors/restore/{id}', [ColorController::class, 'restore'])->name('color.restore');
  Route::get('/colors/archive/{id}', [ColorController::class, 'toggleArchive'])->name('color.toggle.archive');
  Route::get('/colors/archive', [ColorController::class, 'archive'])->name('color.archive');
  Route::post('/add/color', [ColorController::class, 'add'])->name('color.add');
  Route::get('/color/edit/{id}', [ColorController::class, 'edit'])->name('color.edit');
  Route::post('/update/color', [ColorController::class, 'update'])->name('color.update');
  Route::get('/color/delete/{id}', [ColorController::class, 'delete'])->name('color.delete');
  Route::get('/color/bulk', [ColorController::class, 'bulkDelete'])->name('color.bulk_delete');
  // colors
 
  // license_type
  Route::get('/license_type', [licenseTypeController::class, 'index'])->name('license_type.view');
  Route::view('/license_type/add', 'front.license_type.add')->name('license_type.form');
  Route::get('/license_type/trash', [licenseTypeController::class, 'trash'])->name('license_type.trash');
  Route::get('/license_type/restore/{id}', [licenseTypeController::class, 'restore'])->name('license_type.restore');
  Route::get('/license_type/archive/{id}', [licenseTypeController::class, 'toggleArchive'])->name('license_type.toggle.archive');
  Route::get('/license_type/archive', [licenseTypeController::class, 'archive'])->name('license_type.archive');
  Route::post('/add/license_type', [licenseTypeController::class, 'add'])->name('license_type.add');
  Route::get('/license_type/edit/{id}', [licenseTypeController::class, 'edit'])->name('license_type.edit');
  Route::post('/update/license_type', [licenseTypeController::class, 'update'])->name('license_type.update');
  Route::get('/license_type/delete/{id}', [licenseTypeController::class, 'delete'])->name('license_type.delete');
  Route::get('/license_type/bulk', [licenseTypeController::class, 'bulkDelete'])->name('license_type.bulk_delete');
  // license_type
   
  // license
  Route::get('/license', [licenseController::class, 'index'])->name('license.view');
  Route::get('/find_duration', [licenseController::class, 'find_duration'])->name('license.find_duration');
  Route::get('/license/add', [licenseController::class, 'showForm'])->name('license.form');
  Route::get('/license/trash', [licenseController::class, 'trash'])->name('license.trash');
  Route::get('/license/restore/{id}', [licenseController::class, 'restore'])->name('license.restore');
  Route::get('/license/archive/{id}', [licenseController::class, 'toggleArchive'])->name('license.toggle.archive');
  Route::get('/license/archive', [licenseController::class, 'archive'])->name('license.archive');
  Route::post('/add/license', [licenseController::class, 'add'])->name('license.add');
  Route::get('/license/edit/{id}', [licenseController::class, 'edit'])->name('license.edit');
  Route::post('/update/license', [licenseController::class, 'update'])->name('license.update');
  Route::get('/license/delete/{id}', [licenseController::class, 'delete'])->name('license.delete');
  Route::get('/license/bulk', [licenseController::class, 'bulkDelete'])->name('license.bulk_delete');
  // license

  // facilitator_class
  Route::get('/facilitator_class', [FacilitatorClassController::class, 'index'])->name('facilitator_class.view');
  Route::get('/facilitator_class/add', [FacilitatorClassController::class, 'showForm'])->name('facilitator_class.form');
  Route::get('/facilitator_class/trash', [FacilitatorClassController::class, 'trash'])->name('facilitator_class.trash');
  Route::get('/facilitator_class/restore/{id}', [FacilitatorClassController::class, 'restore'])->name('facilitator_class.restore');
  Route::get('/facilitator_class/archive/{id}', [FacilitatorClassController::class, 'toggleArchive'])->name('facilitator_class.toggle.archive');
  Route::get('/facilitator_class/archive', [FacilitatorClassController::class, 'archive'])->name('facilitator_class.archive');
  Route::post('/add/facilitator_class', [FacilitatorClassController::class, 'add'])->name('facilitator_class.add');
  Route::get('/facilitator_class/edit/{id}', [FacilitatorClassController::class, 'edit'])->name('facilitator_class.edit');
  Route::post('/update/facilitator_class', [FacilitatorClassController::class, 'update'])->name('facilitator_class.update');
  Route::get('/facilitator_class/delete/{id}', [FacilitatorClassController::class, 'delete'])->name('facilitator_class.delete');
  Route::get('/facilitator_class/bulk', [FacilitatorClassController::class, 'bulkDelete'])->name('facilitator_class.bulk_delete');
  // facilitator_class

  // class
  Route::get('/class', [ClassesController::class, 'index'])->name('class.view');
  Route::get('/class/add', [ClassesController::class, 'showForm'])->name('class.form');
  Route::get('/class/trash', [ClassesController::class, 'trash'])->name('class.trash');
  Route::get('/class/restore/{id}', [ClassesController::class, 'restore'])->name('class.restore');
  Route::get('/class/archive/{id}', [ClassesController::class, 'toggleArchive'])->name('class.toggle.archive');
  Route::get('/class/archive', [ClassesController::class, 'archive'])->name('class.archive');
  Route::post('/class_add', [ClassesController::class, 'add'])->name('class.add');
  Route::get('/class/edit/{id}', [ClassesController::class, 'edit'])->name('class.edit');
  Route::post('/update/class', [ClassesController::class, 'update'])->name('class.update');
  Route::get('/class/delete/{id}', [ClassesController::class, 'delete'])->name('class.delete');
  Route::get('/class/bulk', [ClassesController::class, 'bulkDelete'])->name('class.bulk_delete');
  // class

  // groups
  Route::get('/group', [GroupController::class, 'index'])->name('group.view');
  Route::get('/group/find_facilitator', [GroupController::class, 'find_facilitator'])->name('group.find_facilitator');
  Route::get('/group/add', [GroupController::class, 'formShow'])->name('group.form');
  Route::get('/group/trash', [GroupController::class, 'trash'])->name('group.trash');
  Route::get('/group/restore/{id}', [GroupController::class, 'restore'])->name('group.restore');
  Route::get('/group/archive/{id}', [GroupController::class, 'toggleArchive'])->name('group.toggle.archive');
  Route::get('/group/archive', [GroupController::class, 'archive'])->name('group.archive');
  Route::post('/add/group', [GroupController::class, 'add'])->name('group.add');
  Route::get('/group/edit/{id}', [GroupController::class, 'edit'])->name('group.edit');
  Route::post('/update/group', [GroupController::class, 'update'])->name('group.update');
  Route::get('/group/delete/{id}', [GroupController::class, 'delete'])->name('group.delete');
  Route::get('/group/status', [GroupController::class, 'status'])->name('change_status_groups');
  Route::get('/group/bulk', [GroupController::class, 'bulkDelete'])->name('group.bulk_delete');

  // groups

  // group_organization

  Route::get('/group_organization', [GroupOrganizationController::class, 'index'])->name('group_organization.view');
  Route::get('/group_organization/add', [GroupOrganizationController::class, 'showForm'])->name('group_organization.form');
  Route::get('/group_organization/trash', [GroupOrganizationController::class, 'trash'])->name('group_organization.trash');
  Route::get('/group_organization/restore/{id}', [GroupOrganizationController::class, 'restore'])->name('group_organization.restore');
  Route::get('/group_organization/archive/{id}', [GroupOrganizationController::class, 'toggleArchive'])->name('group_organization.toggle.archive');
  Route::get('/group_organization/archive', [GroupOrganizationController::class, 'archive'])->name('group_organization.archive');
  Route::post('/add/group_organization', [GroupOrganizationController::class, 'add'])->name('group_organization.add');
  Route::get('/group_organization/edit/{id}', [GroupOrganizationController::class, 'edit'])->name('group_organization.edit');
  Route::post('/update/group_organization', [GroupOrganizationController::class, 'update'])->name('group_organization.update');
  Route::get('/group_organization/delete/{id}', [GroupOrganizationController::class, 'delete'])->name('group_organization.delete');
  Route::get('/group_organization/status', [GroupOrganizationController::class, 'status'])->name('change_status_group_organization');
  Route::get('/group_organization/bulk', [GroupOrganizationController::class, 'bulkDelete'])->name('group_organization.bulk_delete');

  // group_organization

  // group_facilitator

  Route::get('/group_facilitator', [GroupFacilitatorController::class, 'index'])->name('group_facilitator.view');
  Route::get('/group_facilitator/add', [GroupFacilitatorController::class, 'showForm'])->name('group_facilitator.form');
  Route::get('/group_facilitator/trash', [GroupFacilitatorController::class, 'trash'])->name('group_facilitator.trash');
  Route::get('/group_facilitator/restore/{id}', [GroupFacilitatorController::class, 'restore'])->name('group_facilitator.restore');
  Route::get('/group_facilitator/archive/{id}', [GroupFacilitatorController::class, 'toggleArchive'])->name('group_facilitator.toggle.archive');
  Route::get('/group_facilitator/archive', [GroupFacilitatorController::class, 'archive'])->name('group_facilitator.archive');
  Route::post('/add/group_facilitator', [GroupFacilitatorController::class, 'add'])->name('group_facilitator.add');
  Route::get('/group_facilitator/edit/{id}', [GroupFacilitatorController::class, 'edit'])->name('group_facilitator.edit');
  Route::post('/update/group_facilitator', [GroupFacilitatorController::class, 'update'])->name('group_facilitator.update');
  Route::get('/group_facilitator/delete/{id}', [GroupFacilitatorController::class, 'delete'])->name('group_facilitator.delete');
  Route::get('/group_facilitator/status', [GroupFacilitatorController::class, 'status'])->name('change_status_group_facilitator');
  Route::get('/group_facilitator/bulk', [GroupFacilitatorController::class, 'bulkDelete'])->name('group_facilitator.bulk_delete');

  // group_facilitator

  // group_gender

  Route::get('/group_gender', [GroupGenderController::class, 'index'])->name('group_gender.view');
  Route::get('/group_gender/add', [GroupGenderController::class, 'showForm'])->name('group_gender.form');
  Route::get('/group_gender/trash', [GroupGenderController::class, 'trash'])->name('group_gender.trash');
  Route::get('/group_gender/restore/{id}', [GroupGenderController::class, 'restore'])->name('group_gender.restore');
  Route::get('/group_gender/archive/{id}', [GroupGenderController::class, 'toggleArchive'])->name('group_gender.toggle.archive');
  Route::get('/group_gender/archive', [GroupGenderController::class, 'archive'])->name('group_gender.archive');
  Route::post('/add/group_gender', [GroupGenderController::class, 'add'])->name('group_gender.add');
  Route::get('/group_gender/edit/{id}', [GroupGenderController::class, 'edit'])->name('group_gender.edit');
  Route::post('/update/group_gender', [GroupGenderController::class, 'update'])->name('group_gender.update');
  Route::get('/group_gender/delete/{id}', [GroupGenderController::class, 'delete'])->name('group_gender.delete');
  Route::get('/group_gender/status', [GroupGenderController::class, 'status'])->name('change_status_group_gender');
  Route::get('/group_gender/bulk', [GroupGenderController::class, 'bulkDelete'])->name('group_gender.bulk_delete');

  // group_gender

  // group_grade

  Route::get('/group_grade', [GroupGradeController::class, 'index'])->name('group_grade.view');
  Route::get('/group_grade/add', [GroupGradeController::class, 'showForm'])->name('group_grade.form');
  Route::get('/group_grade/trash', [GroupGradeController::class, 'trash'])->name('group_grade.trash');
  Route::get('/group_grade/restore/{id}', [GroupGradeController::class, 'restore'])->name('group_grade.restore');
  Route::get('/group_grade/archive/{id}', [GroupGradeController::class, 'toggleArchive'])->name('group_grade.toggle.archive');
  Route::get('/group_grade/archive', [GroupGradeController::class, 'archive'])->name('group_grade.archive');
  Route::post('/add/group_grade', [GroupGradeController::class, 'add'])->name('group_grade.add');
  Route::get('/group_grade/edit/{id}', [GroupGradeController::class, 'edit'])->name('group_grade.edit');
  Route::post('/update/group_grade', [GroupGradeController::class, 'update'])->name('group_grade.update');
  Route::get('/group_grade/delete/{id}', [GroupGradeController::class, 'delete'])->name('group_grade.delete');
  Route::get('/group_grade/status', [GroupGradeController::class, 'status'])->name('change_status_group_grade');
  Route::get('/group_grade/bulk', [GroupGradeController::class, 'bulkDelete'])->name('group_grade.bulk_delete');

  // group_grade


  // group_class

  Route::get('/group_class', [GroupClassController::class, 'index'])->name('group_class.view');
  Route::get('/group_class/add', [GroupClassController::class, 'showForm'])->name('group_class.form');
  Route::get('/group_class/trash', [GroupClassController::class, 'trash'])->name('group_class.trash');
  Route::get('/group_class/restore/{id}', [GroupClassController::class, 'restore'])->name('group_class.restore');
  Route::get('/group_class/archive/{id}', [GroupClassController::class, 'toggleArchive'])->name('group_class.toggle.archive');
  Route::get('/group_class/archive', [GroupClassController::class, 'archive'])->name('group_class.archive');
  Route::post('/add/group_class', [GroupClassController::class, 'add'])->name('group_class.add');
  Route::get('/group_class/edit/{id}', [GroupClassController::class, 'edit'])->name('group_class.edit');
  Route::post('/update/group_class', [GroupClassController::class, 'update'])->name('group_class.update');
  Route::get('/group_class/delete/{id}', [GroupClassController::class, 'delete'])->name('group_class.delete');
  Route::get('/group_class/status', [GroupClassController::class, 'status'])->name('change_status_group_class');
  Route::get('/group_class/bulk', [GroupClassController::class, 'bulkDelete'])->name('group_class.bulk_delete');

  // group_class

  // grades
  Route::get('/grade', [GradeController::class, 'index'])->name('grade.view');
  Route::get('/grade/add', [GradeController::class, 'showForm'])->name('grade.form');
  Route::get('/grade/trash', [GradeController::class, 'trash'])->name('grade.trash');
  Route::get('/grade/restore/{id}', [GradeController::class, 'restore'])->name('grade.restore');
  Route::get('/grade/archive/{id}', [GradeController::class, 'toggleArchive'])->name('grade.toggle.archive');
  Route::get('/grade/archive', [GradeController::class, 'archive'])->name('grade.archive');
  Route::post('/add/grade', [GradeController::class, 'add'])->name('grade.add');
  Route::get('/grade/edit/{id}', [GradeController::class, 'edit'])->name('grade.edit');
  Route::post('/update/grade', [GradeController::class, 'update'])->name('grade.update');
  Route::get('/grade/delete/{id}', [GradeController::class, 'delete'])->name('grade.delete');
  Route::get('/grade/bulk', [GradeController::class, 'bulkDelete'])->name('grade.bulk_delete');

  // grades

  // events
  Route::get('/event', [EventController::class, 'index'])->name('event.view');
  Route::get('/event/add', [EventController::class, 'showForm'])->name('event.form');
  // Route::view('/event/add','front.events.add')->name('event.form');
  Route::get('/event/trash', [EventController::class, 'trash'])->name('event.trash');
  Route::get('/event/restore/{id}', [EventController::class, 'restore'])->name('event.restore');
  Route::get('/event/archive/{id}', [EventController::class, 'toggleArchive'])->name('event.toggle.archive');
  Route::get('/event/archive', [EventController::class, 'archive'])->name('event.archive');
  Route::post('/add/event', [EventController::class, 'add'])->name('event.add');
  Route::get('/event/edit/{id}', [EventController::class, 'edit'])->name('event.edit');
  Route::post('/update/event', [EventController::class, 'update'])->name('event.update');
  Route::get('/event/delete/{id}', [EventController::class, 'delete'])->name('event.delete');
  Route::get('/event/bulk', [EventController::class, 'bulkDelete'])->name('event.bulk_delete');
  Route::get('/event/status', [EventController::class, 'status'])->name('change_status_event');
  // event

  // event_assessment

  Route::get('/event_assessment', [EventAssessmentController::class, 'index'])->name('event_assessment.view');
  Route::get('/event_assessment/add', [EventAssessmentController::class, 'showForm'])->name('event_assessment.form');
  Route::get('/event_assessment/trash', [EventAssessmentController::class, 'trash'])->name('event_assessment.trash');
  Route::get('/event_assessment/restore/{id}', [EventAssessmentController::class, 'restore'])->name('event_assessment.restore');
  Route::get('/event_assessment/archive/{id}', [EventAssessmentController::class, 'toggleArchive'])->name('event_assessment.toggle.archive');
  Route::get('/event_assessment/archive', [EventAssessmentController::class, 'archive'])->name('event_assessment.archive');
  Route::post('/add/event_assessment', [EventAssessmentController::class, 'add'])->name('event_assessment.add');
  Route::get('/event_assessment/edit/{id}', [EventAssessmentController::class, 'edit'])->name('event_assessment.edit');
  Route::post('/update/event_assessment', [EventAssessmentController::class, 'update'])->name('event_assessment.update');
  Route::get('/event_assessment/delete/{id}', [EventAssessmentController::class, 'delete'])->name('event_assessment.delete');
  Route::get('/event_assessment/status', [EventAssessmentController::class, 'status'])->name('change_status_event_assessment');
  Route::get('/event_assessment/bulk', [EventAssessmentController::class, 'bulkDelete'])->name('event_assessment.bulk_delete');

  // event_assessment


  // event_catagory
  Route::get('/event_catagory', [EventCatagoryController::class, 'index'])->name('event_catagory.view');
  Route::view('/event_catagory/add', 'front.event_catagory.add')->name('event_catagory.form');
  Route::get('/event_catagory/trash', [EventCatagoryController::class, 'trash'])->name('event_catagory.trash');
  Route::get('/event_catagory/restore/{id}', [EventCatagoryController::class, 'restore'])->name('event_catagory.restore');
  Route::get('/event_catagory/archive/{id}', [EventCatagoryController::class, 'toggleArchive'])->name('event_catagory.toggle.archive');
  Route::get('/event_catagory/archive', [EventCatagoryController::class, 'archive'])->name('event_catagory.archive');
  Route::post('/add/event_catagory', [EventCatagoryController::class, 'add'])->name('event_catagory.add');
  Route::get('/event_catagory/edit/{id}', [EventCatagoryController::class, 'edit'])->name('event_catagory.edit');
  Route::post('/update/event_catagory', [EventCatagoryController::class, 'update'])->name('event_catagory.update');
  Route::get('/event_catagory/delete/{id}', [EventCatagoryController::class, 'delete'])->name('event_catagory.delete');
  Route::get('/event_catagory/bulk', [EventCatagoryController::class, 'bulkDelete'])->name('event_catagory.bulk_delete');
  Route::get('/event_catagory/status', [EventCatagoryController::class, 'status'])->name('change_status_event_catagory');
  // event_catagory

  // participant_type
  Route::get('/participant_type', [ParticipantTypeController::class, 'index'])->name('participant_type.view');
  Route::get('/participant_type/add', [ParticipantTypeController::class, 'showForm'])->name('participant_type.form');
  Route::get('/participant_type/trash', [ParticipantTypeController::class, 'trash'])->name('participant_type.trash');
  Route::get('/participant_type/restore/{id}', [ParticipantTypeController::class, 'restore'])->name('participant_type.restore');
  Route::get('/participant_type/archive/{id}', [ParticipantTypeController::class, 'toggleArchive'])->name('participant_type.toggle.archive');
  Route::get('/participant_type/archive', [ParticipantTypeController::class, 'archive'])->name('participant_type.archive');
  Route::post('/participant_type/class', [ParticipantTypeController::class, 'add'])->name('participant_type.add');
  Route::get('/participant_type/edit/{id}', [ParticipantTypeController::class, 'edit'])->name('participant_type.edit');
  Route::post('/participant_type/class/update', [ParticipantTypeController::class, 'update'])->name('participant_type.update');
  Route::get('/participant_type/delete/{id}', [ParticipantTypeController::class, 'delete'])->name('participant_type.delete');
  Route::get('/participant_type/bulk', [ParticipantTypeController::class, 'bulkDelete'])->name('participant_type.bulk_delete');
  // participant_type
  
  // participant_email
  Route::get('/participant_email', [ParticipantEmailController::class, 'index'])->name('participant_email.view');
  Route::get('/participant_email/add', [ParticipantEmailController::class, 'showForm'])->name('participant_email.form');
  Route::get('/participant_email/trash', [ParticipantEmailController::class, 'trash'])->name('participant_email.trash');
  Route::get('/participant_email/restore/{id}', [ParticipantEmailController::class, 'restore'])->name('participant_email.restore');
  Route::get('/participant_email/archive/{id}', [ParticipantEmailController::class, 'toggleArchive'])->name('participant_email.toggle.archive');
  Route::get('/participant_email/archive', [ParticipantEmailController::class, 'archive'])->name('participant_email.archive');
  Route::post('/participant_email/class', [ParticipantEmailController::class, 'add'])->name('participant_email.add');
  Route::get('/participant_email/edit/{id}', [ParticipantEmailController::class, 'edit'])->name('participant_email.edit');
  Route::post('/participant_email/class/update', [ParticipantEmailController::class, 'update'])->name('participant_email.update');
  Route::get('/participant_email/delete/{id}', [ParticipantEmailController::class, 'delete'])->name('participant_email.delete');
  Route::get('/participant_email/bulk', [ParticipantEmailController::class, 'bulkDelete'])->name('participant_email.bulk_delete');
  // participant_email

  // participants
  Route::get('/participant', [ParticipantController::class, 'index'])->name('participant.view');
  Route::get('/participant/add', [ParticipantController::class, 'showForm'])->name('participant.form');
  Route::get('/participant/assign', [ParticipantController::class, 'assign'])->name('participant.assign');
  Route::post('/participant/assign', [ParticipantController::class, 'assigning'])->name('participant.assign.post');
  Route::get('/participant/find_facilitator', [ParticipantController::class, 'find_facilitator'])->name('participant.find_facilitator');
  Route::get('/participant/trash', [ParticipantController::class, 'trash'])->name('participant.trash');
  Route::get('/participant/restore/{id}', [ParticipantController::class, 'restore'])->name('participant.restore');
  Route::get('/participant/archive/{id}', [ParticipantController::class, 'toggleArchive'])->name('participant.toggle.archive');
  Route::get('/participant/archive', [ParticipantController::class, 'archive'])->name('participant.archive');
  Route::post('/add/participant', [ParticipantController::class, 'add'])->name('participant.add');
  Route::get('/participant/edit/{id}', [ParticipantController::class, 'edit'])->name('participant.edit');
  Route::post('/update/participant', [ParticipantController::class, 'update'])->name('participant.update');
  Route::get('/participant/delete/{id}', [ParticipantController::class, 'delete'])->name('participant.delete');
  Route::get('/participant/bulk', [ParticipantController::class, 'bulkDelete'])->name('participant.bulk_delete');
  Route::get('/participant/status', [ParticipantController::class, 'status'])->name('change_status_participants');

  Route::get('/participant/importParticipant', [ParticipantController::class, 'importParticipant'])->name('participant.importParticipant');
  Route::post('import-excel-csv-file', [ParticipantController::class, 'importExcelCSV'])->name('import_participant');
  // participants

  // percentile
  Route::get('/percentile', [PercentileController::class, 'index'])->name('percentile.view');
  Route::get('/percentile/add', [PercentileController::class, 'show'])->name('percentile.form');
  Route::get('/percentile/trash', [PercentileController::class, 'trash'])->name('percentile.trash');
  Route::get('/percentile/restore/{id}', [PercentileController::class, 'restore'])->name('percentile.restore');
  Route::get('/percentile/archive/{id}', [PercentileController::class, 'toggleArchive'])->name('percentile.toggle.archive');
  Route::get('/percentile/archive', [PercentileController::class, 'archive'])->name('percentile.archive');
  Route::post('/add/percentile', [PercentileController::class, 'add'])->name('percentile.add');
  Route::get('/percentile/edit/{id}', [PercentileController::class, 'edit'])->name('percentile.edit');
  Route::post('/update/percentile', [PercentileController::class, 'update'])->name('percentile.update');
  Route::get('/percentile/delete/{id}', [PercentileController::class, 'delete'])->name('percentile.delete');
  Route::get('/percentile/bulk', [PercentileController::class, 'bulkDelete'])->name('percentile.bulk_delete');
  // percentile

  // faq
  Route::get('/faq', [FaqController::class, 'index'])->name('faq.view');
  Route::view('/faq/add', 'front.faq.add')->name('faq.form');
  Route::post('/add/faq', [FaqController::class, 'add'])->name('faq.add');
  Route::get('/faq/edit/{id}', [FaqController::class, 'edit'])->name('faq.edit');
  Route::post('/update/faq', [FaqController::class, 'update'])->name('faq.update');
  Route::get('/faq/delete/{id}', [FaqController::class, 'delete'])->name('faq.delete');
  Route::get('/faq/bulk', [FaqController::class, 'bulkDelete'])->name('faq.bulk_delete');
  // faq

  // organization
  Route::get('/organization', [OrganizationController::class, 'index'])->name('organization.view');
  Route::get('/organization/add', [OrganizationController::class, 'showForm'])->name('organization.form');
  Route::get('/organization/trash', [OrganizationController::class, 'trash'])->name('organization.trash');
  Route::get('/organization/restore/{id}', [OrganizationController::class, 'restore'])->name('organization.restore');
  Route::get('/organization/archive', [OrganizationController::class, 'archive'])->name('organization.archive');
  Route::get('/organization/archive/{id}', [OrganizationController::class, 'toggleArchive'])->name('organization.toggle.archive');
  //  Route::view('/organization/add','front.organizations.add')->name('organization.form');
  Route::post('/add/organization', [OrganizationController::class, 'add'])->name('organization.add');
  Route::get('/organization/edit/{id}', [OrganizationController::class, 'edit'])->name('organization.edit');
  Route::post('/update/organization', [OrganizationController::class, 'update'])->name('organization.update');
  Route::get('/organization/delete/{id}', [OrganizationController::class, 'delete'])->name('organization.delete');
  Route::get('/organization/bulk', [OrganizationController::class, 'bulkDelete'])->name('organization.bulk_delete');
  Route::get('/organization/assessments/{id}', [OrganizationController::class, 'orgAssessment'])->name('organization.assessments');
  Route::get('/organization/suborganization/{id}', [OrganizationController::class, 'orgSubOrg'])->name('organization.subOrganizaion');
  Route::get('/organization/assessment/status', [OrganizationController::class, 'orgAssessmentStatus'])->name('change_status_organization_assessments');
  // organization

  // // sub organization
  //  Route::get('/suborg',[OrganizationController::class,'index'])->name('suborg.view');
  //  Route::view('/suborg/add','front.sub_organizations.add')->name('suborg.form');
  //  Route::post('/add/suborg',[OrganizationController::class,'add'])->name('suborg.add');
  //  Route::get('/suborg/edit/{id}',[OrganizationController::class,'edit'])->name('suborg.edit');
  //  Route::post('/update/suborg',[OrganizationController::class,'update'])->name('suborg.update');
  //  Route::get('/suborg/delete/{id}',[OrganizationController::class,'delete'])->name('suborg.delete');
  //  Route::get('/suborg/bulk',[OrganizationController::class,'bulkDelete'])->name('suborg.bulk_delete');
  //  // sub organization

  // scoring
  Route::get('/scoring', [AssessmentScoringController::class, 'index'])->name('scoring.view');
  Route::get('/scoring/add', [AssessmentScoringController::class, 'add_form'])->name('scoring.form');
  Route::get('/scoring/trash', [AssessmentScoringController::class, 'trash'])->name('scoring.trash');
  Route::get('/scoring/restore/{id}', [AssessmentScoringController::class, 'restore'])->name('scoring.restore');
  Route::get('/scoring/archive/{id}', [AssessmentScoringController::class, 'toggleArchive'])->name('scoring.toggle.archive');
  Route::get('/scoring/archive', [AssessmentScoringController::class, 'archive'])->name('scoring.archive');
  Route::post('/add/scoring', [AssessmentScoringController::class, 'add'])->name('scoring.add');
  Route::get('/scoring/edit/{id}', [AssessmentScoringController::class, 'edit'])->name('scoring.edit');
  Route::post('/update/scoring', [AssessmentScoringController::class, 'update'])->name('scoring.update');
  Route::get('/scoring/delete/{id}', [AssessmentScoringController::class, 'delete'])->name('scoring.delete');
  Route::get('/scoring/bulk', [AssessmentScoringController::class, 'bulkDelete'])->name('scoring.bulk_delete');
  Route::get('/getAssessmentType', [AssessmentController::class, 'getAssessmentType'])->name('getAssessmentType');
  // scoring
  Route::get('/assessment_result', [AssessmentResultsController::class, 'index'])->name('result.view');
  Route::get('/assessment_result/trash', [AssessmentResultsController::class, 'trash'])->name('result.trash');
  Route::get('/assessment_result/archive/{id}', [AssessmentResultsController::class, 'toggleArchive'])->name('result.toggle.archive');
  Route::get('/assessment_result/restore/{id}', [AssessmentResultsController::class, 'restore'])->name('result.restore');
  Route::get('/assessment_result/archive', [AssessmentResultsController::class, 'archive'])->name('result.archive');
  Route::get('/assessment_result/delete/{id}', [AssessmentResultsController::class, 'delete'])->name('result.delete');
  Route::get('/assessment_result/bulk', [AssessmentResultsController::class, 'bulkDelete'])->name('result.bulk_delete');
  Route::get('/assessment_result/filter', [AssessmentResultsController::class, 'filterResult'])->name('filter_result');

  Route::get('/export', [AssessmentResultsController::class, 'export'])->name('export');
  Route::get('importExportView', [AssessmentResultsController::class, 'importExportView']);
  Route::post('import', [AssessmentResultsController::class, 'import'])->name('import');


  Route::get('/getGroups', [GroupController::class, 'getGroups'])->name('getGroups');
  Route::get('/getGender', [ParticipantController::class, 'getGender'])->name('getGender');

  // Archive Data
  // Route::get('/archieve/result',[AssessmentResultsController::class,'resultArchieve'])->name('result.archieve');
  // Route::get('/archieve/facilitator',[FacilitatorController::class,'facilitatorArchieve'])->name('facilitator.archieve');
  // Route::get('/archieve/participant',[ParticipantController::class,'participantArchieve'])->name('participant.archieve');

  //Route::get('/logo',[SettingController::class,'getGender'])->name('getGender');
  Route::get('/logo', [SettingController::class, 'index'])->name('logo.view');
  Route::view('/logo/add', 'front.logo.add')->name('logo.form');
  Route::post('/update/logo', [SettingController::class, 'update'])->name('logo.update');

  Route::post('/add/logo', [SettingController::class, 'add'])->name('logo.add');
  Route::get('/logo/edit/{id}', [SettingController::class, 'edit'])->name('logo.edit');
  Route::get('/logo/delete/{id}', [SettingController::class, 'delete'])->name('logo.delete');
  Route::get('/logo/bulk', [SettingController::class, 'bulkDelete'])->name('logo.bulk_delete');
});


Route::get('/logout', [FacilitatorController::class, 'logout'])->name('logout.session');
Route::get('/updateadmin', [ProfileController::class, 'updateadmin'])->name('updateadmin');
Route::post('/updatedadmin', [ProfileController::class, 'updatedadmin'])->name('admin.update');

Auth::routes();
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
