<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('add_course', 'App\Http\Controllers\taskcontroller@add_course');
Route::post('add_teacher', 'App\Http\Controllers\taskcontroller@add_teacher');
Route::post('add_course_teacher', 'App\Http\Controllers\taskcontroller@add_course_teacher');
Route::post('add_student', 'App\Http\Controllers\taskcontroller@add_student');
Route::post('register', 'App\Http\Controllers\taskcontroller@register');

Route::get('view_register', 'App\Http\Controllers\taskcontroller@view_register');


Route::post('login', 'App\Http\Controllers\taskcontroller@login');
Route::post('update', 'App\Http\Controllers\taskcontroller@update');