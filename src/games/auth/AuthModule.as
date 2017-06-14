package games.auth
{
	import com.icday.database.net.consts.ProtocolConst;
	import com.icday.database.net.request.HeapRequest;
	import com.icday.database.net.response.HeapResponse;
	import com.icday.mvcs.Context;
	import com.icday.mvcs.IModule;
	import com.icday.mvcs.ModuleBase;
	
	import flash.utils.ByteArray;
	
	import games.globals.ContextEvent;
	
	import lib.Lib;

	public class AuthModule extends ModuleBase implements IModule
	{
		public function AuthModule()
		{
		}
		
		override public function startup():void
		{
			addClosure(ProtocolConst.LoginResponse,onGameLogin);
			addClosure(ProtocolConst.HeapResponse,onHeap);
		}
		private function onHeap(cmd:int,status:int,bytes:ByteArray):void
		{
			var hrp:HeapResponse = new HeapResponse(bytes);
			App.timer.doLoop(30000,send);
			
		}
		
		private function send():void
		{
			Lib.net.sendRequest(new HeapRequest());
		}
		
		private function onGameLogin(cmd:int,status:int,bytes:ByteArray):void
		{
			trace("AuthModule.onGameLogin(cmd, status, bytes)" , status);
			
			if(status == 200){
				trace("loginSuccess");
			}
			if(status == 201){
				Context.instance.dispatch(ContextEvent.CREATE_ROLE);
			}
		}
		
	}
}