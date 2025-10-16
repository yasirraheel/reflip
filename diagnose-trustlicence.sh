#!/bin/bash

# Diagnostic script for TrustLicence issues
# Run this to identify the exact problem

echo "=== TrustLicence Diagnostic Script ==="
echo ""

# Navigate to the Application directory
cd Application

echo "1. Checking if vendor directory exists..."
if [ -d "vendor" ]; then
    echo "✓ vendor directory exists"
else
    echo "✗ vendor directory missing"
    exit 1
fi

echo ""
echo "2. Checking if vuehoucine directory exists..."
if [ -d "vendor/vuehoucine" ]; then
    echo "✓ vendor/vuehoucine directory exists"
else
    echo "✗ vendor/vuehoucine directory missing"
    echo "Run: composer install"
    exit 1
fi

echo ""
echo "3. Checking if trustlicence package exists..."
if [ -d "vendor/vuehoucine/trustlicence" ]; then
    echo "✓ trustlicence package exists"
else
    echo "✗ trustlicence package missing"
    echo "Package may not be installed properly"
    exit 1
fi

echo ""
echo "4. Checking TrustLicenceServiceProvider file..."
if [ -f "vendor/vuehoucine/trustlicence/src/Providers/TrustLicenceServiceProvider.php" ]; then
    echo "✓ TrustLicenceServiceProvider.php exists"
    echo "File size: $(stat -c%s vendor/vuehoucine/trustlicence/src/Providers/TrustLicenceServiceProvider.php) bytes"
else
    echo "✗ TrustLicenceServiceProvider.php missing"
    echo "Package structure is corrupted"
    exit 1
fi

echo ""
echo "5. Checking composer.json autoload configuration..."
if grep -q "Vuehoucine\\\\Trustlicence" composer.json; then
    echo "✓ Autoload path configured in composer.json"
    grep "Vuehoucine\\\\Trustlicence" composer.json
else
    echo "✗ Autoload path missing from composer.json"
    echo "This is likely the root cause!"
fi

echo ""
echo "6. Checking if class can be autoloaded..."
php -r "
try {
    require_once 'vendor/autoload.php';
    \$class = 'Vuehoucine\\Trustlicence\\Providers\\TrustLicenceServiceProvider';
    if (class_exists(\$class)) {
        echo '✓ Class can be autoloaded successfully\n';
    } else {
        echo '✗ Class cannot be autoloaded\n';
    }
} catch (Exception \$e) {
    echo '✗ Error during autoload test: ' . \$e->getMessage() . '\n';
}
"

echo ""
echo "=== Diagnostic Complete ==="
