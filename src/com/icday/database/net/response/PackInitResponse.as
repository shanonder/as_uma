package com.icday.database.net.response {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.utils.ByteArray;
	import com.icday.util.ArrayUtil;
	public class PackInitResponse{
		public var packs:Array;
		public function PackInitResponse(bytes:ByteArray){
			packs = ArrayUtil.read(bytes);
		}

	}
}