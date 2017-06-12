package games.scenes
{
	import com.icday.database.net.consts.ProtocolConst;
	import com.icday.mvcs.Context;
	import com.icday.mvcs.IModule;
	import com.icday.mvcs.ModuleBase;
	
	import flash.events.Event;
	
	import games.globals.ContextEvent;
	import games.scenes.controllers.EnterSceneCommand;
	
	import morn.core.managers.ResLoader;
	
	public class SceneModule extends ModuleBase implements IModule
	{
		public function SceneModule()
		{
		}
		
		override public function startup():void
		{
			ResLoader.registParser(SceneParser.TYPE,SceneParser.Parser);
			addCommand(ProtocolConst.EnterWorld,EnterWorldCommand);
			addCommand(ProtocolConst.EnterScene,EnterSceneCommand);
			Context.instance.addEventListener(ContextEvent.ENTER_WORLD,onEnterWorld);
			
			SceneModel.instance.addEventListener(SceneModelEvent.ENTER_SCENE,onEnterScene);
		}
		
		protected function onEnterScene(event:Event):void
		{
			
		}
		
		protected function onEnterWorld(event:Event):void
		{
			var world:World = World.instance;
			world.init(App.sceneLayer);
			world.awake();
			
//			App.stage.addChild(world);
		}
	}
}