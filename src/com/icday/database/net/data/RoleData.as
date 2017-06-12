package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * md5:f67d8abd5c0270cf2983938580c6b3f7
	 */
	import flash.utils.ByteArray;
	public class RoleData{
		/**
		 * 唯一ID
		 */
		public var insId:String;
		/**
		 * 配置表ID
		 */
		public var cfgId:int;
		/**
		 * 姓名
		 */
		public var name:String;
		/**
		 * 等级
		 */
		public var level:int;
		/**
		 * 经验
		 */
		public var exp:Number;
		/**
		 * 属性
		 */
		public var attributes:Array;

		public function RoleData(){
			super();
		}

		public static function read(bytes :ByteArray , item : RoleData):RoleData{
			item.insId = bytes.readUTF();
			item.cfgId = bytes.readInt();
			item.name = bytes.readUTF();
			item.level = bytes.readInt();
			item.exp = bytes.readDouble();
			item.attributes = bytes.readObject();
			return item;
		}

		public static function write(bytes :ByteArray , item : RoleData):ByteArray{
			bytes.writeUTF(item.insId == null ?"" : item.insId);
			bytes.writeInt(item.cfgId);
			bytes.writeUTF(item.name == null ?"" : item.name);
			bytes.writeInt(item.level);
			bytes.writeDouble(item.exp);
			bytes.writeObject(item.attributes);
			return bytes;
		}

	}
}