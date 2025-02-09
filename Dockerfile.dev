##imagen base 
FROM php:apache

LABEL org.opencontainers.image.authors="ramonmoreno.alu@iespacomolla.es"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nano -y


EXPOSE 80

CMD ["apache2-foreground"]
