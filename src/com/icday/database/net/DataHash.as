package com.icday.database.net {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import com.icday.database.net.data.AttributesData;
	import com.icday.database.net.data.ItemData;
	import com.icday.database.net.data.EquipData;
	import com.icday.database.net.data.PackData;
	import com.icday.database.net.data.GridData;
	import com.icday.database.net.data.RoleData;
	public class DataHash{
		public static const HASH:Array = new Array();
		HASH[1] = AttributesData;
		HASH[2] = ItemData;
		HASH[3] = EquipData;
		HASH[4] = PackData;
		HASH[5] = GridData;
		HASH[6] = RoleData;
		public function DataHash(){
		}

	}
}