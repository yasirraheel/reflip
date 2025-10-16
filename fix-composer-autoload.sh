#!/bin/bash

# Fix for TrustLicenceServiceProvider not found error
# Run this script on your server after pulling the latest code

echo "Fixing composer autoload issues..."

# Navigate to the Application directory
cd Application

# Regenerate composer autoload files
echo "Regenerating composer autoload files..."
composer dump-autoload

echo "Fix completed successfully!"
echo "The TrustLicenceServiceProvider should now be properly loaded."
