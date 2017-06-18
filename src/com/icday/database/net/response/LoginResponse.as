package com.icday.database.net.response {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.utils.ByteArray;
	public class LoginResponse{
		/**
		 * 登录平台
		 */
		public var platId:int;
		/**
		 * 服务器ID
		 */
		public var serverId:int;
		/**
		 * 玩家第三方ID
		 */
		public var openId:String;
		/**
		 * 通行证
		 */
		public var token:String;
		/**
		 * 玩家ID
		 */
		public var uid:String;
		public function LoginResponse(bytes:ByteArray){
			platId = bytes.readShort();
			serverId = bytes.readInt();
			openId = bytes.readUTF();
			token = bytes.readUTF();
			uid = bytes.readUTF();
		}

	}
}