#!/bin/bash

cert_dir="nginx/certs"
s3_cert_dir="ssl-certs"
bucket_name=$1
domain=$2
image=$3

if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Error: docker-compose is not installed.' >&2
  exit 1
fi

echo "Configuring image tag";
sed -i "s/IMAGE/$image/g" docker-compose.yml;

docker-compose down

if ![ -d "$cert_dir" ]; then
  mkdir -p $cert_dir
fi

echo "Preparing certs for mounting";
aws s3 cp --recursive s3://$bucket_name/$s3_cert_dir $cert_dir;
cat $cert_dir/certificate_pem $cert_dir/issuer_pem > $cert_dir/fullchain.pem;
cat $cert_dir/private_key_pem > $cert_dir/privkey.pem;

echo "Preparing nginx configuration";
sed -i "s/DOMAIN/$domain/g" nginx/default.conf;

echo "Preparing docker-compose.yml";
sed -i "s/DOMAIN/$domain/g" docker-compose.yml;
sed -i "s@PATH_TO_CERT@$cert_dir@g" docker-compose.yml;

echo "Start up apps"
docker-compose up -d;

echo "Performing health check"
sleep 10;

if ![ -z $(docker-compose ps nginx) ]; then
  echo "Nginx is down"
  exit 1
else
  echo "Nginx is running"
fi

if ![ -z $(docker-compose ps linux_tweet_app) ]; then
  echo "Linux tweet app is down"
  exit 1
else
  echo "Linux tweet app is running"
fi

response=$(curl --write-out '%{http_code}' --silent --output /dev/null https://$domain)

if [ $response -ne 200 ]; then
  echo "The site is down"
  exit 1
else
  echo "The site is available"
fi

redirect=$(curl --write-out '%{http_code}' --silent --output /dev/null http://$domain)

if [ $redirect -ne 301 ]; then
  echo "The redirection is not working"
  exit 1
else
  echo "The redirection is working"
fi