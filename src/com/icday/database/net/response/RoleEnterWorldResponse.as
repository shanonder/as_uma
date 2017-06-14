package com.icday.database.net.response {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.utils.ByteArray;
	import com.icday.util.SocketDataUtil;
	import com.icday.database.net.data.RoleData;
	public class RoleEnterWorldResponse{
		public var mapId:int;
		public var posX:Number;
		public var posY:Number;
		/**
		 * 角色信息
		 */
		public var role:RoleData;
		public function RoleEnterWorldResponse(bytes:ByteArray){
			mapId = bytes.readShort();
			posX = bytes.readDouble();
			posY = bytes.readDouble();
			role = SocketDataUtil.read(bytes);
		}

	}
}