<?php

use App\Models\User;
use App\Models\Organization;
use Illuminate\Support\Facades\Auth;

  

function checkSubOrg(){
    $org = Organization::where('CreatedBy',Auth::user()->id)->first();
    $user = User::where('email',Auth::user()->email)->first();
    return array($org,$user);    

}

function roles_and_permissions(){
    $user_roles = User::where(["id"=>Auth::user()->id,'email'=>Auth::user()->email])->with('roles')->first();
    return $user_roles->roles->Permission;
    // return $user_roles;

}

function roles_and_permissions_name(){
    $user_roles = User::where(["id"=>Auth::user()->id,'email'=>Auth::user()->email])->with('roles')->first();
    return $user_roles->roles->RoleName;
}

