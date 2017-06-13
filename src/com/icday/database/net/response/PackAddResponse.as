package com.icday.database.net.response {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.utils.ByteArray;
	import com.icday.util.SocketDataUtil;
	import com.icday.database.net.data.ItemData;
	public class PackAddResponse{
		/**
		 * 包裹类型
		 */
		public var type:int;
		/**
		 * 包裹索引
		 */
		public var index:int;
		/**
		 * 物品
		 */
		public var item:ItemData;
		public function PackAddResponse(bytes:ByteArray){
			type = bytes.readShort();
			index = bytes.readShort();
			item = SocketDataUtil.read(bytes);
		}

	}
}