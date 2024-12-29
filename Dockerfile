#sample app
#FROM node:19.3.0-bullseye
#RUN apt-get update && apt install -y apt-transport-https curl nodejs vim \
#&& npm install express pm2 -g \
#&& adduser payplus-prod --uid 1111 --home /home/payplus-prod --gecos "" --disabled-password 
#COPY sample.js /home/payplus-prod
#RUN chmod +x /home/payplus-prod/sample.js \
#&& chown -R payplus-prod /home/payplus-prod

#USER payplus-prod
FROM node:22.12
COPY . .
RUN npm install
RUN npm run build
EXPOSE 8000 
CMD [ "node" , "dist/sample.js" ]
