<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDevicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('facilitators', function (Blueprint $table) {
            $table->integer('number_of_devices_login')->default(2);
        });
        Schema::create('devices', function (Blueprint $table) {
            $table->increments('id');
            $table->string('device_id')->nullable(); 
            $table->integer('facilitator_id')->unsigned()->nullable(); 
            $table->timestamps();
            $table->foreign('facilitator_id')->references('id')->on('facilitators')->constrained()->cascadeOnDelete()->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('facilitators', function (Blueprint $table) {
            $table->integer('number_of_devices_login')->default(2);
        });
        Schema::dropIfExists('devices');
    }
}
