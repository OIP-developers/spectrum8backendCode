<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name' => 'Main Admin',
            'email' => 'admin@admin.com',
            'role_id' => 1,
            'password' => Hash::make('12345678'),
        ]);
    }
}
