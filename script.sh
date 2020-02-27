#!/bin/sh

sleep 10

cd /usr/local/tomcat/webapps/

sed -i 's/jdbc.dbms=hsqldb/jdbc.dbms=mysql/g' logicaldoc/WEB-INF/classes/context.properties
sed -i "s/jdbc.driver=org.hsqldb.jdbc.JDBCDriver/jdbc.driver=com.mysql.jdbc.Driver/g" logicaldoc/WEB-INF/classes/context.properties
sed -i "s/jdbc.url=.*/jdbc.url=jdbc:mysql:\/\/app_mysql:3306\/logicaldoc/g" logicaldoc/WEB-INF/classes/context.properties
sed -i "s/jdbc.username=sa/jdbc.username=logicaldocuser/g" logicaldoc/WEB-INF/classes/context.properties
sed -i "s/jdbc.password=/jdbc.password=logicaldocpassword/g" logicaldoc/WEB-INF/classes/context.properties
sed -i "s/hibernate.dialect=org.hibernate.dialect.HSQLDialect/hibernate.dialect=org.hibernate.dialect.MySQLDialect/g" logicaldoc/WEB-INF/classes/context.properties


cd /usr/local/tomcat/bin/
./catalina.sh run
#cd /usr/local/tomcat/bin/
#sh startup.sh 

