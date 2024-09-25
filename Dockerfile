FROM node:14

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar los archivos de tu proyecto al contenedor
# COPY package*.json ./

# Instalar las dependencias
# RUN npm install

# Copiar el resto del código de la aplicación al contenedor
COPY . .

# Exponer el puerto en el que corre tu aplicación (por ejemplo, 3000)
EXPOSE 3000

# Comando por defecto para ejecutar la aplicación
CMD ["npm", "start"]
