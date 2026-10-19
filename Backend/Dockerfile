# Sử dụng base image PHP 8.2 có sẵn FPM
FROM php:8.2-fpm

# Cài đặt các thư viện hệ thống cần thiết và các extension cho PHP/Laravel
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libwebp-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Cài đặt Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Thiết lập thư mục làm việc trong container
WORKDIR /var/www

# Copy định nghĩa dependencies trước để tận dụng Docker layer cache
COPY composer.json composer.lock* ./

# Cài đặt dependencies (bỏ qua scripts và autoloader vì chưa copy toàn bộ source)
RUN composer install --no-interaction --prefer-dist --no-scripts --no-autoloader

# Copy toàn bộ mã nguồn Laravel vào container
COPY . /var/www

# Tạo lại autoloader hoàn chỉnh sau khi đã có toàn bộ source code
RUN composer dump-autoload --optimize

# Phân quyền cho storage và cache của Laravel
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache \
    && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Mở cổng 8000
EXPOSE 8000

# Lệnh khởi chạy server Laravel
CMD php artisan serve --host=0.0.0.0 --port=8000