<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAssessmentScoringsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('assessment_scorings', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('assessment_id')->nullable();
            $table->integer('color_id')->nullable();
            $table->string('MinValue')->nullable();
            $table->string('MaxValue')->nullable();
            $table->time('Duration')->nullable();
            $table->string('Beep')->nullable();
            $table->string('Distance')->nullable();
            $table->string('image')->nullable();
            $table->enum('Score_target', ['Duration', 'Distance','Beep']);
            $table->string('minTime')->default('0');
            $table->string('maxTime')->default('0');
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
        Schema::dropIfExists('assessment_scorings');
    }
}
