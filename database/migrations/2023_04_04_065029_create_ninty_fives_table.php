<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNintyFivesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ninty_fives', function (Blueprint $table) { 
            $table->integer('AssessmentID')->unsigned()->nullable();
            $table->integer('GradeID')->unsigned()->nullable();
            $table->integer('GenderID')->unsigned()->nullable();
            $table->float('Percent')->nullable();
            $table->tinyInteger('UseSegment')->default(0);
            // $table->float('ColorSegment')->virtualAs((0 <> (round((`Percent` / 16),2) * `UseSegment`)));
            $table->float('ColorSegment')->nullable();
            $table->float('DistanceToRed')->nullable();
            $table->float('RL')->nullable();
            $table->float('RU')->nullable();
            $table->float('BL')->nullable();
            $table->float('BU')->nullable();
            $table->float('GL')->nullable();
            $table->float('GU')->nullable();
            $table->float('OL')->nullable();
            $table->float('OU')->nullable();
            $table->float('VL')->nullable();
            $table->float('VU')->nullable();
            $table->float('YL')->nullable();
            $table->float('YU')->nullable();
            $table->float('PL')->nullable();
            $table->float('PU')->nullable();
            $table->float('WL')->nullable();
            $table->float('WU')->nullable();
            $table->string('Image')->nullable();
            $table->tinyInteger('Status')->default(1)->comment('1 = Active , 2 = Deactive');
            $table->char('CreatedBy',8)->nullable(); 
            $table->char('UpdatedBy',8)->nullable(); 
            $table->enum('is_archive', ['true', 'false'])->default('false');
            $table->timestamps();
            $table->softDeletes();
            $table->foreign('AssessmentID')->references('id')->on('assessments')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('GradeID')->references('id')->on('grades')->constrained()->cascadeOnDelete()->restrictOnDelete();
            $table->foreign('GenderID')->references('id')->on('genders')->constrained()->cascadeOnDelete()->restrictOnDelete();
        });
        // $createTableSqlString = "CREATE TABLE `ninty_fives` (
        //     `AssessmentID` int NOT NULL ,
        //     `GradeID` int UNSIGNED NOT NULL DEFAULT '1',
        //     `GenderID` int UNSIGNED NOT NULL DEFAULT '3',
        //     `Percent` float NOT NULL,
        //     `UseSegment` tinyint(1) NOT NULL DEFAULT '0',
        //     -- `ColorSegment` float GENERATED ALWAYS AS (round(cast(`Percent` AS FLOAT ),2) * `UseSegment`) VIRTUAL,
        //     `DistanceToRed` float GENERATED ALWAYS AS (round(cast(`Percent` AS FLOAT ),2) * `UseSegment`) VIRTUAL,
        //     `RL` float GENERATED ALWAYS AS (round(cast(0 as float),2)) VIRTUAL,
        //     `RU` float GENERATED ALWAYS AS (round(cast(`Percent` as float),2)) VIRTUAL,
        //     `BL` float GENERATED ALWAYS AS (round(cast((cast(`Percent` as float) + 0.01) as float),2)) VIRTUAL,
        //     `BU` float GENERATED ALWAYS AS (round(cast(((`Percent` * 16) / 15) as float),2)) VIRTUAL,
        //     `GL` float GENERATED ALWAYS AS (round(cast((cast(round(cast(((`Percent` * 16) / 15) as float),2) as float) + 0.01) as float),2)) VIRTUAL,
        //     `GU` float GENERATED ALWAYS AS (round(cast(((`Percent` * 16) / 14) as float),2)) VIRTUAL,
        //     `OL` float GENERATED ALWAYS AS (round(cast((cast(round(cast(((`Percent` * 16) / 14) as float),2) as float) + 0.01) as float),2)) VIRTUAL,
        //     `OU` float GENERATED ALWAYS AS (round(cast(((`Percent` * 16) / 13) as float),2)) VIRTUAL,
        //     `VL` float GENERATED ALWAYS AS (round(cast((cast(round(cast(((`Percent` * 16) / 13) as float),2) as float) + 0.01) as float),2)) VIRTUAL,
        //     `VU` float GENERATED ALWAYS AS (round(cast(((`Percent` * 16) / 12) as float),2)) VIRTUAL,
        //     `YL` float GENERATED ALWAYS AS (round(cast((cast(round(cast(((`Percent` * 16) / 12) as float),2) as float) + 0.01) as float),2)) VIRTUAL,
        //     `YU` float GENERATED ALWAYS AS (round(cast(((`Percent` * 16) / 11) as float),2)) VIRTUAL,
        //     `PL` float GENERATED ALWAYS AS (round(cast((cast(round(cast(((`Percent` * 16) / 11) as float),2) as float) + 0.01) as float),2)) VIRTUAL,
        //     `PU` float GENERATED ALWAYS AS (round(cast(((`Percent` * 16) / 10) as float),2)) VIRTUAL,
        //     `WL` float GENERATED ALWAYS AS (round(cast((cast(round(cast(((`Percent` * 16) / 10) as float),2) as float) + 0.01) as float),2)) VIRTUAL,
        //     `WU` float GENERATED ALWAYS AS (round(cast(100 as float),2)) VIRTUAL,
        //     PRIMARY KEY (`AssessmentID`,`GradeID`,`GenderID`),
        //     KEY `GradeID` (`GradeID`),
        //     KEY `GenderID` (`GenderID`),
        //     CONSTRAINT `ninty_fives_FK_1` FOREIGN KEY (`GradeID`) REFERENCES `grades` (`id`),
        //     CONSTRAINT `ninty_fives_FK_2` FOREIGN KEY (`GenderID`) REFERENCES `genders` (`id`)
        //     )";
        // DB::statement($createTableSqlString);

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ninty_fives');
    }
}
