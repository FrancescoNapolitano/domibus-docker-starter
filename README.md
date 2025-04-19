# DOCKERIZE DOMIBUS

Download the domibus.war from the official Domibus page and place it in the root folder.

## Create a docker image

docker build -t local-docker/domibus .

## Run docker compose up

docker-compose up --detach

## Login

Wait for domibus to start.

Search in the log for: *admin default password [password]*

Navigate to localhost:8080/domibus and login with admin and the password retrieved from the log

It will ask you to change the password, this is one ready to use: **G7u@xQp9T$eLm2Yz**

## Usefull keytool command

keytool -genkeypair -alias my-domibus -keyalg RSA -keysize 2048 -validity 3650 -keystore keystore.jks

keytool -exportcert -alias my-domibus -keystore keystore.jks -file domibus.cer

keytool -importcert -alias my-domibus -file domibus.cer -keystore truststore.jks

## Domibus property

For test we can change:

domibus.properties.passwordPolicy.pattern=^.{1,}$