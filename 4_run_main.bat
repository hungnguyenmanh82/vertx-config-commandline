:: run with EasyShell in eclipse
:: neu co exception va thieu lib thi cmd window of EasyShell se close ngay
:: dung lenh "pause" window lai de xem exception
:: java <java_argument> -jar <*.jar> <app_params>
:: copy "local.json" vào "target" để run
java -jar ./target/vertx-docker-config-main.jar -conf ./src/config/local.json
:: lenh nay de CMD window ko bi close khi gap error
pause