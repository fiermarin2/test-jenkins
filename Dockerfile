FROM php:8.2-fpm

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Instalar Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

# Instalar Node.js
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

    # Crear un usuario vscode
RUN useradd -ms /bin/bash vscode \
&& mkdir -p /home/vscode \
&& chown -R vscode:vscode /home/vscode

# Establecer el usuario por defecto
USER vscode

# Configurar el directorio de trabajo
WORKDIR /workspace

# Exponer el puerto
EXPOSE 8000