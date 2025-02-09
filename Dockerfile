FROM debian:latest

LABEL org.opencontainers.image.authors="ramonmoreno.alu@iespacomolla.es"

# Actualiza los repositorios, instala apache2 y habilita mod_rewrite
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y apache2 \
    && apt-get clean
    RUN a2enmod rewrite

# Expón el puerto 80
EXPOSE 80

# Comando para iniciar Apache en primer plano
CMD ["apache2ctl", "-D", "FOREGROUND"]
