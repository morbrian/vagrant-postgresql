CREATE USER "dbuser" WITH PASSWORD 'dbuser';
CREATE USER "dbadmin" WITH PASSWORD 'dbadmin';
CREATE DATABASE sample WITH OWNER = "dbadmin" ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' CONNECTION LIMIT = -1;
GRANT ALL PRIVILEGES ON DATABASE sample to "dbuser";
GRANT ALL PRIVILEGES ON DATABASE sample to "dbadmin";