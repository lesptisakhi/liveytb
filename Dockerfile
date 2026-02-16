FROM debian:stable

# Mise à jour + installation FFmpeg + Python + megatools
RUN apt update && apt install -y ffmpeg python3 python3-pip megatools

# Copie du script de démarrage
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Commande de lancement
CMD ["/start.sh"]
