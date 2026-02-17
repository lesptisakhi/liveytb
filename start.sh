#!/bin/bash

MEGA_URL="https://mega.nz/file/l6UFTQKQ#PUeKYD2dFgbHONUMsXbkIo6OgWa-TOvuQxRFCg7jxg0"
OUTPUT="video.mp4"

# Téléchargement MEGA
megatools dl "$MEGA_URL" --path "$OUTPUT"

# Vérifier que le fichier est bien téléchargé
while [ ! -f "$OUTPUT" ]; do
    sleep 1
done

INSTAGRAM_URL="rtmps://edgetee-upload-mrs2-3.xx.fbcdn.net:443/rtmp/17891451369422874?s_bl=1&s_fbp=cdg4-3&s_ow=10&s_prp=mrs2-3&s_sw=0&s_tids=1&s_vt=ig&a=Ab7W1RziYdToDPQ3BdH_MchA"

# Live Instagram (720p, 3.5 Mb/s)
ffmpeg -re -i "$OUTPUT" \
-vcodec libx264 -preset ultrafast -pix_fmt yuv420p \
-b:v 2500k -maxrate 2500k -bufsize 5000k \
-vf "scale=960:540" \
-acodec aac -b:a 96k -ar 44100 \
-f flv "$INSTAGRAM_URL"
