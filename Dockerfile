FROM debian:stable

RUN apt update && apt install -y ffmpeg python3 python3-pip

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
