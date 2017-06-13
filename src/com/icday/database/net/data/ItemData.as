package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * 物品
	 * md5:ac352a15447c1ae09498de3779e371de
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

		public static function read(bytes :ByteArray , data : ItemData = null):ItemData{
			data ||= new ItemData();
			data.insId = bytes.readUTF();
			data.cfgId = bytes.readInt();
			data.type = bytes.readUTF();
			data.createTime = bytes.readLong();
			return data;
		}

		public static function write(bytes :ByteArray , data : ItemData):ByteArray{
			bytes.writeUTF(data.insId == null ?"" : data.insId);
			bytes.writeInt(data.cfgId);
			bytes.writeUTF(data.type == null ?"" : data.type);
			bytes.writeDouble(data.createTime);
			return bytes;
		}

	}
}