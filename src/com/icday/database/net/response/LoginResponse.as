package com.icday.database.net.response {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.utils.ByteArray;
	import com.icday.util.ArrayUtil;
	public class LoginResponse{
		/**
		 * 玩家ID
		 */
		public var uid:String;
		/**
		 * 通行证
		 */
		public var token:String;
		/**
		 * 地址
		 */
		public var server:String;
		/**
		 * 端口
		 */
		public var port:int;
		/**
		 * 角色列表
		 */
		public var roles:Array;
		/**
		 * 上次登录角色ID
		 */
		public var lastRoleId:String;
		public function LoginResponse(bytes:ByteArray){
			uid = bytes.readUTF();
			token = bytes.readUTF();
			server = bytes.readUTF();
			port = bytes.readInt();
			roles = ArrayUtil.read(bytes);
			lastRoleId = bytes.readUTF();
		}

	}
}