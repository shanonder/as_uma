package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * md5:f67d8abd5c0270cf2983938580c6b3f7
	 */
	import flash.utils.ByteArray;
	import com.icday.database.net.data.ItemData;
	public class GridData{
		/**
		 * 序号
		 */
		public var index:int;
		/**
		 * 唯一ID
		 */
		public var item:ItemData;

		public function GridData(){
			super();
		}

		public static function read(bytes :ByteArray , item : GridData):GridData{
			item.index = bytes.readShort();
			item.item = bytes.readObject();
			return item;
		}

		public static function write(bytes :ByteArray , item : GridData):ByteArray{
			bytes.writeShort(item.index);
			bytes.writeObject(item.item);
			return bytes;
		}

	}
}