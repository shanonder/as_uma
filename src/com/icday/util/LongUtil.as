package com.icday.util
{
	import flash.utils.ByteArray;

	public class LongUtil
	{
		public function LongUtil()
		{
		}
		
		public static function write(bytes:ByteArray , bigInt:BigInt):void
		{
			bigInt ||= new BigInt();
			const zeros:String = "00000000";
			var str:String = bigInt.toStringBase(16);
			str = zeros.substr(0,16-str.length)+str;
			bytes.writeUnsignedInt(parseInt(str.substr(0,8),16));
			bytes.writeUnsignedInt(parseInt(str.substr(8,8),16));
		}
		
		public static function read(bytes:ByteArray):BigInt
		{
			const zeros:String = "00000000";
			var s:String = bytes.readUnsignedInt().toString(16);
			var str:String = zeros.substr(0,8-s.length) + s;
			s = bytes.readUnsignedInt().toString(16);
			str += zeros.substr(0,8-s.length) + s ;
			return new BigInt("0x" + str);
		}
	}
}