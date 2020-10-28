<?php

namespace App\Http\Controllers;

use Facade\FlareClient\View;
use Illuminate\Http\Request;

class LandingController extends Controller
{
    public function index(){
        return view('landing.index');

    }
    public function acercade(){
        return view('landing.acercade');

    }
    public function servicios(){
        return view('landing.servicios');

    }
    public function contacto(){
        return view('landing.contacto');

    }
}
