FROM openjdk:8-jre-alpine

# ENV của dockerfile, ko phải của Linux container
ENV VERTICLE_FILE target/vertx-docker-config-Launcher.jar
ENV VERTICLE_HOME /opt/verticles

# COPY <SRC-host> <DST-container>
COPY $VERTICLE_FILE $VERTICLE_HOME/

# "/" = root on linux
# "src/"  = relative path from Dockerfile = ./src/
COPY src/config/docker.json $VERTICLE_HOME/

# linux commandline đứng tại WORKDIR on Container to run
WORKDIR $VERTICLE_HOME
# sh = bash dùng để run CMD command
ENTRYPOINT ["sh", "-c"]

# run bash commands:
#CMD ["java -jar vertx-docker-config-Launcher.jar -cluster -ha -conf docker.json"]
CMD ["java -jar vertx-docker-config-Launcher.jar -conf ../src/config/docker.json"]
