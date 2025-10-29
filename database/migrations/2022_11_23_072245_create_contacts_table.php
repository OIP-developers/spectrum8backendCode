<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContactsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contacts', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('ContactTypeID')->unsigned()->nullable(); 
            $table->integer('OrganizationID')->unsigned()->nullable(); 
            $table->integer('FacilitatorID')->unsigned()->nullable(); 
            $table->string('Firstname',50)->nullable(); 
            $table->string('Lastname',50)->nullable(); 
            $table->string('PhoneWork',32)->nullable(); 
            $table->tinyInteger('CanTextWork')->nullable(); 
            $table->string('PhoneMobil',32)->nullable(); 
            $table->tinyInteger('CanTextMobil')->nullable(); 
            $table->string('Address',150)->nullable(); 
            $table->string('Email',255)->nullable(); 
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('ContactTypeID')->references('id')->on('contact_types')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('OrganizationID')->references('id')->on('organizations')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('FacilitatorID')->references('id')->on('facilitators')->constrained()->cascadeOnDelete()->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contacts');
    }
}
