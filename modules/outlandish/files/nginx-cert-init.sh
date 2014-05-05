#/bin/bash

openssl genrsa -des3 -out server.key -passout pass:outlandish 1024
openssl req -new -key server.key -out server.csr -passin pass:outlandish -batch
cp server.key server.key.bak
openssl rsa -in server.key.bak -out server.key -passin pass:outlandish
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt -passin pass:outlandish