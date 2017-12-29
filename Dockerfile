FROM centos:7.1.1503
MAINTAINER Saarthak Vats<saarthak.vats@mobikwik.com>

# prepare environment
COPY jdk /opt/jdk
COPY tomcat /opt/tomcat
COPY tomcats /etc/init.d/tomcat
COPY jenkins.war /opt/tomcat/webapps/ROOT.war
RUN chmod +x /etc/init.d/tomcat

# set env params
ENV CATALINA_HOME "/opt/tomcat" 
ENV CATALINA_BASE "/opt/tomcat" 
ENV JAVA_HOME "/opt/jdk" 
ENV PATH $JAVA_HOME/bin:$CATALINA_HOME/bin:$PATH
ENV TZ "Asia/Kolkata"
ENV LOG_FLUSH "false"
ENV JVM_OPTS ""


#create entry point script which would run on container launch
COPY entrypoint.sh /home

#expose port 8080 for host to allow incoming connections
EXPOSE 8080
#expose port 9999 for jxm port for host to connect to tomcat jvm in docker
EXPOSE 9999

# this will run tomcat on container start
ENTRYPOINT ["/home/entrypoint.sh"]

#CMD ["start"]
#CMD ["/opt/apache-tomcat-8.0.32/bin/catalina.sh", "run"]


