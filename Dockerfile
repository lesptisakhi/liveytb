FROM debian:stable

# Installer FFmpeg + curl + Node.js
RUN apt update && apt install -y ffmpeg curl nodejs npm

# Copier les fichiers
COPY start.sh /start.sh
COPY server.js /server.js

RUN chmod +x /start.sh

# Installer Express
RUN npm install express

# Lancer FFmpeg + le serveur web
CMD bash -c "/start.sh & node /server.js"
