<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    // Dashboard - Analytics
    public function dashboardAnalytics(){
        $pageConfigs = [
            'pageHeader' => false
        ];

        return view('/pages/dashboard-analytics', [
            'pageConfigs' => $pageConfigs
        ]);
    }

}

