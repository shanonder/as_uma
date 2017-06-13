package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * md5:ac352a15447c1ae09498de3779e371de
	 */
	import flash.utils.ByteArray;
	import com.icday.database.net.data.ItemData;
	import com.icday.util.SocketDataUtil;
	public class GridData{
		/**
		 * 序号
		 */
		public var index:int;
		/**
		 * 唯一ID
		 */
		public var item:ItemData;

		public function GridData(){
			super();
		}

		public static function read(bytes :ByteArray , data : GridData = null):GridData{
			data ||= new GridData();
			data.index = bytes.readShort();
			data.item = SocketDataUtil.read(bytes);
			return data;
		}

		public static function write(bytes :ByteArray , data : GridData):ByteArray{
			bytes.writeShort(data.index);
			SocketDataUtil.write(bytes , data.item);
			return bytes;
		}

	}
}