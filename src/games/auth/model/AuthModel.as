package games.auth.model
{
	import com.icday.database.net.request.LoginRequest;
	import com.icday.mvcs.ModelBase;
	
	import games.globals.Global;
	
	import lib.Lib;
	
	import morn.core.handlers.Handler;

	public class AuthModel extends ModelBase
	{
		public static const LoginSuccess:String = "LoginSucess";
		private static var _instance:AuthModel;
		public static function get instance():AuthModel{
			return _instance ||= new AuthModel();
		}
		
		private var username:String;
		private var password:String;
		
		public function AuthModel()
		{
			super();
		}
		
		override protected function init():void
		{
		}
		
		
		public function login():void{
			Lib.net.connectHandler = new Handler(onLoginConnect);
			Lib.net.connect(Global.domain,Global.port);
		}
		

		
		private function onLoginConnect(host:String,port:int):void
		{
			Lib.net.sendRequest(new LoginRequest(Global.platId,Global.serverid , Global.appKey, Global.token));
		}
		 
	}
}