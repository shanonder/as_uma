package games.globals.views
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	public class AppContainer extends Sprite
	{
		public var uiLayer:Sprite;
		public function AppContainer()
		{
			super();
		}
		
		public function init(stage:Stage):void{
			uiLayer = new Sprite();
			stage.addChild(uiLayer);
		}
	}
}