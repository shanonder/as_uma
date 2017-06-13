package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * 属性
	 * md5:ac352a15447c1ae09498de3779e371de
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

		public static function read(bytes :ByteArray , data : AttributesData = null):AttributesData{
			data ||= new AttributesData();
			data.cfgId = bytes.readInt();
			data.value = bytes.readLong();
			return data;
		}

		public static function write(bytes :ByteArray , data : AttributesData):ByteArray{
			bytes.writeInt(data.cfgId);
			bytes.writeDouble(data.value);
			return bytes;
		}

	}
}