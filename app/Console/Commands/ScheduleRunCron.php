<?php

namespace App\Console\Commands;

use Log;
use App\Models\License;
use Illuminate\Console\Command;

class ScheduleRunCron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'schedule:run';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $currentDate = now()->toDateString();
        $data  = License::where('Expires', '<', $currentDate)->where('is_expire', "false")->get();
        foreach ($data as $data_val) {
            $data_val->is_expire = "true";
            $data_val->save();
        }
    }
}
