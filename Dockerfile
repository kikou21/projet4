FROM tomcat:8-jdk8-openjdk

ENV username logicaldocuser
ENV driver logicaldocdriver
ENV password logicaldocpassword
ENV dbms mysql

WORKDIR /usr/local/tomcat/webapps/
RUN mkdir logicaldoc
COPY script.sh /opt/script.sh
RUN chmod 750 /opt/script.sh
WORKDIR /usr/local/tomcat/webapps/logicaldoc
RUN wget https://www.dropbox.com/s/cf999m4djxm6m7z/logicaldoc.war
RUN jar -xvf logicaldoc.war
#RUN sed -i 's/jdbc.dbms\=hsqldb/jdbc.dbms\=mysql/g' /usr/local/tomcat/webapps/WEB-INF/classes/context.properties
#RUN sed -i "s/jdbc.driver\=org.hsqldb.jdbc.JDBCDriver/jdbc.driver\=com.mysql.jdbc.Driver/g" WEB-INF/classes/context.properties
#RUN sed -i "s/jdbc.url\=jdbc\:hsqldb\:mem\:logicaldoc/jdbc.url\=jdbc\:mysql\:\/\/localhost:3306\/logicaldoc/g" WEB-INF/classes/context.properties
#RUN sed -i "s/jdbc.username\=sa/jdbc.username\=logicaldocuser/g" WEB-INF/classes/context.properties
#RUN sed -i "s/jdbc.password\=/jdbc.username\=logicaldocpassword/g" WEB-INF/classes/context.properties
#RUN sed -i "s/hibernate.dialect\=org.hibernate.dialect.HSQLDialect/hibernate.dialect\=org.hibernate.dialect.MySQLDialect/g" WEB-INF/classes/context.properties
#ADD logicaldoc.war /usr/local/tomcat/webapps
#COPY logicaldoc.war /usr/local/tomcat/webapps
#EXPOSE 8081

#ADD server.xml /usr/local/tomcat/conf/

#WORKDIR /usr/local/tomcat/conf/

#RUN chmod +x server.xml

#RUN sed -i 's/<Connector port="8080"/<Connector port="8081"/g' server.xml

#WORKDIR /usr/local/tomcat/bin/

CMD /opt/script.sh


#RUN /usr/local/tomcat/bin/catalina.sh start
#RUN /usr/local/tomcat/bin/shutdown.sh
#RUN /usr/local/tomcat/bin/startup.sh
