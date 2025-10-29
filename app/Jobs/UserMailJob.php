<?php

namespace App\Jobs;

use App\Mail\UserMail;
use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\Mail;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Contracts\Queue\ShouldBeUnique;

class UserMailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
  
    protected $user_data;
  
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($user_data)
    {
        $this->user_data = $user_data;
    }
  
    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $email = new UserMail($this->user_data);
        Mail::to('muhammad.hannan@oip.com.pk')->send($email);
    }
}
