package com.icday.util
{
	import flash.utils.ByteArray;

	public class StringUtil
	{
		public function StringUtil()
		{
		}
		
		public static function GetStringLength(thisString : String) : Number{
			var thisStringBytsLength :ByteArray = new ByteArray();
			thisStringBytsLength.writeMultiByte(thisString,"utf-8");
			return thisStringBytsLength.length;
		}
	}
}