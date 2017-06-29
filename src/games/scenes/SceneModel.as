package games.scenes
{
	import com.icday.database.csvs.DtScene;
	import com.icday.database.csvs.SceneCfg;
	import com.icday.database.net.response.EnterWorldResponse;
	import com.icday.mvcs.ModelBase;
	import com.icday.registers.CsvUtil;
	import com.icday.utils.Singleton;
	
	import flash.utils.ByteArray;
	
	public class SceneModel extends ModelBase
	{
		public var sceneId:int;
		
		private var sceneCfgMap:Object;
		public function SceneModel()
		{
			super();
			sceneCfgMap = CsvUtil.getObject("scene.dat");
		}
		
		public static function get instance():SceneModel
		{
			return Singleton.getInstance(SceneModel);
		}

		override protected function init():void
		{
			super.init();
	
		}
		
		private function onEnterWorld(cmd:int,status:int,bytes:ByteArray):void
		{
			var resp:EnterWorldResponse = new EnterWorldResponse(bytes);
			var arr:Array = resp.packs;
			var role:Object = resp.role;
		}
		
		private function onEnterScene(cmd:int,status:int,bytes:ByteArray):void
		{
			
		}
		
//		public function gotoMap(resp:EnterSceneResponse):void
//		{
//			
//		}
		
		public function getCfgById(sceneId:int):SceneCfg
		{
			return sceneCfgMap[sceneId];
		}
	}
}