<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAssessmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('assessments', function (Blueprint $table) {
            $table->increments('id');
            $table->string('Name',100)->nullable();
            $table->string('ShortName',25)->nullable();
            $table->string('NickName',15)->nullable();
            $table->string('Abbr',4)->nullable();
            $table->integer('MaxParticipants')->nullable();
            $table->integer('Sort')->nullable();
            $table->integer('AssessmentTypeID')->unsigned()->nullable(); 
            $table->longText('Setup')->nullable();
            $table->longText('Instructions')->nullable();
            $table->longText('EvalList')->nullable();
            $table->integer('ColorID')->unsigned()->nullable(); 
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('AssessmentTypeID')->references('id')->on('assessment_types')->constrained()->cascadeOnDelete()->restrictOnDelete();
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
        Schema::dropIfExists('assessments');
    }
}
