package com.icday.database.net.response {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.utils.ByteArray;
	import com.icday.util.SocketDataUtil;
	import com.icday.database.net.data.RoleData;
	import com.icday.util.ArrayUtil;
	public class EnterWorldResponse{
		/**
		 * 角色
		 */
		public var role:RoleData;
		/**
		 * 背包数据
		 */
		public var packs:Array;
		/**
		 * 开启模块
		 */
		public var modules:Array;
		/**
		 * 自定义保存参数
		 */
		public var customize:String;
		public function EnterWorldResponse(bytes:ByteArray){
			role = SocketDataUtil.read(bytes);
			packs = ArrayUtil.read(bytes);
			modules = ArrayUtil.read(bytes);
			customize = bytes.readUTF();
		}

	}
}