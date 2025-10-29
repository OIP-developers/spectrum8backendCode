<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrganizationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('organizations', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('OrganizationTypeID')->unsigned()->nullable(); 
            $table->integer('S8S_ID')->unsigned()->nullable(); 
            $table->string('Name',150)->nullable();
            $table->string('Abbr',6)->nullable();
            $table->string('Address',150)->nullable();
            $table->string('City',50)->nullable();
            $table->string('StateProvince',50)->nullable();
            $table->string('PostalCode',50)->nullable();
            $table->bigInteger('PrimaryContactID')->nullable();
            $table->integer('ParentOrganizationID')->unsigned()->nullable(); 
            $table->string('OrgEmail',255)->nullable();
            $table->timestamp('OrgEmailVerifiedOn')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('OrganizationTypeID')->references('id')->on('organization_types')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('S8S_ID')->references('id')->on('users')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('ParentOrganizationID')->references('id')->on('organizations')->constrained()->cascadeOnDelete()->restrictOnDelete();
            // $table->foreign('PrimaryContactID')->references('id')->on('contacts')->constrained()->cascadeOnDelete()->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('organizations');
    }
}
