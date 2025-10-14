<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\File;

class TrustlicenceFixServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        // Fix the Trustlicence HandlerController if it exists
        $handlerControllerPath = base_path('vendor/vuehoucine/trustlicence/src/Http/Controllers/HandlerController.php');
        
        if (File::exists($handlerControllerPath)) {
            $content = File::get($handlerControllerPath);
            
            // Check if the Validator import is missing
            if (strpos($content, 'use Illuminate\Support\Facades\Validator;') === false) {
                // Add the missing import
                $content = str_replace(
                    'use Illuminate\Support\Facades\DB;',
                    "use Illuminate\Support\Facades\DB;\nuse Illuminate\Support\Facades\Validator;",
                    $content
                );
                
                // Fix the \Validator usage
                $content = str_replace('\\Validator::make', 'Validator::make', $content);
                
                // Write the fixed content back
                File::put($handlerControllerPath, $content);
            }
        }
    }
}
