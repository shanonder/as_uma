package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * md5:f67d8abd5c0270cf2983938580c6b3f7
	 */
	import flash.utils.ByteArray;
	import com.icday.util.ArrayUtil;
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

		public static function read(bytes :ByteArray , data : RoleData):RoleData{
			data.insId = bytes.readUTF();
			data.cfgId = bytes.readInt();
			data.name = bytes.readUTF();
			data.level = bytes.readInt();
			data.exp = bytes.readDouble();
			data.attributes = ArrayUtil.read(bytes);
			return data;
		}

		public static function write(bytes :ByteArray , data : RoleData):ByteArray{
			bytes.writeUTF(data.insId == null ?"" : data.insId);
			bytes.writeInt(data.cfgId);
			bytes.writeUTF(data.name == null ?"" : data.name);
			bytes.writeInt(data.level);
			bytes.writeDouble(data.exp);
			ArrayUtil.write(bytes ,data.attributes);
			return bytes;
		}

	}
}