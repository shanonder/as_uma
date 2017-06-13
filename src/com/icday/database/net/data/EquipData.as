package com.icday.database.net.data {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 * 武器
	 * md5:ac352a15447c1ae09498de3779e371de
	 */
	import flash.utils.ByteArray;
	import com.icday.util.ArrayUtil;
	public class EquipData extends ItemData{
		/**
		 * 唯一ID
		 */
		public var strenthLv:int;
		/**
		 * 属性
		 */
		public var attributes:Array;

		public function EquipData(){
			super();
		}

		public static function read(bytes :ByteArray , data : EquipData = null):EquipData{
			data ||= new EquipData();
			ItemData.read(bytes , data);
			data.strenthLv = bytes.readInt();
			data.attributes = ArrayUtil.read(bytes);
			return data;
		}

		public static function write(bytes :ByteArray , data : EquipData):ByteArray{
			ItemData.write(bytes , data);
			bytes.writeInt(data.strenthLv);
			ArrayUtil.write(bytes ,data.attributes);
			return bytes;
		}

	}
}