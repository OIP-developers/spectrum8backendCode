<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePercentilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('percentiles', function (Blueprint $table) {
            $table->id();
            $table->integer('assessment_id')->nullable();
            $table->integer('grade_id')->nullable();
            $table->string('gender')->nullable();
            $table->string('percent')->nullable();
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
        Schema::dropIfExists('percentiles');
    }
}
