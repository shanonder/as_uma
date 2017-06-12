package com.icday.util
{
	import com.icday.database.net.DataHash;
	
	import flash.utils.ByteArray;
	
	import avmplus.getQualifiedClassName;
	
	public class SocketDataUtil
	{
		public function SocketDataUtil()
		{
			
		}		
		public static function write( bytes:ByteArray, data:*):void{
			if(data == null){
				bytes.writeBoolean(false);
				return;
			}
			bytes.writeBoolean(true);
			var clazz:String = getQualifiedClassName(data.getClass());
			DataHash.ClassName2Write[clazz](bytes,data);
		}
		
		public static function read(bytes:ByteArray):*{
			var notNull:Boolean = bytes.readBoolean();
			if(notNull == false){
				return null;
			}
			return DataHash.Type2Read[bytes.readShort()](bytes);
		}
	}
}