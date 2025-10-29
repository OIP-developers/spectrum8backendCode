<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFacilitatorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('facilitators', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('S8S_ID')->unsigned()->nullable(); 
            $table->integer('OrganizationID')->unsigned()->nullable(); 
            $table->string('OrgAdmin')->nullable(); 
            $table->tinyInteger('IsActive')->nullable(); 
            $table->tinyInteger('ManageParticipants')->nullable(); 
            $table->string('Firstname',50)->nullable();
            $table->string('Lastname',50)->nullable();
            $table->string('Email',255)->nullable();
            $table->string('Password');
            $table->boolean('show_video')->default(true);
            $table->timestamp('EmailVerifiedOn')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->rememberToken();
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('OrganizationID')->references('id')->on('organizations')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('S8S_ID')->references('id')->on('users')->constrained()->cascadeOnDelete()->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('facilitators');
    }
}
