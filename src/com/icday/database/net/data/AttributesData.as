package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * 属性
	 * md5:f67d8abd5c0270cf2983938580c6b3f7
	 */
	import flash.utils.ByteArray;
	public class AttributesData{
		/**
		 * 配置表ID
		 */
		public var cfgId:int;
		public var value:Number;

		public function AttributesData(){
			super();
		}

		public static function read(bytes :ByteArray , data : AttributesData):AttributesData{
			data.cfgId = bytes.readInt();
			data.value = bytes.readDouble();
			return data;
		}

		public static function write(bytes :ByteArray , data : AttributesData):ByteArray{
			bytes.writeInt(data.cfgId);
			bytes.writeDouble(data.value);
			return bytes;
		}

	}
}