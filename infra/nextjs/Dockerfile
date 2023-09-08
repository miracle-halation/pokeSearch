FROM node:16-alpine3.14

WORKDIR /frontend

# コマンド実行
# linux 最新化、gitインストール、npm最新化、vue-cliインストール
RUN apk update && \
 apk add git && \
 yarn global add create-nuxt-app

EXPOSE 8080