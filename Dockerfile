FROM debian:stable

# Mise à jour + installation des outils nécessaires
RUN apt update && apt install -y ffmpeg curl

# Copie du script de démarrage
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Commande de lancement
CMD ["/start.sh"]
