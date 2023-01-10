FROM node:19.3.0-bullseye
RUN apt-get update && apt install -y apt-transport-https curl nodejs
WORKDIR /home/ubuntu/
RUN npm install express pm2 -g
COPY sample.js /home/ubuntu/
EXPOSE 8000 
#docker run -d -p 8000:8000 nodeapp AA 
CMD [ "pm2-runtime" , "/home/ubuntu/sample.js" ]
