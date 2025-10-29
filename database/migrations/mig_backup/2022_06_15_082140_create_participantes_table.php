<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParticipantesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('participantes', function (Blueprint $table) {
            $table->increments('id');
            $table->string('Lastname')->nullable();
            $table->string('Firstname')->nullable();
            $table->integer('grade_id')->nullable();
            $table->integer('group_id')->nullable();
            $table->string('Gender')->nullable();
            $table->integer('Age')->nullable();
            $table->integer('ParticipantTypeID')->nullable();
            $table->string('JerseyNumber')->nullable();
            $table->string('JerseyColor')->nullable();
            $table->integer('Status')->default(0);
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
        Schema::dropIfExists('participantes');
    }
}
