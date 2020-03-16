package hung.com.vertx;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Future;
import io.vertx.core.Vertx;


public class App2_Verticle_config_main extends AbstractVerticle {
	
	public static void main(String[] args) {
		Vertx vertx = Vertx.vertx();
		
		vertx.deployVerticle(new App2_Verticle_config_main());
	}

	@Override
	public void start(Future<Void> startFuture) throws Exception {	
		super.start();
		
		System.out.println(config().toString());
	}


}
