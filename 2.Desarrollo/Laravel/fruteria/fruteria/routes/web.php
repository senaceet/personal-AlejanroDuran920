<?php

use App\Http\Controllers\LandingController;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/inicio',[LandingController::class,'index'])->name('landing.index');
Route::get('/acercade',[LandingController::class,'acercade'])->name('landing.acercade');
Route::get('/servicios',[LandingController::class,'servicios'])->name('landing.servicios');
Route::get('/contacto',[LandingController::class,'contacto'])->name('landing.contacto');
