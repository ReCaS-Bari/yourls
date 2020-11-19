# yourls
Modified yourls for https support

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
