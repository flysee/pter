FROM node:lts-alpine

WORKDIR /app

COPY . .
RUN npm install

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --update --no-cache ttf-dejavu fontconfig && rm -rf /var/cache/apk/* && mkdir -p /usr/share/fonts/win && mv simsun.ttc /usr/share/fonts/win/simsun.ttc && mkfontscale && mkfontdir && fc-cache
ENV LANG=C.UTF-8 \
    LANGUAGE=zh_CN.UTF-8

RUN apk add --no-cache chromium nss
ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser"

EXPOSE 7000
CMD ["npm", "start"]
