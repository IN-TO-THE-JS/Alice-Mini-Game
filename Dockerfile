FROM node:lts

WORKDIR /app
# aws codebuild의 환경변수 설정에 따라 변경됨
ARG WORKSPACE=dev
RUN mkdir -p /app
WORKDIR /app
ADD . /app/

RUN rm yarn.lock || true
RUN rm package-lock.json || true
RUN yarn install
RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD [ "yarn", "start"]
