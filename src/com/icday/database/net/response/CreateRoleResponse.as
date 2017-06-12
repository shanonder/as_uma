package com.icday.database.net.response {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.utils.ByteArray;
	public class CreateRoleResponse{
		/**
		 * 角色名字
		 */
		public var name:String;
		/**
		 * 职业
		 */
		public var profession:int;
		/**
		 * 返回状态（是否成功）
		 */
		public var state:int;
		public function CreateRoleResponse(bytes:ByteArray){
			name = bytes.readUTF();
			profession = bytes.readInt();
			state = bytes.readInt();
		}

	}
}