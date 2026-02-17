FROM debian:stable

RUN apt update && apt install -y ffmpeg curl nodejs npm

COPY start.sh /start.sh
COPY server.js /server.js

RUN chmod +x /start.sh

RUN npm install express

CMD bash -c "/start.sh & node /server.js"
