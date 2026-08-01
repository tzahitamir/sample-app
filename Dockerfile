##sample app
FROM node:19.3.0-bullseye
RUN export DEBIAN_FRONTEND=noninteractive \
&& apt-get update -qq \
&& apt-get install -y -qq --no-install-recommends apt-transport-https curl vim \
&& npm install express -g --silent \
&& adduser payplus-prod --uid 1111 --home /home/payplus-prod --gecos "" --disabled-password 
COPY sample.js /home/payplus-prod
RUN chmod +x /home/payplus-prod/sample.js \
&& chown -R payplus-prod /home/payplus-prod

#USER payplus-prod
EXPOSE 8000 
##docker run -d -p 8000:8000 nodeapp AA 
#CMD [ "pm2-runtime" , "/home/payplus-prod/sample.js" ]
CMD [ "node" , "/home/payplus-prod/sample.js" ]
#
