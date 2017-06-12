package com.icday.database.net.response {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.utils.ByteArray;
	public class LoginGateResponse{
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
		public function LoginGateResponse(bytes:ByteArray){
			uid = bytes.readUTF();
			token = bytes.readUTF();
			server = bytes.readUTF();
			port = bytes.readInt();
		}

	}
}