#!/bin/bash

# Fix composer.json autoload configuration
# This addresses the missing autoload path issue

echo "Fixing composer.json autoload configuration..."

# Navigate to the Application directory
cd Application

echo "1. Backing up composer.json..."
cp composer.json composer.json.backup

echo "2. Adding missing autoload path for TrustLicence..."

# Create a temporary file with the fix
cat > temp_composer.json << 'EOF'
{
    "name": "laravel/laravel",
    "type": "project",
    "description": "The Laravel Framework.",
    "keywords": [
        "framework",
        "laravel"
    ],
    "license": "MIT",
    "require": {
        "php": "^8.0.2",
        "anhskohbo/no-captcha": "^3.4",
        "bacon/bacon-qr-code": "^2.0",
        "cviebrock/eloquent-sluggable": "^9.0",
        "fruitcake/laravel-cors": "^3.0",
        "guzzlehttp/guzzle": "^7.2",
        "intervention/image": "^2.7",
        "jenssegers/date": "^4.0",
        "laravel/framework": "^9.19",
        "laravel/sanctum": "^2.14.1",
        "laravel/socialite": "^5.5",
        "laravel/tinker": "^2.7",
        "laravel/ui": "^3.4",
        "laravelcollective/html": "^6.2",
        "league/flysystem-aws-s3-v3": "^3.0",
        "mcamara/laravel-localization": "1.7",
        "mollie/laravel-mollie": "^2.19",
        "paypal/rest-api-sdk-php": "^1.14",
        "pion/laravel-chunk-upload": "^1.5",
        "pragmarx/google2fa-laravel": "^2.0",
        "razorpay/razorpay": "^2.8",
        "stripe/stripe-php": "^8.11",
        "vinkla/hashids": "^10.0",
        "yoeunes/toastr": "^1.2"
    },
    "require-dev": {
        "spatie/laravel-ignition": "^1.0",
        "fakerphp/faker": "^1.9.1",
        "laravel/sail": "^1.0.1",
        "mockery/mockery": "^1.4.4",
        "nunomaduro/collision": "^6.1",
        "phpunit/phpunit": "^9.5.10"
    },
    "autoload": {
        "psr-4": {
            "App\\": "app/",
            "Database\\Factories\\": "database/factories/",
            "Database\\Seeders\\": "database/seeders/",
            "Vironeer\\Addons\\App\\": "addons/src/app/",
            "Vironeer\\Addons\\": "addons/src/",
            "Vuehoucine\\Trustlicence\\": "vendor/vuehoucine/trustlicence/src/"
        },
        "files": [
            "app/Http/Helpers/Helper.php",
            "app/Http/Helpers/WidgetHelper.php",
            "app/Http/Helpers/AdsHelper.php"
        ]
    },
    "autoload-dev": {
        "psr-4": {
            "Tests\\": "tests/"
        }
    },
    "scripts": {
        "post-autoload-dump": [
            "Illuminate\\Foundation\\ComposerScripts::postAutoloadDump",
            "@php artisan package:discover --ansi"
        ],
        "post-update-cmd": [
            "@php artisan vendor:publish --tag=laravel-assets --ansi"
        ],
        "post-root-package-install": [
            "@php -r \"file_exists('.env') || copy('.env.example', '.env');\""
        ],
        "post-create-project-cmd": [
            "@php artisan key:generate --ansi"
        ]
    },
    "extra": {
        "laravel": {
            "dont-discover": []
        }
    },
    "config": {
        "optimize-autoloader": true,
        "preferred-install": "dist",
        "sort-packages": true
    },
    "minimum-stability": "dev",
    "prefer-stable": true
}
EOF

echo "3. Replacing composer.json with fixed version..."
mv temp_composer.json composer.json

echo "4. Regenerating autoload files..."
composer dump-autoload

echo "5. Testing package discovery..."
php artisan package:discover --ansi

echo "Fix completed!"
echo "The TrustLicenceServiceProvider should now be properly loaded."
