#!/bin/bash

# -----------------------------
# CONFIGURATION
# -----------------------------

VIDEO_URL="https://github.com/lesptisakhi/liveytb/releases/download/video/video.mp4"
VIDEO_FILE="video.mp4"

# ⚠️ Mets ici ta clé YouTube (rtmp://a.rtmp.youtube.com/live2/xxxx-xxxx-xxxx-xxxx)
YOUTUBE_URL="rtmp://rtmp.livepeer.com/live/TEST"

LOG_FILE="logs.txt"

# -----------------------------
# TÉLÉCHARGEMENT DE LA VIDÉO (UNE SEULE FOIS)
# -----------------------------

if [ ! -f "$VIDEO_FILE" ]; then
    echo "[INFO] Téléchargement de la vidéo..." | tee -a "$LOG_FILE"
    curl -L "$VIDEO_URL" -o "$VIDEO_FILE"
    echo "[INFO] Téléchargement terminé." | tee -a "$LOG_FILE"
fi

# -----------------------------
# BOUCLE INFINIE (AUTO-RESTART)
# -----------------------------

while true; do
    echo "[INFO] Démarrage du live YouTube..." | tee -a "$LOG_FILE"

    ffmpeg -re -i "$VIDEO_FILE" \
    -vcodec libx264 -preset veryfast -pix_fmt yuv420p \
    -b:v 3500k -maxrate 3500k -bufsize 7000k \
    -vf "scale=1280:720" \
    -acodec aac -b:a 128k -ar 44100 \
    -f flv "$YOUTUBE_URL" >> "$LOG_FILE" 2>&1

    echo "[WARN] FFmpeg s'est arrêté. Redémarrage dans 5 secondes..." | tee -a "$LOG_FILE"
    sleep 5
done
