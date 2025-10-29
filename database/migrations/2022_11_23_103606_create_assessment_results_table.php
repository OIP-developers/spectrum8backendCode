<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAssessmentResultsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('assessment_results', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('EventID')->unsigned()->nullable(); 
            $table->integer('ParticipantID')->unsigned()->nullable(); 
            $table->integer('AssessmentID')->unsigned()->nullable(); 
            $table->integer('GradeID')->unsigned()->nullable(); 
            $table->integer('GenderID')->unsigned()->nullable(); 
            $table->integer('ColorID')->unsigned()->nullable(); 
            $table->string('Results',25)->nullable(); 
            $table->dateTime('DTRecorded')->nullable(); 
            $table->integer('Attempt')->nullable(); 
            $table->float('Percent')->nullable(); 
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('EventID')->references('id')->on('events')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('ParticipantID')->references('id')->on('participants')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('AssessmentID')->references('id')->on('assessments')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('GradeID')->references('id')->on('grades')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('GenderID')->references('id')->on('genders')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('ColorID')->references('id')->on('colors')->constrained()->cascadeOnDelete()->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('assessment_results');
    }
}
