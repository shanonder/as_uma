package com.icday.database.net.consts
{
	import com.icday.util;
	
	import flash.utils.Dictionary;

	public class DefaultTypeConst
	{
		public static const type_byte:int = -1;
		public static const type_boolean:int = -2;
		public static const type_short:int = -3;
		public static const type_int:int = -4;
		public static const type_number:int = 5;
		public static const type_bigint:int = -6;
		public static const type_string:int = -7;
		public static const type_arraylist:int = -8;
		public function DefaultTypeConst()
		{
		}
		
		
		
		public static const type2name:Dictionary = new Dictionary();
		type2name[type_boolean] = "Boolean";
		type2name[type_int] = "int";
		type2name[type_number] = "Number";
		type2name[type_bigint] = "com.icday.util::BitInt";
	}
}