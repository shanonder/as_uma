package com.icday.database.net.response {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.utils.ByteArray;
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
		 * 登录平台
		 */
		public var platform:String;
		public function LoginResponse(bytes:ByteArray){
			uid = bytes.readUTF();
			token = bytes.readUTF();
			platform = bytes.readUTF();
		}

	}
}