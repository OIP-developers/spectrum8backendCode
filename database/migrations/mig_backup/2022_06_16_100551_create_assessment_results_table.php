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
            $table->integer('assessment_score_id')->nullable();
            $table->integer('participant_id')->nullable();
            $table->integer('group_id')->nullable();
            $table->integer('grade_id')->nullable();
            $table->integer('assessment_id')->nullable();
            $table->string('Score')->nullable();
            $table->string('Duration')->nullable();
            $table->string('Distance')->nullable();
            $table->string('Beep')->nullable();
            $table->string('event_id')->nullable();
           $table->string('is_archive')->default('false');
            $table->integer('CreatedBy')->nullable(); 
            $table->timestamps();
            $table->softDeletes();
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
