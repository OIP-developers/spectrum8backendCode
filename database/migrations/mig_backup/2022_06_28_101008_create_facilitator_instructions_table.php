<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFacilitatorInstructionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('facilitator_instructions', function (Blueprint $table) {
            $table->id();
            $table->string('assessment_id')->nullable();
            $table->longText('instructions')->nullable();
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
        Schema::dropIfExists('facilitator_instructions');
    }
}
