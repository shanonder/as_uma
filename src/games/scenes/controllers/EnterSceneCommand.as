package games.scenes.controllers
{
	import com.icday.mvcs.ICommand;
	
	import flash.utils.ByteArray;
	
	public class EnterSceneCommand implements ICommand
	{
		public function EnterSceneCommand()
		{
		}
		
		public function excute(cmd:int, status:int, data:ByteArray):void
		{
//			var resp:EnterSceneResponse = new EnterSceneResponse(data);
//			var model:SceneModel = SceneModel.instance;
//			model.sceneId = resp.sceneId;
//			model.dispatchEvent(new SceneModelEvent(SceneModelEvent.ENTER_SCENE));
//			Global.scene.load(dt);
		}
	}
}