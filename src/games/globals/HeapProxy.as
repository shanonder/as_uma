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
			
		}

	}
}