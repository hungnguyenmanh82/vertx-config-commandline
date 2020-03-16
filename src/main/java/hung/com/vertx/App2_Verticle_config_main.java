package hung.com.vertx;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Future;
import io.vertx.core.Vertx;


public class App2_Verticle_config_main extends AbstractVerticle {
	
	public static void main(String[] args) {
		Vertx vertx = Vertx.vertx();
		
		// Deploy ở source code sẽ ko lấy đc commandline config, vì ta ko dùng launcher, starter class.
		vertx.deployVerticle(new App2_Verticle_config_main());
	}

	@Override
	public void start(Future<Void> startFuture) throws Exception {	
		super.start();
		// có thư viện riêng để lấy config từ file, env, system, http,...=> tiện hơn
		System.out.println(config().toString());
	}


}
