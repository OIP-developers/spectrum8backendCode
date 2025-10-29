<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_types', function (Blueprint $table) {
          $table->increments('id');
          $table->string('Name',150)->nullable();
          $table->tinyInteger('InPerson')->nullable()->comment('1 = Yes , 0 = No');
          $table->tinyInteger('Vitrual')->nullable()->comment('1 = Yes , 0 = No');
          $table->integer('EventCatagoryID')->unsigned()->nullable(); 
          $table->tinyInteger('IsActive')->nullable()->comment('1 = Yes , 0 = No');
          $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
          $table->char('CreatedBy',8)->nullable(); 
          $table->char('UpdatedBy',8)->nullable(); 
          $table->enum('is_archive', ['true', 'false'])->default('false');
          $table->timestamps();
          $table->softDeletes();
          $table->foreign('EventCatagoryID')->references('id')->on('event_catagories')->constrained()->cascadeOnDelete()->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_types');
    }
}
