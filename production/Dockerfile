FROM node:19.3.0-bullseye
#RUN apt-get update && apt install -y apt-transport-https curl nodejs vim
# files should be placed at the same hirearchy as the Dockerfile
COPY sample.js /root/
RUN chmod +x /root/sample.js
#WORKDIR /home/ubuntu/
RUN npm install express pm2 -g
EXPOSE 8000
#docker run -d -p 8000:8000 nodeapp AA
CMD [ "pm2-runtime" , "/root/sample.js" ]
