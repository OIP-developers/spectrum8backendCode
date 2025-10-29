<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventAssessmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_assessments', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('EventID')->unsigned()->nullable(); 
            $table->integer('AssessmentID')->unsigned()->nullable(); 
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('EventID')->references('id')->on('events')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('AssessmentID')->references('id')->on('assessments')->constrained()->cascadeOnDelete()->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_assessments');
    }
}
