<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLicensesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('licenses', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('OrganizationID')->unsigned()->nullable(); 
            $table->integer('LicenseTypeID')->unsigned()->nullable(); 
            $table->date('StartDate')->nullable();
            $table->date('Expires')->nullable();
            $table->enum('is_expire', ['true', 'false'])->default('false');
            $table->tinyInteger('IsActive')->nullable()->comment('1 = Yes , 0 = No');
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('OrganizationID')->references('id')->on('organizations')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('LicenseTypeID')->references('id')->on('license_types')->constrained()->cascadeOnDelete()->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('licenses');
    }
}
