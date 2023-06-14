#Here we will use node as the base image.
FROM node:14.21.1-alpine

# set working directory

WORKDIR /app

# asdd `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

#install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@5.0.1 -g --silent
RUN npm install -D webpack-cli -g --silent

#install nodemon to provide hot-reloading functionality.
# RUN npm install nodemon --save-dev




#add app
COPY . ./

#start app
#use nodemon to run the react application using npm.
CMD ["npm", "start"]
