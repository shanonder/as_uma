package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * 武器
	 * md5:f67d8abd5c0270cf2983938580c6b3f7
	 */
	import flash.utils.ByteArray;
	public class EquipData extends ItemData{
		/**
		 * 唯一ID
		 */
		public var strenthLv:int;
		/**
		 * 属性
		 */
		public var attributes:Array;

		public function EquipData(){
			super();
		}

		public static function read(bytes :ByteArray , item : EquipData):EquipData{
			ItemData.read(bytes , item);
			item.strenthLv = bytes.readInt();
			item.attributes = bytes.readObject();
			return item;
		}

		public static function write(bytes :ByteArray , item : EquipData):ByteArray{
			ItemData.write(bytes , item);
			bytes.writeInt(item.strenthLv);
			bytes.writeObject(item.attributes);
			return bytes;
		}

	}
}