FROM openjdk:8u191-jre-alpine3.8

#intalling curl and jq
RUN apk add curl jq

#workspace
WORKDIR usr/docker

#Add .jar file to the image
ADD target/simple-docker.jar simple-docker.jar
ADD target/simple-docker-tests.jar simple-docker-tests.jar
ADD target/libs libs

#Add files
#ADD src/test/resources/dataproviders	src/test/resources/dataproviders

#Add suite files
ADD google.xml   google.xml
ADD facebook.xml  facebook.xml

# ADD health check script
ADD healthcheck.sh		healthcheck.sh
RUN dos2unix healthcheck.sh
#RUN wget https://s3.amazonaws.com/selenium-docker/healthcheck/healthcheck.sh

ENTRYPOINT sh healthcheck.sh
#ENTRYPOINT java -cp simple-docker.jar:simple-docker-tests.jar:libs/* -DHUB_HOST=$HUB_HOST -DBROWSER=$BROWSER  org.testng.TestNG google.xml