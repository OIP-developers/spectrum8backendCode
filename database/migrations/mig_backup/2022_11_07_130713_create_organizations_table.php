<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

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
            $table->id();
            $table->string("OrganizationTypeID")->nullable();
            $table->string("S8S_ID")->nullable();
            $table->string("Name")->nullable();
            $table->string("Abbr")->nullable();
            $table->string("Address")->nullable();
            $table->string("City")->nullable();
            $table->string("StateProvince")->nullable();
            $table->string("PostalCode")->nullable();
            $table->string("OrgEmail")->nullable();
            $table->string("OrgEmailVerifiedOn")->nullable();
            $table->enum('IsOrgAdmin', ['true', 'false'])->nullable();
            $table->string("ParentOrganizationID")->nullable();
            $table->integer('CreatedBy')->nullable(); 
           $table->string('is_archive')->default('false');
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
        Schema::dropIfExists('organizations');
    }
}
