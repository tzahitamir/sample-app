FROM ubuntu 
RUN apt-get update && apt-get install -y curl sudo
### RUN apt update 
WORKDIR /home/ubuntu/
RUN apt install -y nodejs npm
RUN npm install express 
COPY sample.js /home/ubuntu/
EXPOSE 8000 
CMD node /home/ubuntu/sample.js
###docker run -d -p 8000:8000 nodeapp AA 
#CMD sleep 25
