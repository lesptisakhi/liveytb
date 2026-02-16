#!/bin/bash

VIDEO_URL="https://urls.fr/9P5669"

INSTAGRAM_URL="rtmps://edgetee-upload-mrs2-3.xx.fbcdn.net:443/rtmp/TA_CLE_INSTAGRAM"

ffmpeg -re -i "$VIDEO_URL" \
-vcodec libx264 -preset veryfast -pix_fmt yuv420p \
-acodec aac -f flv "$INSTAGRAM_URL"
