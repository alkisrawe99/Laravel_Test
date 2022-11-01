<?php

namespace App\Models;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class course_teacher extends Model
{
    use HasApiTokens, Notifiable;
    public $table = "course_teacher";
  
    protected $fillable = [
      'id_course','id_teacher',
    ];
}
