<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParticipantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('participants', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('S8S_ID')->unsigned()->nullable(); 
            $table->string('Firstname',50)->nullable();
            $table->string('Lastname',50)->nullable();
            $table->integer('GenderID')->unsigned()->nullable(); 
            $table->integer('GradeID')->unsigned()->nullable(); 
            $table->integer('OrganizationID')->unsigned()->nullable(); 
            $table->integer('FacilitatorID')->unsigned()->nullable(); 
            $table->integer('ClassID')->unsigned()->nullable(); 
            $table->integer('Age')->nullable(); 
            $table->integer('ParticipantTypeID')->unsigned()->nullable(); 
            $table->string('JerseyNumber',10)->nullable(); 
            $table->integer('JerseyColorID')->unsigned()->nullable(); 
            $table->tinyInteger('IsFacilitator')->nullable(); 
            $table->tinyInteger('IsActive')->nullable(); 
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('S8S_ID')->references('id')->on('users')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('GenderID')->references('id')->on('genders')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('GradeID')->references('id')->on('grades')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('OrganizationID')->references('id')->on('organizations')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('FacilitatorID')->references('id')->on('facilitators')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('ClassID')->references('id')->on('classes')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('JerseyColorID')->references('id')->on('colors')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('ParticipantTypeID')->references('id')->on('participant_types')->constrained()->cascadeOnDelete()->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('participants');
    }
}
