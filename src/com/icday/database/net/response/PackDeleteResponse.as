package com.icday.database.net.response {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.utils.ByteArray;
	public class PackDeleteResponse{
		/**
		 * 包裹类型
		 */
		public var type:int;
		/**
		 * 包裹索引
		 */
		public var index:int;
		/**
		 * 包裹物品唯一ID(检查用)
		 */
		public var insId:String;
		public function PackDeleteResponse(bytes:ByteArray){
			type = bytes.readShort();
			index = bytes.readShort();
			insId = bytes.readUTF();
		}

	}
}