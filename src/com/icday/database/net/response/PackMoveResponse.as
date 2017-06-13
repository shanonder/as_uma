package com.icday.database.net.response {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.utils.ByteArray;
	public class PackMoveResponse{
		/**
		 * 移动源包裹类型
		 */
		public var type0:int;
		/**
		 * 移动源包裹索引
		 */
		public var index0:int;
		/**
		 * 移动源包裹物品唯一ID
		 */
		public var insId0:String;
		/**
		 * 移动目标包裹类型
		 */
		public var type1:int;
		/**
		 * 移动目标包裹索引
		 */
		public var index1:int;
		/**
		 * 移动目标包裹物品唯一ID
		 */
		public var insId1:String;
		public function PackMoveResponse(bytes:ByteArray){
			type0 = bytes.readShort();
			index0 = bytes.readShort();
			insId0 = bytes.readUTF();
			type1 = bytes.readShort();
			index1 = bytes.readShort();
			insId1 = bytes.readUTF();
		}

	}
}