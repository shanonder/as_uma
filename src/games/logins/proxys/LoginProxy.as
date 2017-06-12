package games.logins.proxys
{
	import com.icday.database.net.consts.ProtocolConst;
	import com.icday.database.net.request.LoginRequest;
	import com.icday.database.net.response.LoginResponse;
	import com.icday.mvcs.Context;
	import com.icday.mvcs.ModelBase;
	import com.icday.net.socket.ErrorHandler;
	
	import flash.utils.ByteArray;
	
	import games.globals.ContextEvent;
	import games.globals.Global;
	import games.globals.HeapProxy;
	
	import lib.Lib;
	
	import morn.core.handlers.Handler;

	public class LoginProxy extends ModelBase
	{
		public static const LoginSuccess:String = "LoginSucess";
		private static var _instance:LoginProxy;
		public static function get instance():LoginProxy{
			return _instance ||= new LoginProxy();
		}
		
		private var username:String;
		private var password:String;
		
		public function LoginProxy()
		{
			super();
		}
		
		override protected function init():void
		{
			addClosure(ProtocolConst.LoginResponse,onGameLogin);
		}
		
		
		private function onGameLogin(cmd:int,status:int,bytes:ByteArray):void
		{
			if(status == 200){
				dispatch(LoginSuccess);
				var login:LoginResponse = new LoginResponse(bytes);
				if(login.roles == null || login.roles.length == 0){
					Context.instance.dispatch(ContextEvent.CREATE_ROLE);
				}
				Lib.net.connectHandler = new Handler(onGameConnect);
			}
		}		
		
//		private function onGateLogin(cmd:int,status:int,bytes:ByteArray):void
//		{
//			if(status == 200){
//				var login:LoginGateResponse = new LoginGateResponse(bytes);
//				Lib.net.connectHandler = new Handler(onGameConnect);
//				Lib.net.connect(login.address,login.port);
//				Global.passKey = login.passKey;
//			}
//		}
		
		private function onGameConnect(host:String,port:int):void
		{
			Lib.net.connectHandler = null;
			HeapProxy.instance.start();
			if(Global.passKey){
				Lib.net.sendRequest(new LoginRequest(Global.passKey,Global.token,Global.platform));
			}
		}
		
		private function onLoginConnect(host:String,port:int):void
		{
			Lib.net.sendRequest(new LoginGateRequest(username,password));
		}
		 
		public function login(user:String,pwd:String):void{
			Lib.net.connectHandler = new Handler(onLoginConnect);
			Lib.net.closeHandler = new LoginCloseHandler();
			Lib.net.errorHandler = new ErrorHandler(); 
			username = user;
			password = pwd;
			Lib.net.connect("127.0.0.1",3004);
		}
	}
}