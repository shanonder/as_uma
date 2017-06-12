package com.icday
{
	import com.icday.database.net.data.GridData;
	
	import flash.utils.ByteArray;

	public class ArrayUtil
	{
		public function ArrayUtil()
		{
		}
		
		public static function decode(bytes:ByteArray,cellClazz:Class,cellDecoder:Function):Array{
			var isNull:Boolean = bytes.readBoolean();
			if(isNull == false){
				var len:uint = bytes.readShort();
				var arr:Array = new Array(len); 
				var count:uint = bytes.readShort();
				for(var i:int = 0 ; i < count ; ++i){
					var index:uint = bytes.readShort();
					arr = cellDecoder(bytes,new cellClazz());
				}
			}
			return arr;
		}
		
		public static function encode(arr:Array,bytes:ByteArray,clazz:Class):void{
			bytes.writeBoolean(arr);
			if(arr){
				bytes.writeShort(arr.length);
				var pos:uint = bytes.position;
				bytes.writeShort(0);
				var count:int = 0;
				for(var i:int = 0 ,lenth:int = arr.length; i < lenth ; ++i){
					if(arr[i] != null){
						GridData.encode(arr[i],bytes);
						count ++;
					}
				}
				bytes.position = pos;
				bytes.writeShort(count);
				bytes.position = bytes.bytesAvailable;
			}
		}
	}
}