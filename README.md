# FileBob Starter Kit

A comprehensive Laravel-based file sharing and management application starter kit. FileBob provides a complete solution for building file sharing platforms with user management, subscription plans, payment gateways, and advanced file handling features.

## 🚀 Features

### Core Functionality
- **File Upload & Management**: Secure file upload with chunk upload support
- **User Authentication**: Complete user registration, login, and profile management
- **Admin Panel**: Comprehensive admin dashboard for managing users, files, and settings
- **File Sharing**: Generate shareable links with password protection and expiration dates
- **File Preview**: Built-in file preview functionality
- **Download Management**: Track downloads and manage file access

### Advanced Features
- **Multi-language Support**: Built-in localization with Laravel Localization
- **Subscription System**: SaaS-ready with multiple subscription plans
- **Payment Gateways**: Integration with PayPal, Stripe, Mollie, and Razorpay
- **Storage Options**: Support for local, Amazon S3, Backblaze B2, and Wasabi storage
- **Two-Factor Authentication**: Enhanced security with 2FA support
- **Social Login**: OAuth integration for Google and Facebook
- **Blog System**: Built-in blog functionality with categories and comments
- **SEO Optimization**: Complete SEO management system
- **Email Templates**: Customizable email templates
- **Advertisement System**: Built-in ad management
- **File Reports**: User reporting system for inappropriate content
- **Analytics Dashboard**: Comprehensive analytics and charts

### Technical Features
- **Laravel 9**: Built on the latest Laravel framework
- **Responsive Design**: Mobile-first responsive design
- **RESTful API**: Complete API endpoints for mobile app integration
- **Queue System**: Background job processing
- **Caching**: Redis and file-based caching support
- **Image Processing**: Automatic image optimization with Intervention Image
- **Security**: CSRF protection, XSS prevention, and secure file handling

## 📋 Requirements

- PHP >= 8.0.2
- Composer
- Node.js & NPM
- MySQL/MariaDB
- Redis (optional, for caching and queues)
- Web server (Apache/Nginx)

## 🛠️ Installation

### 1. Clone the Repository
```bash
git clone https://github.com/yasirraheel/filebob-starterkit.git
cd filebob-starterkit
```

### 2. Install Dependencies
```bash
# Install PHP dependencies
composer install

# Install Node.js dependencies
npm install
```

### 3. Environment Configuration
```bash
# Copy environment file
cp Application/.env.example Application/.env

# Generate application key
cd Application
php artisan key:generate
```

### 4. Database Setup
```bash
# Create database and configure .env file
# Update database credentials in Application/.env

# Run migrations
php artisan migrate

# Seed the database (optional)
php artisan db:seed
```

### 5. Storage Configuration
```bash
# Create storage link
php artisan storage:link

# Set proper permissions
chmod -R 755 storage
chmod -R 755 bootstrap/cache
```

### 6. Build Assets
```bash
# Build frontend assets
npm run dev
# or for production
npm run production
```

### 7. Configure Web Server
Point your web server document root to the project root directory.

## ⚙️ Configuration

### Environment Variables
Key environment variables to configure:

```env
APP_NAME="FileBob"
APP_URL=http://your-domain.com
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=filebob
DB_USERNAME=your_username
DB_PASSWORD=your_password

# Storage Configuration
FILESYSTEM_DISK=local
AWS_ACCESS_KEY_ID=your_aws_key
AWS_SECRET_ACCESS_KEY=your_aws_secret
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=your_bucket_name

# Payment Gateways
PAYPAL_CLIENT_ID=your_paypal_client_id
PAYPAL_CLIENT_SECRET=your_paypal_secret
STRIPE_KEY=your_stripe_key
STRIPE_SECRET=your_stripe_secret

# Email Configuration
MAIL_MAILER=smtp
MAIL_HOST=your_smtp_host
MAIL_PORT=587
MAIL_USERNAME=your_email
MAIL_PASSWORD=your_password
```

### Admin Access
Default admin credentials (change after first login):
- Email: admin@example.com
- Password: password

## 🎨 Customization

### Themes and Styling
- Modify CSS files in `Application/resources/assets/css/`
- Update Blade templates in `Application/resources/views/`
- Customize JavaScript in `Application/resources/assets/js/`

### Adding New Features
- Controllers: `Application/app/Http/Controllers/`
- Models: `Application/app/Models/`
- Views: `Application/resources/views/`
- Routes: `Application/routes/web.php`

### Language Files
- Add new languages in `Application/lang/`
- Update translations in respective language folders

## 📁 Project Structure

```
filebob-starterkit/
├── Application/                 # Laravel application
│   ├── app/
│   │   ├── Http/Controllers/   # Application controllers
│   │   ├── Models/            # Eloquent models
│   │   └── ...
│   ├── config/                # Configuration files
│   ├── database/              # Migrations and seeders
│   ├── resources/             # Views, assets, and language files
│   ├── routes/                # Route definitions
│   └── storage/               # File storage
├── assets/                    # Compiled assets
├── images/                    # Static images
└── uploads/                   # User uploaded files
```

## 🔧 Development

### Running the Application
```bash
# Start Laravel development server
php artisan serve

# Watch for asset changes
npm run watch
```

### Database Commands
```bash
# Create new migration
php artisan make:migration create_table_name

# Create new model
php artisan make:model ModelName

# Create new controller
php artisan make:controller ControllerName
```

### Testing
```bash
# Run tests
php artisan test
```

## 🚀 Deployment

### Production Deployment
1. Set `APP_ENV=production` in `.env`
2. Set `APP_DEBUG=false` in `.env`
3. Run `composer install --optimize-autoloader --no-dev`
4. Run `npm run production`
5. Run `php artisan config:cache`
6. Run `php artisan route:cache`
7. Run `php artisan view:cache`

### Server Requirements
- PHP 8.0+ with required extensions
- MySQL 5.7+ or MariaDB 10.2+
- Web server (Apache/Nginx)
- SSL certificate (recommended)

## 📚 API Documentation

The application includes a comprehensive REST API. API endpoints are defined in `Application/routes/api.php`.

### Authentication
- POST `/api/login` - User login
- POST `/api/register` - User registration
- POST `/api/logout` - User logout

### File Management
- GET `/api/files` - List user files
- POST `/api/files` - Upload new file
- GET `/api/files/{id}` - Get file details
- DELETE `/api/files/{id}` - Delete file

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- Create an issue in the GitHub repository
- Check the documentation in the `docs/` folder
- Review the Laravel documentation for framework-specific questions

## 🙏 Acknowledgments

- Built with [Laravel](https://laravel.com/)
- UI components from Bootstrap
- Icons from Font Awesome
- Payment gateway integrations
- Storage provider integrations

## 🔄 Version History

- **v1.0.0** - Initial release with core file sharing functionality
- **v1.1.0** - Added subscription system and payment gateways
- **v1.2.0** - Enhanced security with 2FA and improved file handling
- **v1.3.0** - Added blog system and advanced admin features

---

**Note**: This is a starter kit. Customize and modify according to your specific requirements. Always test thoroughly before deploying to production.
