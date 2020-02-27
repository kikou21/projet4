FROM postgres:9.6

COPY dump_pg.sql /docker-entrypoint-initdb.d/dump_pg.sql