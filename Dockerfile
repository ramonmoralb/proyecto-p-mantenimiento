FROM php:apache

LABEL org.opencontainers.image.authors="ramonmoreno.alu@iespacomolla.es"

# Actualización e instalación en una sola línea para reducir capas
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nano && \
    a2enmod rewrite && \
    rm -rf /var/lib/apt/lists/*

# Exponer el puerto 80
EXPOSE 80

# Copiar la configuración de Apache al contenedor y habilitarla
COPY ./config/prod/virtualhosts/index.prod.chickenkiller.com.conf /etc/apache2/sites-available/
RUN a2ensite index.prod.chickenkiller.com.conf && \
    service apache2 restart

# Comando de inicio
CMD ["apache2-foreground"]
