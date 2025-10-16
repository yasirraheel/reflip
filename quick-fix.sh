#!/bin/bash

# Quick fix for the missing autoload path
# This is a simpler approach

echo "Quick fix for missing autoload path..."

cd Application

echo "1. Adding the missing autoload path to composer.json..."

# Use sed to add the missing line
sed -i '/"Vironeer\\\\Addons\\\\": "addons\/src\/",/a\            "Vuehoucine\\\\Trustlicence\\\\": "vendor\/vuehoucine\/trustlicence\/src\/",' composer.json

echo "2. Regenerating autoload files..."
composer dump-autoload

echo "3. Testing..."
php artisan package:discover --ansi

echo "Quick fix completed!"
