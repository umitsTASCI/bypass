FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl unzip nginx gettext-base
RUN curl -L https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -o /tmp/xray.zip \
    && unzip /tmp/xray.zip -d /opt/xray \
    && chmod +x /opt/xray/xray
COPY config.json /opt/xray/config.json
COPY default.conf /etc/nginx/conf.d/default.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 10000 8080
CMD ["/start.sh"]
