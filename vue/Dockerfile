FROM node:10

WORKDIR /usr/app

COPY package.json .

RUN npm install --quiet --global \
      @vue/cli \
			@vue/cli-service

COPY . .
