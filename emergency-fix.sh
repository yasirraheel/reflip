#!/bin/bash

# Emergency fix - Remove problematic service provider temporarily
# This will allow your application to work while we fix the TrustLicence issue

echo "Emergency fix: Temporarily removing TrustLicenceServiceProvider..."

# Navigate to the Application directory
cd Application

echo "1. Backing up config/app.php..."
cp config/app.php config/app.php.backup

echo "2. Commenting out TrustLicenceServiceProvider..."
sed -i 's/Vuehoucine\\Trustlicence\\Providers\\TrustLicenceServiceProvider::class,/#Vuehoucine\\Trustlicence\\Providers\\TrustLicenceServiceProvider::class,/' config/app.php

echo "3. Commenting out TrustlicenceFixServiceProvider..."
sed -i 's/App\\Providers\\TrustlicenceFixServiceProvider::class,/#App\\Providers\\TrustlicenceFixServiceProvider::class,/' config/app.php

echo "4. Regenerating autoload files..."
composer dump-autoload

echo "Emergency fix completed!"
echo "Your application should now work without the TrustLicence service providers."
echo "To restore later, run: cp config/app.php.backup config/app.php"
