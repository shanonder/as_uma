package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * md5:ac352a15447c1ae09498de3779e371de
	 */
	import flash.utils.ByteArray;
	import com.icday.util.ArrayUtil;
	public class RoleData{
		/**
		 * 唯一ID
		 */
		public var insId:String;
		/**
		 * 职业ID
		 */
		public var profId:int;
		/**
		 * 服务器ID
		 */
		public var serverId:int;
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

		public static function read(bytes :ByteArray , data : RoleData = null):RoleData{
			data ||= new RoleData();
			data.insId = bytes.readUTF();
			data.profId = bytes.readInt();
			data.serverId = bytes.readShort();
			data.name = bytes.readUTF();
			data.level = bytes.readInt();
			data.exp = bytes.readLong();
			data.attributes = ArrayUtil.read(bytes);
			return data;
		}

		public static function write(bytes :ByteArray , data : RoleData):ByteArray{
			bytes.writeUTF(data.insId == null ?"" : data.insId);
			bytes.writeInt(data.profId);
			bytes.writeShort(data.serverId);
			bytes.writeUTF(data.name == null ?"" : data.name);
			bytes.writeInt(data.level);
			bytes.writeDouble(data.exp);
			ArrayUtil.write(bytes ,data.attributes);
			return bytes;
		}

	}
}