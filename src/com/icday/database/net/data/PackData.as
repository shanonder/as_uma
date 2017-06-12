package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * md5:f67d8abd5c0270cf2983938580c6b3f7
	 */
	import flash.utils.ByteArray;
	public class PackData{
		/**
		 * 唯一ID
		 */
		public var type:int;
		/**
		 * 开启长度
		 */
		public var openLength:int;
		public var itemList:Array;

		public function PackData(){
			super();
		}

		public static function read(bytes :ByteArray , item : PackData):PackData{
			item.type = bytes.readShort();
			item.openLength = bytes.readShort();
			item.itemList = bytes.readObject();
			return item;
		}

		public static function write(bytes :ByteArray , item : PackData):ByteArray{
			bytes.writeShort(item.type);
			bytes.writeShort(item.openLength);
			bytes.writeObject(item.itemList);
			return bytes;
		}

	}
}