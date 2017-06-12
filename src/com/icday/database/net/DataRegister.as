package com.icday.database.net {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import flash.net.registerClassAlias;
	import com.icday.database.net.data.AttributesData;
	import com.icday.database.net.data.ItemData;
	import com.icday.database.net.data.EquipData;
	import com.icday.database.net.data.PackData;
	import com.icday.database.net.data.GridData;
	import com.icday.database.net.data.RoleData;
	public class DataRegister{
		public static function regist():void{
			registerClassAlias("com.icday.database.net.data.AttributesData",AttributesData);
			registerClassAlias("com.icday.database.net.data.ItemData",ItemData);
			registerClassAlias("com.icday.database.net.data.EquipData",EquipData);
			registerClassAlias("com.icday.database.net.data.PackData",PackData);
			registerClassAlias("com.icday.database.net.data.GridData",GridData);
			registerClassAlias("com.icday.database.net.data.RoleData",RoleData);
		}

	}
}