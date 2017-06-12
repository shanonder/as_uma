package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * 物品
	 * md5:f67d8abd5c0270cf2983938580c6b3f7
	 */
	import flash.utils.ByteArray;
	public class ItemData{
		/**
		 * 唯一ID
		 */
		public var insId:String;
		/**
		 * 配置表ID
		 */
		public var cfgId:int;
		/**
		 * 分类
		 */
		public var type:String;
		/**
		 * 创建时间
		 */
		public var createTime:Number;

		public function ItemData(){
			super();
		}

		public static function read(bytes :ByteArray , item : ItemData):ItemData{
			item.insId = bytes.readUTF();
			item.cfgId = bytes.readInt();
			item.type = bytes.readUTF();
			item.createTime = bytes.readDouble();
			return item;
		}

		public static function write(bytes :ByteArray , item : ItemData):ByteArray{
			bytes.writeUTF(item.insId == null ?"" : item.insId);
			bytes.writeInt(item.cfgId);
			bytes.writeUTF(item.type == null ?"" : item.type);
			bytes.writeDouble(item.createTime);
			return bytes;
		}

	}
}