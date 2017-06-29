package com.icday.registers
{
	import com.icday.CsvParser;
	import com.icday.database.csvs.DtItem;
	import com.icday.database.csvs.DtLayout;
	import com.icday.database.csvs.DtRole;
	import com.icday.database.csvs.DtScene;
	import com.icday.database.csvs.ItemCfg;
	import com.icday.database.csvs.LayoutCfg;
	import com.icday.database.csvs.RoleCfg;
	import com.icday.database.csvs.SceneCfg;
	
	import games.globals.Global;
	
	import morn.core.managers.ResLoader;

	public class CsvUtil
	{
		public function CsvUtil()
		{
		}
		
		public static const URLS:Array = [];
		
		public static function regist():void{
			
			ResLoader.registParser(CsvParser.CSV_Data,CsvParser.ParserData);
			ResLoader.registParser(CsvParser.CSV_PROPS,CsvParser.ParserProps);
			
			registClass("scene.dat",CsvParser.CSV_Data,SceneCfg);
			registClass("item.dat",CsvParser.CSV_Data,ItemCfg);
			registClass("role.dat",CsvParser.CSV_Data,RoleCfg);
			registClass("layout.dat",CsvParser.CSV_Data,LayoutCfg);
			
			registClass("lang.dat",CsvParser.CSV_PROPS);
			registClass("config.dat",CsvParser.CSV_PROPS);
		}
		
		private static function registClass(csvName:String, dataType:int , asClazz:Class = null):void{
			
			var url:String = Global.DATA_PATH + csvName;
			URLS.push({url:url,type:dataType});
			if(asClazz){
				CsvParser.registClass(url,asClazz);
			}
		}
		
		public static function getObject(name:String):Object{
			var obj:Object = ResLoader.getResLoaded(Global.DATA_PATH + name);
			return obj?obj.map:null;
		}
		public static function getList(name:String):Array{
			var obj:Object = ResLoader.getResLoaded(Global.DATA_PATH + name);
			return obj?obj.list:null;
		}

		
	}
}