FROM openjdk:8u191-jre-alpine3.8

#intalling curl and jq
RUN apk add curl jq

#workspace
WORKDIR usr/docker

#Add .jar file to the image
ADD target/simlpe-docker.jar simlpe-docker.jar
ADD target/simlpe-docker-tests.jar simlpe-docker-tests.jar
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
RUN wget https://s3.amazonaws.com/simple-docker/healthcheck/healthcheck.sh

ENTRYPOINT sh healthcheck.sh