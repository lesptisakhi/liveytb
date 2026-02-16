#!/bin/bash

# Lien MEGA
MEGA_URL="https://mega.nz/file/l6UFTQKQ#PUeKYD2dFgbHONUMsXbkIo6OgWa-TOvuQxRFCg7jxg0"

# Nom du fichier local
OUTPUT="video.mp4"

# Téléchargement depuis MEGA
megatools dl "$MEGA_URL" --path "$OUTPUT"

# URL Instagram RTMPS complète
INSTAGRAM_URL="rtmps://edgetee-upload-mrs2-3.xx.fbcdn.net:443/rtmp/18110039119739471?s_bl=1&s_fbp=cdg4-3&s_ow=10&s_prp=mrs2-3&s_sw=0&s_tids=1&s_vt=ig&a=Ab43XeMsXk9BN-K9g4hEPEFO"

# Lancement du live
ffmpeg -re -i "$OUTPUT" \
-vcodec libx264 -preset veryfast -pix_fmt yuv420p \
-acodec aac -f flv "$INSTAGRAM_URL"
