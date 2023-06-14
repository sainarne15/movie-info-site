FROM node:latest

# set working directory

WORKDIR /app

# asdd `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

#install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-script@5.0.1 -g --silent
RUN npm install -D webpack-cli -g --silent

#add app
COPY . ./

#start app
CMD ["npm", "start"]
