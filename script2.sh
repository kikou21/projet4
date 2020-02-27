#!/bin/sh

sleep 10

cd /usr/local/tomcat/webapps/

sed -i 's/jdbc.dbms=hsqldb/jdbc.dbms=postgresql/g' logicaldoc/WEB-INF/classes/context.properties
sed -i "s/jdbc.driver=org.hsqldb.jdbc.JDBCDriver/jdbc.driver=org.postgresql.Driver/g" logicaldoc/WEB-INF/classes/context.properties
sed -i "s/jdbc.url=.*/jdbc.url=jdbc:postgresql:\/\/db_pg:5432\/logicaldoc/g" logicaldoc/WEB-INF/classes/context.properties
sed -i "s/jdbc.username=sa/jdbc.username=logicaldocuser/g" logicaldoc/WEB-INF/classes/context.properties
sed -i "s/jdbc.password=/jdbc.password=logicaldocpassword/g" logicaldoc/WEB-INF/classes/context.properties
sed -i "s/hibernate.dialect=org.hibernate.dialect.HSQLDialect/hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect/g" logicaldoc/WEB-INF/classes/context.properties


cd /usr/local/tomcat/bin/
./catalina.sh run
#cd /usr/local/tomcat/bin/
#sh startup.sh 

