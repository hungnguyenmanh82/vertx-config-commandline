FROM openjdk:8-jre-alpine

# ENV của dockerfile, ko phải của Linux container
ENV VERTICLE_FILE target/vertx-docker-config-main.jar
ENV VERTICLE_HOME /opt/verticles

# COPY <SRC-host> <DST-container>
COPY $VERTICLE_FILE $VERTICLE_HOME/

# "/" = root on linux
# "src/"  = relative path from Dockerfile = ./src/
COPY src/config/docker.json $VERTICLE_HOME/

# linux commandline đứng tại WORKDIR on Container to run
WORKDIR $VERTICLE_HOME

#=================================================================
# cach1 (hay dùng):  after container linux starting, run ENTRYPOINT
# nếu ko khai báo mục này thì mặc định ENTRYPOINT = bash với linux và sh với Alpine
# chú ý giá trị options trong double quote ko đc chứa whitespace => nếu chứa thì phải tách ra options mới
# nếu có nhiều ENTRYPOINT thì chỉ cái sau cùng chạy
# []: là array 
#ENTRYPOINT ["sh", "-c"]
ENTRYPOINT ["java", "-jar", "vertx-docker-config-main.jar", "-conf", "../src/config/docker.json"]


# =======================================================================
#cach2(ít dùng): 
# CMD chạy trên nền của EntryPoint (có nghĩa nó là params của EntryPoint)
# thường sẽ để JavaApp ở ENTRYPOINT và params ở command của docker-compose.yaml
# vd: ElasticSearch, Prometheus đều dùng theo cách này: để App ở ENTRYPOINT
# nếu có nhiều lệnh CMD thì chỉ lệnh sau cùng đc run (các lệnh khác bị bỏ qua => đã tested)
# lý do là vì Dockerfile extend đc Image (sẽ loại trừ các CMD trc đó trong Image)
#CMD ["java -jar vertx-docker-config-Launcher.jar -cluster -ha -conf docker.json"]
#CMD ["java -jar vertx-docker-config-main.jar -conf ../src/config/docker.json"]

# =========================================================================
# cách 3: khai báo CMD ở docker-compose.yaml
# cách này giống cách 2. Lệnh CMD trong docker-compose.yaml là lệnh sau cùng sẽ đc ưu tiên trc
# thông thường dùng cách 1 kết hợp với cách 3
# thường sẽ để JavaApp ở ENTRYPOINT và params ở command của docker-compose.yaml
# vd: ElasticSearch, Prometheus đều dùng theo cách này: để App ở ENTRYPOINT 