<?php

namespace App\Models;

use App\Models\Color;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Classes extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'classes';

    public function colors()
    {
        return $this->hasOne(Color::class, 'id', 'ColorID');
    }
}
