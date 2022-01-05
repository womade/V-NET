FROM nginx:alpine
ENV TZ=Asia/Shanghai
RUN apk add --no-cache --virtual .build-deps ca-certificates bash curl unzip php8
COPY nginx/default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/static-html /usr/share/nginx/html/index
COPY nginx/h5-speedtest /usr/share/nginx/html/speedtest
RUN curl -L -H "Cache-Control: no-cache" -o /run.sh https://github.com/womade/V-NET/raw/main/run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["sh", "/run.sh"]