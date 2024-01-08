#sample app
FROM node:19.3.0-bullseye
RUN apt-get update && apt install -y apt-transport-https curl nodejs vim \
&& npm install express dd-trace pm2 -g \
&& adduser payplus-prod --uid 1111 --home /home/payplus-prod --gecos "" --disabled-password 
COPY sample.js /home/payplus-prod
RUN chmod +x /home/payplus-prod/sample.js \
&& chown -R payplus-prod /home/payplus-prod

#USER payplus-prod
EXPOSE 8000 
##docker run -d -p 8000:8000 nodeapp AA 
#CMD [ "pm2-runtime" , "/home/payplus-prod/sample.js" ]
