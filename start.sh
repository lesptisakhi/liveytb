#!/bin/bash

VIDEO_URL="https://github.com/lesptisakhi/liveytb/releases/download/video/video.mp4"
OUTPUT="video.mp4"

# Téléchargement depuis GitHub Releases (ultra stable)
curl -L "$VIDEO_URL" -o "$OUTPUT"

INSTAGRAM_URL="rtmps://edgetee-upload-mrs2-3.xx.fbcdn.net:443/rtmp/18093696784817265?s_bl=1&s_fbp=cdg4-3&s_ow=10&s_prp=mrs2-3&s_sw=0&s_tids=1&s_vt=ig&a=Ab7LK77ntcJhCmzSCD-zs7Ya"

# Live Instagram (720p, 3.5 Mb/s)
ffmpeg -re -i "$OUTPUT" \
-vcodec libx264 -preset veryfast -pix_fmt yuv420p \
-b:v 3500k -maxrate 3500k -bufsize 7000k \
-vf "scale=1280:720" \
-acodec aac -b:a 128k -ar 44100 \
-f flv "$INSTAGRAM_URL"
