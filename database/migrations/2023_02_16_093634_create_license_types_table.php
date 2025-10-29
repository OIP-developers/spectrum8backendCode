<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLicenseTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('license_types', function (Blueprint $table) {
            $table->increments('id');
            $table->string('Name',150)->nullable();
            $table->boolean('Subscription')->nullable();
            $table->integer('Facilitators')->nullable();
            $table->integer('Participants')->nullable();
            // $table->integer('DurationDays')->nullable();
            $table->integer('number_of_devices_login')->default(2);
            $table->tinyInteger('IsActive')->nullable()->comment('1 = Yes , 0 = No');
            $table->float('Cost')->nullable();
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
        Schema::dropIfExists('license_types');
    }
}
