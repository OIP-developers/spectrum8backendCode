<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGroupOrganizationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('group_organizations', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('GroupID')->unsigned()->nullable(); 
            $table->integer('OrganizationID')->unsigned()->nullable(); 
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('GroupID')->references('id')->on('groups')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('OrganizationID')->references('id')->on('organizations')->constrained()->cascadeOnDelete()->restrictOnDelete();
        
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('group_organizations');
    }
}
