#!/bin/bash

# Comprehensive fix for TrustLicenceServiceProvider not found error
# Run this script on your server

echo "Starting comprehensive fix for TrustLicenceServiceProvider..."

# Navigate to the Application directory
cd Application

echo "1. Checking if TrustLicence package exists..."
if [ -d "vendor/vuehoucine/trustlicence" ]; then
    echo "✓ TrustLicence package found"
else
    echo "✗ TrustLicence package not found"
    echo "Installing missing package..."
    composer install
fi

echo "2. Checking TrustLicenceServiceProvider file..."
if [ -f "vendor/vuehoucine/trustlicence/src/Providers/TrustLicenceServiceProvider.php" ]; then
    echo "✓ TrustLicenceServiceProvider.php found"
else
    echo "✗ TrustLicenceServiceProvider.php not found"
    echo "Package structure may be corrupted. Reinstalling..."
    rm -rf vendor/vuehoucine/trustlicence
    composer install
fi

echo "3. Checking composer.json autoload configuration..."
if grep -q "Vuehoucine\\\\Trustlicence" composer.json; then
    echo "✓ Autoload path found in composer.json"
else
    echo "✗ Autoload path missing from composer.json"
    echo "Adding autoload path..."
    # This would need to be done manually or with sed
fi

echo "4. Clearing all caches..."
rm -rf bootstrap/cache/*
rm -rf storage/framework/cache/*
rm -rf storage/framework/views/*

echo "5. Regenerating autoload files..."
composer dump-autoload --no-scripts

echo "6. Running package discovery manually..."
php artisan package:discover --ansi

echo "Fix completed!"
echo "If you still get errors, the package may need to be reinstalled completely."
