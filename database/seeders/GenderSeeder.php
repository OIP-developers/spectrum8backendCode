<?php

namespace Database\Seeders;

use App\Models\Gender;
use Illuminate\Database\Seeder;

class GenderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Gender::create([
            'Gender' => 'Male',
            'Child' => 'Boy',
            'Children' => "Boy's",
            'Adult' => "Man",
            'Adults' => 'Men'
        ]);
        Gender::create([
            'Gender' => 'Female',
            'Child' => 'Girl',
            'Children' => "Girl's",
            'Adult' => "Woman",
            'Adults' => 'Women'
        ]);
        Gender::create([
            'Gender' => 'Other',
            'Child' => 'Other',
            'Children' => "Other's",
            'Adult' => "Other",
            'Adults' => "Other's"
        ]);
    }
}
