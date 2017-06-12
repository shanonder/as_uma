package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * md5:48de6c395c61af6835561193f7f2a6db
	 */
	import flash.utils.ByteArray;
	public class UserInfo{
		/**
		 * 唯一ID
		 */
		public var insId:String;
		/**
		 * 角色列表
		 */
		public var roles:Array;
		/**
		 * 上次登录角色ID
		 */
		public var lastRoleId:String;

		public function UserInfo(){
			super();
		}

		public static function read(bytes :ByteArray , item : UserInfo):UserInfo{
			item.insId = bytes.readUTF();
			item.roles = bytes.readObject();
			item.lastRoleId = bytes.readUTF();
			return item;
		}

		public static function write(bytes :ByteArray , item : UserInfo):ByteArray{
			bytes.writeUTF(item.insId == null ?"" : item.insId);
			bytes.writeObject(item.roles);
			bytes.writeUTF(item.lastRoleId == null ?"" : item.lastRoleId);
			return bytes;
		}

	}
}