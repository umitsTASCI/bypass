#!/bin/bash
envsubst '${PORT}' < /etc/nginx/conf.d/default.conf > /tmp/nginx.conf
mv /tmp/nginx.conf /etc/nginx/conf.d/default.conf
/opt/xray/xray run -c /opt/xray/config.json &
exec nginx -g 'daemon off;'
