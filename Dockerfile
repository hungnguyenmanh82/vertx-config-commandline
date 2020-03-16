FROM java:8-jre

# ENV của dockerfile, ko phải của Linux container
ENV VERTICLE_FILE target/api-gateway-fat.jar
ENV VERTICLE_HOME /opt/verticles

EXPOSE 8787

# COPY <SRC-host> <DST-container>
COPY $VERTICLE_FILE $VERTICLE_HOME/

# "/" = root on linux
# "src/"  = relative path from Dockerfile = ./src/
COPY src/config/docker.json $VERTICLE_HOME/

# linux commandline đứng tại WORKDIR on Container to run
WORKDIR $VERTICLE_HOME
ENTRYPOINT ["sh", "-c"]

#CMD ["java -jar vertx-docker-config-fat.jar -cluster -ha -conf docker.json"]
CMD ["java -jar vertx-docker-config-0.0.1-fat.jar -conf ../src/config/docker.json"]
