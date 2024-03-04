#Utilisez l'image Alpine Linux comme base
FROM alpine:latest

#Installation des dépendances nécessaires pour Adminer
RUN apk --no-cache add php7 php7-session php7-pdo php7-pdo_pgsql

#Téléchargement et installation d'Adminer
RUN mkdir /adminer \
    && wget "https://www.adminer.org/latest.php" -O /adminer/index.php

#Exposez le port 8080 pour accéder à Adminer
EXPOSE 8080

#Commande par défaut pour démarrer Adminer
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/adminer"]