#!/bin/bash

echo 'in webapps'

/etc/init.d/tomcat start

echo 'tomcat started'

# The container will run as long as the script is running, that's why
# we need something long-lived here
#exec tail -f /opt/apache-tomcat-8.0.32/logs/catalina.out
while true
do
tail -f /dev/null & wait ${!}
done

#exec bash

