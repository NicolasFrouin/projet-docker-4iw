# Utilisez l'image Alpine Linux comme base
FROM alpine:latest

# Installation des dépendances nécessaires pour Adminer
RUN apk add --no-cache wget php8 php8-fpm php8-mysqli php8-pdo_mysql

# Téléchargement et installation d'Adminer
RUN mkdir /adminer \
    && wget "https://www.adminer.org/latest.php" -O /adminer/index.php --no-check-certificate

# Exposez le port 8080 pour accéder à Adminer
EXPOSE 8080

# Commande par défaut pour démarrer Adminer
CMD ["/usr/bin/php8", "-S", "0.0.0.0:8080", "-t", "/adminer"]