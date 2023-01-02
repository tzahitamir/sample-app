FROM node:19.3.0-bullseye
RUN apt-get update && apt install -y apt-transport-https curl nodejs docker.io
RUN chmod 777 /var/run/docker.sock
WORKDIR /home/ubuntu/
RUN npm install express pm2 -g
COPY sample.js /home/ubuntu/
EXPOSE 8000 
#CMD node /home/ubuntu/sample.js
#docker run -d -p 8000:8000 nodeapp AA 
#CMD sleep 25
CMD [ "pm2-runtime" , "/home/ubuntu/sample.js" ]
