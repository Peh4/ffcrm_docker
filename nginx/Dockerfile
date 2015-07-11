# Fat Free CRM nginX conf
# docker build -t peha/nginx:v1 .
# docker run --name nginx -d -p 8080:80 peha/nginx

FROM nginx

ADD nginx.conf /etc/nginx/nginx.conf

ADD Nginx-Startup.sh /etc/nginx/Nginx-Startup.sh

EXPOSE 80

CMD ["/bin/bash","/etc/nginx/Nginx-Startup.sh"]