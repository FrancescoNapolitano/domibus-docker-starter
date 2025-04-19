FROM tomcat:9-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

ENV CATALINA_HOME=/usr/local/tomcat
ENV CATALINA_TMPDIR=/usr/local/tomcat/temp

ENV JAVA_OPTS="-Xms128m -Xmx1024m"
ENV JAVA_OPTS="$JAVA_OPTS -Ddomibus.config.location=$CATALINA_HOME/conf/domibus"
ENV JAVA_OPTS="$JAVA_OPTS -Ddomibus.node.id=efti-gate-ita"

COPY domibus.war /usr/local/tomcat/webapps/ROOT.war

COPY mysql-connector-j-9.3.0.jar /usr/local/tomcat/lib/

EXPOSE 8080

CMD ["catalina.sh", "run"]