package hung.com.vertx;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Future;
import io.vertx.core.Vertx;
import io.vertx.core.json.JsonObject;

/**
https://vertx.io/docs/vertx-core/java/#_the_vertx_command_line
 xem pom.xml mới hiểu đc
 run commandline from Target folder:
 	>java -jar vertx-docker-config-starter.jar -conf ../src/config/local.json
 	
 	>java -jar vertx-docker-config-launcher.jar -conf ../src/config/local.json
 	
 	>java -jar vertx-docker-config-main.jar -conf ../src/config/local.json   => ko chạy đc
 */

/**
io.vertx.core.Launcher và io.vertx.core.Starter dùng như nhau.
io.vertx.core.Starter: đã deprecated rồi. Nhưng các vd trên github dùng nhiều.
io.vertx.core.Launcher: nên dùng. 
 */
// io.vertx.core.Starter.main() will deploy this Vertical lấy config Vertx từ commandline
public class App2_Verticle_config_main extends AbstractVerticle {
	
	public static void main(String[] args) {
		
		System.out.println("============================= args: ");
		for (int i = 0; i < args.length; i++) {
			System.out.println(args[i]);
		}
		
		//
		Vertx vertx = Vertx.vertx();
		
		// Deploy ở source code sẽ ko lấy đc commandline config, vì ta ko dùng launcher, starter class.
		vertx.deployVerticle(new App2_Verticle_config_main());
	}

	@Override
	public void start(Future<Void> startFuture) throws Exception {	
		super.start();
		
		/**
		 * Vertx có thư viện riêng để lấy config từ: file json, env, system, http restful...=> tiện hơn dùng commandline
		 *  
		 */
		
		// cách này ko dùng launcher hay Starter nên ko load đc config từ commandline
		JsonObject jsonConfig = config();
		System.out.println("============================ vertx config(): ");
		System.out.println(jsonConfig.encodePrettily()); // show json pretty
	}


}
