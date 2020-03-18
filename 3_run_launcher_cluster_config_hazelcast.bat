:: run with EasyShell in eclipse
:: neu co exception va thieu lib thi cmd window of EasyShell se close ngay
:: dung lenh "pause" window lai de xem exception
:: user default cluster config with Hazelcast ( -cluster -ha )
java -Dvertx.hazelcast.config=./src/config/cluster.xml -jar ./target/vertx-docker-config-launcher.jar -cluster -conf ./src/config/local.json
pause