package com.icday.model
{
	import com.icday.mvcs.ModelBase;
	import com.icday.utils.Singleton;
	
	import flash.external.ExternalInterface;
	
	import games.globals.Global;
	
	public class PlatModel extends ModelBase
	{
		public static function get instance():PlatModel{
			return Singleton.getInstance(PlatModel);
		}
		public function PlatModel()
		{
			super();
		}
		
		public function initUrl():void{
			if(ExternalInterface.available){
				
			}else{
				Global.appKey = "zys001";
			}
		}
	}
}