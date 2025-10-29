<?php

namespace Database\Seeders;

use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Role::create([
            'RoleName' => 'Main Admin',
            'Permission' => ["user_create","user_read","user_update","user_delete","user_archive","lookup_create","lookup_read","lookup_update","lookup_delete","lookup_archive","organization_create","organization_read","organization_update","organization_delete","organization_archive","facilitator_create","facilitator_read","facilitator_update","facilitator_delete","facilitator_archive","participant_create","participant_read","participant_update","participant_delete","participant_archive","group_create","group_read","group_update","group_delete","group_archive","event_create","event_read","event_update","event_delete","event_archive","assessment_result_create","assessment_result_read","assessment_result_update","assessment_result_delete","assessment_result_archive","faq_read","role_create","license_read","license_create","license_update","license_delete","license_archive"]
        ]);
    }
}
