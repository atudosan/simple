FROM openjdk:8u191-jre-alpine3.8

#intalling curl and jq
RUN apk add curl jq

#workspace
WORKDIR usr/docker

#Add .jar file to the image
ADD target/selenium-docker.jar selenium-docker.jar
ADD target/selenium-docker-tests.jar selenium-docker-tests.jar
ADD target/libs libs

#Add files
#ADD src/test/resources/dataproviders	src/test/resources/dataproviders

#Add suite files
#ADD SignUpTestSuite.xml SignUpTestSuite.xml
#ADD NegativeLogInTests.xml NegativeLogInTests.xml
#ADD ValidateItemsFromShopingCartTests.xml ValidateItemsFromShopingCartTests.xml 
ADD facebook.xml facebook.xml
ADD google.xml   google.xml

# ADD health check script
RUN wget https://s3.amazonaws.com/selenium-docker/healthcheck/healthcheck.sh

ENTRYPOINT sh healthcheck.sh