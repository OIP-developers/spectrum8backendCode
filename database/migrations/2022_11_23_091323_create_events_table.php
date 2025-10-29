<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('S8S_ID')->unsigned()->nullable(); 
            $table->integer('OrganizationID')->unsigned()->nullable(); 
            $table->string('Name',150)->nullable(); 
            $table->date('StartDate')->nullable(); 
            $table->time('StartTime')->nullable(); 
            $table->date('EndDate')->nullable(); 
            $table->time('EndTime')->nullable(); 
            $table->integer('FacilityContactID')->unsigned()->nullable(); 
            $table->string('FacilityName',150)->nullable(); 
            $table->string('FacilityAddress',150)->nullable(); 
            $table->integer('EventTypeID')->unsigned()->nullable(); 
            $table->tinyInteger('IsActive')->nullable();
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('S8S_ID')->references('id')->on('users')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('OrganizationID')->references('id')->on('organizations')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('FacilityContactID')->references('id')->on('contacts')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('EventTypeID')->references('id')->on('event_types')->constrained()->cascadeOnDelete()->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('events');
    }
}
