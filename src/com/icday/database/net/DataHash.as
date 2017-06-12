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
	import flash.utils.Dictionary;
	public class DataHash{
		public static const Classname2Type:Dictionary = new Dictionary();
		public static const ClassName2Write:Dictionary = new Dictionary();
		public static const Type2Read:Dictionary = new Dictionary();

		Classname2Type["com.icday.database.net.data::AttributesData"] = 1;
		Classname2Type["com.icday.database.net.data::ItemData"] = 2;
		Classname2Type["com.icday.database.net.data::EquipData"] = 3;
		Classname2Type["com.icday.database.net.data::PackData"] = 4;
		Classname2Type["com.icday.database.net.data::GridData"] = 5;
		Classname2Type["com.icday.database.net.data::RoleData"] = 6;

		ClassName2Write["com.icday.database.net.data::AttributesData"] = AttributesData.write;
		ClassName2Write["com.icday.database.net.data::ItemData"] = ItemData.write;
		ClassName2Write["com.icday.database.net.data::EquipData"] = EquipData.write;
		ClassName2Write["com.icday.database.net.data::PackData"] = PackData.write;
		ClassName2Write["com.icday.database.net.data::GridData"] = GridData.write;
		ClassName2Write["com.icday.database.net.data::RoleData"] = RoleData.write;

		Type2Read[1] = AttributesData.read;
		Type2Read[2] = ItemData.read;
		Type2Read[3] = EquipData.read;
		Type2Read[4] = PackData.read;
		Type2Read[5] = GridData.read;
		Type2Read[6] = RoleData.read;

		public function DataHash(){
		}

	}
}