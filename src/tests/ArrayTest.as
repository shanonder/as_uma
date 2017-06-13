package tests
{
	import com.greensock.events.LoaderEvent;
	import com.icday.database.net.data.EquipData;
	import com.icday.util.ArrayUtil;
	import com.icday.util.SocketDataUtil;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	public class ArrayTest extends Sprite
	{
		public function ArrayTest()
		{
			super();
			var load:URLLoader = new URLLoader();
			load.dataFormat = URLLoaderDataFormat.BINARY;
			load.addEventListener(LoaderEvent.COMPLETE,onComplete);
			load.load(new URLRequest("C:/workspaces/datas/test/datatest.dat"));
		}
		
		protected function onComplete(event:Event):void
		{
			var bytes:ByteArray = event.currentTarget.data;
			var arr:Array = ArrayUtil.read(bytes);
			var obj1:EquipData = SocketDataUtil.read(bytes);
			var obj2:EquipData = SocketDataUtil.read(bytes);
			
		}
	}
}