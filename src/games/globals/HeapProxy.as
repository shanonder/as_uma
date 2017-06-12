package games.globals
{
	import com.icday.database.net.consts.ProtocolConst;
	import com.icday.database.net.request.HeapRequest;
	import com.icday.database.net.response.HeapResponse;
	
	import flash.utils.ByteArray;
	
	import lib.Lib;

	public class HeapProxy
	{
		private static var _instance:HeapProxy;
		public static function get instance():HeapProxy{
			return _instance ||= new HeapProxy();
		}
		public function HeapProxy()
		{
			Lib.net.registClosure(ProtocolConst.HeapResponse,onHeap);
		}
		
		private function onHeap(cmd:int,status:int,bytes:ByteArray):void
		{
			var hrp:HeapResponse = new HeapResponse(bytes);
			trace(new Date(hrp.time));
			
		}
		
		public function start():void{
			App.timer.doLoop(30000,send);
			send();
		}
		
		private function send():void
		{
			Lib.net.sendRequest(new HeapRequest());
		}
	}
}