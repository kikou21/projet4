FROM mysql:latest

COPY dump_mysql.sql /docker-entrypoint-initdb.d/dump_mysql.sql