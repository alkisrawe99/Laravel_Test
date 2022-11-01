<?php

namespace App\Models;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User  as Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class student extends Authenticatable
{
    use HasApiTokens, Notifiable;
  public $table = "student";

  protected $fillable = [
    'id','name','email','password',
  ];
}
