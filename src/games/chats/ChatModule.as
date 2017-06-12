package games.chats
{
	import com.icday.mvcs.Context;
	import com.icday.mvcs.ModuleBase;
	import com.icday.utils.AsyncViewProxy;
	
	import flash.events.Event;
	
	import games.globals.ContextEvent;
	import games.globals.Global;
	
	public class ChatModule extends ModuleBase
	{
		public function ChatModule()
		{
			super();
		}
		
		override public function startup():void
		{
			super.startup();
			AsyncViewProxy.regist(ChatMainView,Global.SKIN_PATH + "comp.swf",Global.SKIN_PATH + "chat.swf");
			Context.instance.addEventListener(ContextEvent.ENTER_WORLD,onEnterWorld);
		}
		
		protected function onEnterWorld(event:Event):void
		{
			AsyncViewProxy.toggleView(ChatMainView,App.uiLayer,1);
		}
		
	}
}