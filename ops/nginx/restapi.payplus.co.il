server {
	listen 80;
#	listen 443 ssl;
	server_name restapi.payplus.co.il restapi.corecrm.co;
#        ssl_certificate /etc/nginx/ssl/star.payplus.co.il.crt;
#        ssl_certificate_key /etc/nginx/ssl/star.payplus.co.il.key;
      #  root /home/payplus_prod/pay-plus-api/;
	location / {
		proxy_pass http://localhost:9030;
	        proxy_http_version 1.1;
	        proxy_set_header Upgrade $http_upgrade;
	        proxy_set_header Connection 'upgrade';
		proxy_set_header Host $host;
	        proxy_cache_bypass $http_upgrade
                proxy_connect_timeout         1200s;
                proxy_read_timeout            1200s;
                proxy_send_timeout            1200s;
        proxy_set_header X-Forwarded-For $remote_addr;
	add_header Last-Modified $date_gmt;
        add_header Cache-Control 'no-store, no-cache, must-revalidate, proxy-revalidate, max-age=0';
        if_modified_since off;
        expires off;
        etag off;
	}
}
