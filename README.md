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

### JKS

# Keystore
keytool -genkeypair -alias my-domibus -keyalg RSA -keysize 2048 -validity 3650 -keystore keystore.jks -storetype JKS -storepass password -keypass password -dname "CN=my-domibus"

# Export certificate
keytool -exportcert -alias my-domibus -keystore keystore.jks -storepass password -file domibus.cer

# Truststore + import certificate
keytool -importcert -alias my-domibus -file domibus.cer -keystore truststore.jks -storetype JKS -storepass password -noprompt

### PKCS12

# Keystore
keytool -genkeypair -alias my-domibus -keyalg RSA -keysize 2048 -validity 3650 -keystore keystore.p12 -storetype PKCS12 -storepass password -keypass password -dname "CN=my-domibus"

# Export certificate
keytool -exportcert -alias my-domibus -keystore keystore.p12 -storetype PKCS12 -storepass password -file domibus.cer

# Truststore + import certificate
keytool -importcert -alias my-domibus -file domibus.cer -keystore truststore.p12 -storetype PKCS12 -storepass password -noprompt

## Domibus property

For test we can change:

domibus.properties.passwordPolicy.pattern=^.{1,}$