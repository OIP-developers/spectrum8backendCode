<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateParticipantEmailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('participant_emails', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('ParticipantID')->unsigned()->nullable(); 
            $table->integer('EmailTypeID')->unsigned()->nullable(); 
            $table->string('Email',255)->nullable();
            $table->timestamp('EmailVerifiedOn')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('ParticipantID')->references('id')->on('participants')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('EmailTypeID')->references('id')->on('email_types')->constrained()->cascadeOnDelete()->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('participant_emails');
    }
}
