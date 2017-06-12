package com.icday.database.net.response {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.utils.ByteArray;
	public class HeapResponse{
		/**
		 * 当前时间
		 */
		public var time:Number;
		public function HeapResponse(bytes:ByteArray){
			time = bytes.readDouble();
		}

	}
}