FROM node:lts-alpine

WORKDIR /app

COPY . .
RUN npm install

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk add --no-cache chromium nss
ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser"

EXPOSE 7000
CMD ["npm", "start"]
