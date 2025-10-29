<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->integer('role_id')->comment("1 = System Managers , 2 = Manage Roles , 3 = Manage Profiles , 4 = Manage Guests , 5 = Application Managers , 6 = Manage Organizations , 7 = Manage Facilitators , 8 = Manage Participants , 9 = Manage Classes , 10 = Manage Groups , 11 = Manage Events");
            $table->integer('facilitator_id')->nullable(); 
            $table->string('otp')->nullable();
            $table->string('device_token')->nullable();
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
