DROP SCHEMA IF EXISTS domibus_schema;
CREATE SCHEMA domibus_schema;
ALTER DATABASE domibus_schema CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER 'edelivery_user'@'%' IDENTIFIED BY 'edelivery_password';
GRANT ALL ON domibus_schema.* TO 'edelivery_user'@'%';
FLUSH PRIVILEGES;