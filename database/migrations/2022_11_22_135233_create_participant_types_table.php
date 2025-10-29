<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParticipantTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('participant_types', function (Blueprint $table) {
            $table->increments('id');
            $table->string('Classification',25)->nullable(); 
            $table->tinyInteger('IsActive')->nullable();
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
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
        Schema::dropIfExists('participant_types');
    }
}
