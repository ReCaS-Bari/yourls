# yourls
Modified yourls for https support

## How to deploy using docker
````
docker run --name yourls -p 8443:8443 --env-file=$PWD/yourls.env -v $PWD/certs/cert.pem:/certs/cert.pem -v $PWD/certs/privkey.pem:/certs/privkey.pem -d recasbari/yourls:1.7.9-https
````

with yourls.env:
````
YOURLS_DB_USER=yourls
YOURLS_DB_PASS=mysecretpwd
YOURLS_DB_NAME=yourls
YOURLS_DB_HOST=172.30.6.23
YOURLS_SITE=https://example.com:8443
YOURLS_PRIVATE=true
YOURLS_USER=admin
YOURLS_PASS=mysupersecretpw
YOURLS_NOSTATS=true
HTTPS_PORT=8443
SERVER_NAME=example.com
````
## How to deploy using docker-compose
````
version: '3.3'

services:
   db:
     image: mysql:5.7
     container_name: db
     volumes:
       - /opt/db_data:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: mysecretpw
       MYSQL_DATABASE: yourls
       MYSQL_USER: yourls
       MYSQL_PASSWORD: mysecret

   yourls:
     depends_on:
       - db
     image: recasbari/yourls:1.7.9-https
     container_name: yourls
     environment:
       YOURLS_DB_USER: yourls
       YOURLS_DB_PASS: mysecret
       YOURLS_DB_NAME: yourls
       YOURLS_DB_HOST: db
       YOURLS_SITE: https://example.com:8443
       YOURLS_PRIVATE: "true"
       YOURLS_USER: admin
       YOURLS_PASS: myadminsecret
       YOURLS_NOSTATS: "true"
       HTTPS_PORT: 8443
       SERVER_NAME: example.com
     ports:
       - "8443:8443"
     restart: always
     volumes:
       - /root/certs:/certs
````       
